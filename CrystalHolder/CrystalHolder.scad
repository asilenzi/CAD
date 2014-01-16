use <dimlines.scad>;
noswear_height=20;
noswear_depth=15;
noswear_width=17;

windowframe_depth=10;
windowframe_incline_ratio=.2; // 0=90degrees frame 1=45degrees bevel on the window frame
windowframe_width=10;
$fn=30;
pin_diameter=4.5;
pin_distance=7; //distance of the pin from the window
pin_height=4;
pin_relief_bevel_depth=0.5;

module noswear(){
union(){
linear_extrude(height =noswear_height, center = true){
polygon(points=[[0,0],[noswear_depth,0],[noswear_depth,noswear_width],[windowframe_depth,noswear_width],[windowframe_depth,noswear_width-windowframe_width],[0,noswear_width-windowframe_width-windowframe_incline_ratio*windowframe_depth]]);
}
translate([pin_distance,0,0])rotate([90,0,0])union(){
cylinder(h=pin_height,r=pin_diameter/2.);
cylinder(h=pin_relief_bevel_depth,r2=pin_diameter/2.,r1=pin_relief_bevel_depth+pin_diameter/2.);
}
}
}
/* shows all possibilities
        DIM_CENTER = 0;
        DIM_LEFT = 1;
        DIM_RIGHT = 2;
        DIM_OUTSIDE = 3;
*/
module dimtest(){
// A sample used to create the image above.
line(length=2, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,
    left_arrow=false, right_arrow=false);

translate([0, -0.25, 0])
line(length=2, width=DIM_LINE_WIDTH, height=DIM_HEIGHT, left_arrow=true,
    right_arrow=false);

translate([0, -0.5, 0])
line(length=2, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,
    left_arrow=false, right_arrow=true);

translate([0, -0.75, 0])
line(length=2, width=DIM_LINE_WIDTH, height=DIM_HEIGHT, left_arrow=true,
    right_arrow=true);
}

dimtest();
