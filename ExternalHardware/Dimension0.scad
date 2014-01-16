include <Parts.scad>
include <dimlines.scad>
DOC_SCALING_FACTOR = 300;
DOC_HEIGHT=800;
DIM_LINE_WIDTH=0.25;
DIM_FONTSCALE=0.20;
DOC_FRAME_POS=[-3, -7.0, DOC_HEIGHT];
DOC_FRAME_LENGTH=170;
DOC_FRAME_HEIGTH=140;
QUOTE_DISTANCE=5;
//translate([-20,-30,0])one_euro();
//MPPC();
//DETECTOR_MODULE();
//ASIC_MODULE();
//translate([-1.*ASIC_PITCH[0],0,0])
//rotate([0,0,180])
//translate(-1*ASIC_PITCH)
//ASIC_MODULE();

//spacer();
//EXT_CRYSTAL_MATRIX();
//EXT_SINGLE_CRYSTAL_2013();
//DETECTORS_PLUS_ASIC();
//electronics_assembly(mechanics=true,asics=true,crystal=false,mppc=false);
//electronics_assembly(FEB=false,mechanics=false,asics=false,crystal=false,mppc=true);
//electronics_assembly_2014(mechanics=true);
//electronics_assembly_2014(FEB=true,mechanics=true,asics=false,crystal=false,mppc=false);
//electronics_assembly_singleFEB_2014(FEB=true,mechanics=true,asics=false,crystal=false,mppc=false);
//electronics_assembly_singleFEB_2014(mechanics=true);
//FEB_2014();

dim_ASIC_MODULE();
translate([0, 0, 100])
frame_and_block();
//BIGFRAME();
//

//translate([0,300,0]) union(){
//electronics_assembly_singleFEB(mechanics=true,asics=true,crystal=true,mppc=true);
//SMALLFRAME_001();
//}


module frame_and_block(){
color("Black")
union() {
    draw_frame(length=DOC_FRAME_LENGTH, height=DOC_FRAME_HEIGTH, line_width=DIM_LINE_WIDTH * 2);
    color("Black")
    local_titleblock(length=DOC_FRAME_LENGTH, height=DOC_FRAME_HEIGTH);
}
}

module dim_ASIC_MODULE(){
    //BOTTOM
    translate([20,50,0])
    union(){
    rotate([180,0,0])
    ASIC_MODULE();
    color("Black")
    translate([ASIC_MODULE_004_FEB_CONNECTOR_POS[0],-1*(ASIC_MODULE_004_PCB_POS[1]+ASIC_MODULE_004_PCB_DIM[1]),-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[2]]+[0, 0, 100])
    quote_left(length=ASIC_MODULE_004_PCB_POS[1]+ASIC_MODULE_004_PCB_DIM[1]-(ASIC_MODULE_004_FEB_CONNECTOR_POS[1]+ASIC_MODULE_004_FEB_CONNECTOR_DIM[1]),distance=10,quote_type=DIM_LEFT);
    color("Black")
    translate([ASIC_MODULE_004_FEB_CONNECTOR_POS[0],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[1],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[2]]+[0,-1*ASIC_MODULE_004_FEB_CONNECTOR_DIM[1],0]+[0, 0, 100])
    quote_left(length=ASIC_MODULE_004_FEB_CONNECTOR_DIM[1],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate([ASIC_MODULE_004_FEB_CONNECTOR_POS[0],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[1],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[2]]+[0, 0, 100])
    quote_left(length=ASIC_MODULE_004_FEB_CONNECTOR_POS[1]-ASIC_MODULE_004_PCB_POS[1],distance=10,quote_type=DIM_RIGHT);
    color("Black")
    translate([ASIC_MODULE_004_PCB_POS[0],-1*ASIC_MODULE_004_PCB_POS[1],-1*ASIC_MODULE_004_PCB_POS[2]]+[0, 0, 100])
    quote_up(length=ASIC_MODULE_004_FEB_CONNECTOR_POS[0]-ASIC_MODULE_004_PCB_POS[0],distance=10,quote_type=DIM_LEFT);
    color("Black")
    translate([ASIC_MODULE_004_FEB_CONNECTOR_POS[0],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[1],-1*ASIC_MODULE_004_FEB_CONNECTOR_POS[2]]+[0, 0, 100])
    quote_up(length=ASIC_MODULE_004_FEB_CONNECTOR_DIM[0],distance=10+ASIC_MODULE_004_FEB_CONNECTOR_POS[1],quote_type=DIM_CENTER);
    color("Black")
    translate([ASIC_MODULE_004_PCB_POS[0],-1*ASIC_MODULE_004_PCB_POS[1],-1*ASIC_MODULE_004_PCB_POS[2]]+[ASIC_MODULE_004_PCB_DIM[0],-1*ASIC_MODULE_004_PCB_DIM[1],0]+[0, 0, 100])
    quote_right(length=ASIC_MODULE_004_PCB_DIM[1],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate([ASIC_MODULE_004_PCB_POS[0],-1*ASIC_MODULE_004_PCB_POS[1],-1*ASIC_MODULE_004_PCB_POS[2]]+[0,-1*ASIC_MODULE_004_PCB_DIM[1],0]+[0, 0, 100])
    quote_down(length=ASIC_MODULE_004_PCB_DIM[0],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate([ASIC_MODULE_004_HOLES_POSS[0][0],-1.*ASIC_MODULE_004_HOLES_POSS[0][1],-1.*ASIC_MODULE_004_HOLES_POSS[0][2]]+[0, 0, 100])
    circle_center(radius=ASIC_MODULE_004_HOLES_DIAM*0.5, size=DIM_HOLE_CENTER,line_width=DIM_LINE_WIDTH);
    color("Black")
    translate([ASIC_MODULE_004_HOLES_POSS[0][0],-1.*ASIC_MODULE_004_HOLES_POSS[0][1],-1.*ASIC_MODULE_004_HOLES_POSS[0][2]]+[0, 0, 100])
    union(){
        circle_center(radius=ASIC_MODULE_004_HOLES_DIAM*0.5, size=DIM_HOLE_CENTER,line_width=DIM_LINE_WIDTH);
	leader_line(angle=125., radius=ASIC_MODULE_004_HOLES_DIAM*0.5,angle_length=23, horz_line_length=4, direction=DIM_LEFT, line_width=DIM_LINE_WIDTH, text=str("r ",ASIC_MODULE_004_HOLES_DIAM*0.5),do_circle=false);
    }
    color("Black")
    translate([ASIC_MODULE_004_HOLES_POSS[0][0],-1.*ASIC_MODULE_004_HOLES_POSS[0][1],-1.*ASIC_MODULE_004_HOLES_POSS[0][2]]+[0, 0, 100])
    quote_up(length=ASIC_MODULE_004_HOLES_CENTERTOMARGIN,distance=20,quote_type=DIM_LEFT);
    }

    //FRONT
    translate([20,75,0])
    rotate([90,0,0])
    union(){
    ASIC_MODULE();
    }

    //TOP
    translate([20,90,0])
    union(){
    ASIC_MODULE();
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[4]+[0, 0, 100])
    quote_left(length=ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[0]+[0, 0, 100])
    quote_left(length=MPPC_PITCH[1],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate(ASIC_MODULE_004_PCB_POS+[ASIC_MODULE_004_MPPC_CONNECTOR_POSS[0][0],0,0]+[0, 0, 100])
    quote_left(length=ASIC_MODULE_004_MPPC_CONNECTOR_POSS[0][1]-ASIC_MODULE_004_PCB_POS[1],distance=10,quote_type=DIM_LEFT);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[4]+[0, ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1], 100])
    quote_up(length=ASIC_MODULE_004_MPPC_CONNECTOR_DIM[0],distance=5,quote_type=DIM_RIGHT);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[4]+[0, ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1], 100])
    quote_up(length=MPPC_PITCH[0],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[5]+[0, ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1], 100])
    quote_up(length=MPPC_PITCH[0],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[6]+[0, ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1], 100])
    quote_up(length=MPPC_PITCH[0],distance=10,quote_type=DIM_CENTER);
    color("Black")
    translate(ASIC_MODULE_004_MPPC_CONNECTOR_POSS[7]+[0, ASIC_MODULE_004_MPPC_CONNECTOR_DIM[1], 100])
    quote_up(length=ASIC_MODULE_004_PCB_DIM[0]-ASIC_MODULE_004_MPPC_CONNECTOR_POSS[7][0],distance=10,quote_type=DIM_CENTER);
    }
}

module quote_up(length,distance,quote_type){
union() {
        translate([0,distance,0])
        dimensions(length, DIM_LINE_WIDTH, loc=quote_type);
	// The following two lines are vertical lines that bracket the dimensions
	// left arrow
	rotate([0, 0, 90])
	line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
	translate([length,0, 0])
        rotate([0, 0, 90])
        line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
     }
}
module quote_down(length,distance,quote_type){
union() {
        translate([0,-1*distance,0])
        dimensions(length, DIM_LINE_WIDTH, loc=quote_type);
	// The following two lines are vertical lines that bracket the dimensions
	// left arrow
	rotate([0, 0, -90])
	line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
	translate([length, 0, 0])
        rotate([0, 0, -90])
        line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,
     left_arrow=false, right_arrow=false);
     }
}
module quote_left(length,distance,quote_type){
        translate([-1*distance,0,0])
union() {
	rotate([0,0,90])
        dimensions(length, DIM_LINE_WIDTH, loc=quote_type);
	// The following two lines are vertical lines that bracket the dimensions
	// left arrow
	line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
	translate([0,length, 0])
        line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,
     left_arrow=false, right_arrow=false);
     }
}
module quote_right(length,distance,quote_type){
        translate([distance,0,0])
	union() {
	rotate([0,0,90])
        dimensions(length, DIM_LINE_WIDTH, loc=quote_type);
	// The following two lines are vertical lines that bracket the dimensions
	// left arrow
	translate([-1*distance,0, 0])
	line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
	translate([-1*distance,length, 0])
        line(length=distance, width=DIM_LINE_WIDTH, height=DIM_HEIGHT,left_arrow=false, right_arrow=false);
     }
}

//  Sample part -- constants used
PART_LENGTH = 3.53;
PART_WIDTH = PART_LENGTH / 2;
PART_HEIGHT = .15;
HOLE_Y1_OFFSET = 1;
HOLE_Y2_OFFSET = 1.25;

HOLE1_RADIUS = .25;
HOLE2_RADIUS = .175;
HOLE1_XOFFSET = .65;
HOLE2_XOFFSET = 1.35;
HOLE3_XOFFSET = 2.25;
HOLE4_XOFFSET = 2.75;

// rotations used for dimensioning
ROTATION2 = [90, 0, 0];
ROTATION3 = [0, 90, 90];
ROTATION4 = [135, 45, 0];

ROT2_VIEW = [0, -2.5, 0];
ROT3_VIEW = [9, -2, 0];
ROT4_VIEW = [7, 2, 0];

DOC_HEIGHT = 2;



module show_samplepart() {

    sample_part();


    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([0, PART_WIDTH + DIM_SPACE * 3, 0])
        dimensions(HOLE1_XOFFSET, DIM_LINE_WIDTH, loc=DIM_OUTSIDE);

        translate([0, PART_WIDTH + DIM_SPACE * 6, 0])
        dimensions(HOLE2_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 9, 0])
        dimensions(HOLE3_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 12, 0])
        dimensions(HOLE4_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 15, 0])
        dimensions(PART_LENGTH, DIM_LINE_WIDTH);
    
        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_WIDTH + DIM_SPACE, 0, 0])
            line(length=DIM_SPACE * 17, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_WIDTH + DIM_SPACE, -PART_LENGTH, 0])
            line(length=DIM_SPACE * 17, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            // extension lines for holes
            translate([PART_WIDTH - .4, -HOLE1_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y1_OFFSET, width=DIM_LINE_WIDTH,
                height=.01, left_arrow=false, right_arrow=false);

            translate([PART_WIDTH - .4, -HOLE2_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y1_OFFSET + DIM_SPACE * 3,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);

            translate([PART_WIDTH - .2, -HOLE3_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y2_OFFSET + DIM_SPACE * 7,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);

            translate([PART_WIDTH - .2, -HOLE4_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y2_OFFSET + DIM_SPACE * 10,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);}
        }


    // right side
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    rotate([0, 0, -90])
    union() {

        translate([-HOLE_Y1_OFFSET, PART_LENGTH + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(HOLE_Y1_OFFSET, DIM_LINE_WIDTH);

        translate([-HOLE_Y2_OFFSET, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
        dimensions(HOLE_Y2_OFFSET, DIM_LINE_WIDTH);

        translate([-PART_WIDTH, PART_LENGTH + DIM_SPACE * 9, DIM_HEIGHT])
        dimensions(PART_WIDTH, DIM_LINE_WIDTH);
    }

    // extension lines
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([PART_LENGTH + DIM_SPACE , PART_WIDTH, DIM_HEIGHT])
        line(length=1, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH - DIM_SPACE * 4, HOLE_Y1_OFFSET, DIM_HEIGHT])
        line(length=DIM_SPACE * 8, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH - DIM_SPACE * 4, HOLE_Y2_OFFSET, DIM_HEIGHT])
        line(length=DIM_SPACE * 11, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH + DIM_SPACE, 0, DIM_HEIGHT])
        line(length=1, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

    }

    color(GREY)
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([HOLE1_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        circle_center(HOLE1_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE2_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        circle_center(HOLE1_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE3_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        circle_center(HOLE2_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE4_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        circle_center(HOLE2_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

    }

    // leader line for holes
    leader1_text = str("2X 0 ", HOLE1_RADIUS * 2);
    leader2_text = str("2X 0 ", HOLE2_RADIUS * 2);
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([HOLE1_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        leader_line(angle=-70, radius=HOLE1_RADIUS, angle_length=DIM_SPACE * 12,
            horz_line_length=.25, line_width=DIM_LINE_WIDTH, text=leader1_text);

        translate([HOLE3_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        leader_line(angle=-70, radius=HOLE2_RADIUS,
                    angle_length=DIM_SPACE * 15.5, horz_line_length=.25,
                    line_width=DIM_LINE_WIDTH, text=leader2_text);

    }
    // end of initial dimension lines

    // rotate 90 degrees around the y axis
    translate(ROT2_VIEW)
    rotate(ROTATION2)
    sample_part();

    // dimension lines on the TOP
    color("Black")
    translate(ROT2_VIEW)
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([0, PART_HEIGHT + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(PART_LENGTH / 2, DIM_LINE_WIDTH, loc=DIM_CENTER);

        translate([0, PART_HEIGHT + DIM_SPACE * 6, DIM_HEIGHT])
        dimensions(PART_LENGTH, DIM_LINE_WIDTH);


        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_HEIGHT + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_HEIGHT + DIM_SPACE, -PART_LENGTH / 2, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_HEIGHT + DIM_SPACE, -PART_LENGTH, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

        }

        // right side
        color("Black")
        rotate([0, 0, -90])
        union() {

            translate([-PART_HEIGHT * 2, PART_LENGTH + DIM_SPACE * 3,
                DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=true);

            translate([PART_HEIGHT, PART_LENGTH + DIM_SPACE * 3, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT));

            translate([-PART_HEIGHT, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
            line(length=PART_HEIGHT * 2, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=true, right_arrow=true);

            // leader line for dimension
            translate([PART_HEIGHT, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT * 2));
        }

        // extension lines
        color("Black")
        union() {
            translate([PART_LENGTH + DIM_SPACE, PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_LENGTH + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);


            translate([PART_LENGTH + DIM_SPACE, -PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);
        }
    }


    translate(ROT3_VIEW)
    rotate(ROTATION3)
    sample_part();

    color("Black")
    translate(ROT3_VIEW)
    translate([0, 0, DOC_HEIGHT])
    union() {

        translate([-PART_WIDTH, PART_HEIGHT + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(PART_WIDTH, DIM_LINE_WIDTH, loc=DIM_CENTER);


        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_HEIGHT + DIM_SPACE, PART_WIDTH, DIM_HEIGHT])
            line(length=DIM_SPACE * 4);

            translate([PART_HEIGHT + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 4);
        }


       // right side
        color("Black")
        rotate([0, 0, -90])
        union() {

            translate([-PART_HEIGHT * 2, DIM_SPACE * 3, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=true);

            translate([PART_HEIGHT, DIM_SPACE * 3, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT));

            translate([-PART_HEIGHT, DIM_SPACE * 6, DIM_HEIGHT])
            line(length=PART_HEIGHT * 2, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=true, right_arrow=true);

            // leader line for dimension
            translate([PART_HEIGHT, DIM_SPACE * 6, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT * 2));
        }

        // extension lines
        color("Black")
        union() {
            translate([DIM_SPACE, PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6);

            translate([DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 3);


            translate([DIM_SPACE, -PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6);

        }

    }


    translate(ROT4_VIEW)
    rotate(ROTATION4)
    sample_part();

}


module draw_frame(length, height, line_width=DIM_LINE_WIDTH) {

    line(length=length, width=line_width);

    translate([0, height, 0])
    line(length=length, width=line_width);

    translate([line_width / 2, line_width / 2, 0])
    rotate([0, 0, 90])
    line(length=height - line_width, width=line_width);

    translate([length - line_width / 2, line_width / 2, 0])
    rotate([0, 0, 90])
    line(length=height - line_width, width=line_width);

}

//show_samplepart();

module local_titleblock(length,height) {

    row_height = 20;

    cols = [-.5, 100, 154, 270];
    title_width = cols[3];

    rows = [0, -row_height, -row_height * 2, -row_height * 3, -row_height * 4,
            -row_height * 5, -row_height * 6, -row_height * 7
    ];

    // spacing tweaks to fit into the blocks
    desc_x = 2; // column offset for start of small text
    desc_y = -5; // row offset for start of small text
    det_x = 15;  // col offset for start of detail text
    det_y = -15;  // row offset for start of detail text
    desc_size = .75; // relative size of description text


    lines = [
        // horizontal lines
        [cols[0], rows[0], DIM_HORZ, title_width, 1],

        [cols[2], rows[1], DIM_HORZ, cols[3] - cols[2] - .5, 1],
        [cols[0], rows[2], DIM_HORZ, cols[1] - cols[0] - .5, 1],
        [cols[0], rows[3], DIM_HORZ, cols[3] - .5, 1],
        [cols[0], rows[4], DIM_HORZ, cols[2] - .5, 1],
        [cols[0], rows[5], DIM_HORZ, cols[3] - .5, 1],
        [cols[0], rows[6], DIM_HORZ, cols[2] - .5, 1],
        [cols[0], rows[7], DIM_HORZ, cols[2] - .5, 1],

        [cols[0], rows[7], DIM_HORZ, title_width, 1],

        // vertical lines
        [cols[0], rows[0], DIM_VERT, -rows[7], 1],
        [cols[1], rows[0], DIM_VERT, -rows[7], 1],
        [cols[2], rows[0], DIM_VERT, -rows[7], 1],
        [cols[3], rows[0], DIM_VERT, -rows[7], 1],
    ];

    part_desc = ["Material", "Finish", "Weight", "Part No."];
    doc_desc = ["Drawing Number",
                    "Created by",
                    "Reviewed by",
                    "Date of issue"
    ];

    // aspects of the part
    part_details = [
        "FEB/A",   // title
        "PCB ",  // material
        " ",                // finish
        "",              // weight
        "",              // part no
    ];

    // aspects documenting the creation of the part
    doc_details = [
        "0",             // Drawing No.
        "A. Silenzi",        // Created by
        " ",                // Reviewd by
        "2014-1-6",        // Date
    ];

    // the organization making the part
    org_details = [
        "",
        "DESY",
        ""
    ];

    descs = [

        // part description
        [cols[0] + desc_x, rows[2] + desc_y, DIM_HORZ, part_desc[0], desc_size],
        [cols[0] + desc_x, rows[3] + desc_y, DIM_HORZ, part_desc[1], desc_size],
        [cols[0] + desc_x, rows[4] + desc_y, DIM_HORZ, part_desc[2], desc_size],
        [cols[0] + desc_x, rows[5] + desc_y, DIM_HORZ, part_desc[3], desc_size],

        // documentation description
        [cols[1] + desc_x, rows[3] + desc_y, DIM_HORZ, doc_desc[0], desc_size],
        [cols[1] + desc_x, rows[4] + desc_y, DIM_HORZ, doc_desc[1], desc_size],
        [cols[1] + desc_x, rows[5] + desc_y, DIM_HORZ, doc_desc[2], desc_size],
        [cols[1] + desc_x, rows[6] + desc_y, DIM_HORZ, doc_desc[3], desc_size],
   ];

    details = [
        [cols[0] + desc_x, rows[0] + det_y, DIM_HORZ, part_details[0], 1.5],
        [cols[0] + desc_x, rows[2] + det_y, DIM_HORZ, part_details[1], 1],
        [cols[0] + desc_x, rows[3] + det_y, DIM_HORZ, part_details[2], 1],
        [cols[0] + desc_x, rows[4] + det_y, DIM_HORZ, part_details[3], 1],
        [cols[0] + desc_x, rows[5] + det_y, DIM_HORZ, part_details[4], 1],

        [cols[1] + desc_x * 2, rows[3] + det_y, DIM_HORZ, doc_details[0], 1],
        [cols[1] + desc_x * 2, rows[4] + det_y, DIM_HORZ, doc_details[1], 1],
        [cols[1] + desc_x * 2, rows[5] + det_y, DIM_HORZ, doc_details[2], 1],
        [cols[1] + desc_x * 2, rows[6] + det_y, DIM_HORZ, doc_details[3], 1],

        // Organization Details
        [cols[1] + desc_x, rows[1] + det_y, DIM_HORZ, org_details[0], 1.5],
        [cols[2] + desc_x, rows[0] + det_y, DIM_HORZ, org_details[1], 1.5],
        [cols[2] + desc_x, rows[1] + det_y, DIM_HORZ, org_details[2], 1],

    ];
//    translate([length-1*title_width,row_height*7,0])

    translate([length-DIM_LINE_WIDTH*title_width ,DIM_LINE_WIDTH*7*row_height,0])
    titleblock(lines, descs, details);

//    revisions = [
//        ["1a", "2013-4-1", "ds"],
//        ["1b", "2013-4-2", "ds"],
//        ["2a", "2013-4-3", "ds"],
//        ["3a", "2013-4-5", "ds"],
//        ["4a", "2013-4-15", "ds"],
//    ];
//
//    rotate([0, 0, 90])
//   sample_revisionblock(revisions);

}
