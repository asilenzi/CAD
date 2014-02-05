include <Parts.scad>
include <dimlines.scad>

DOC_SCALING_FACTOR = 300;
DOC_HEIGHT=800;
DIM_LINE_WIDTH=0.40;
DIM_FONTSCALE=0.40;
DOC_FRAME_POS=[-3, -7.0, DOC_HEIGHT];
DOC_FRAME_LENGTH=430;
DOC_FRAME_HEIGTH=320;
DOC_HEIGHT = 2;
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

dim_FEB_MODULE();
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

module dim_FEB_MODULE(){

    //SIDE
    translate([47,8,0])
    rotate([0,0,0])
    union(){
    FEB_2014();
    for ( j = [0 :  ASIC_NUMBER[1]-2] ){
          color("Black")
	  translate(FEB_2014_ASIC_CONNECTOR_POS+j*[0,ASIC_PITCH[1],0]+[0, 0, 100])
	  quote_left(length=ASIC_PITCH[1],distance=20,quote_type=DIM_CENTER);
    	}
    color("Black")
    translate(FEB_2014_ASIC_CONNECTOR_POS+7*[0,ASIC_PITCH[1],0]+[0, 0, 100])
    quote_left(length=FEB_2014_ASIC_CONNECTOR_DIM[1],distance=20,quote_type=DIM_CENTER);
    color("Black")
    translate(FEB_2014_PCB_POS+[0,FEB_2014_PCB_DIM[1],0]+[0, 0, 100])
    quote_up(length=FEB_2014_PCB_DIM[0],distance=40,quote_type=DIM_CENTER);
    color("Black")
    translate(FEB_2014_ASIC_CONNECTOR_POS+7*[0,ASIC_PITCH[1],0]+[0,FEB_2014_ASIC_CONNECTOR_DIM[1],0]+[0, 0, 100])
    quote_up(length=FEB_2014_ASIC_CONNECTOR_DIM[0],distance=45,quote_type=DIM_OVER);
    color("Black")
    translate(+[0, 0, 100])
    quote_up(length=FEB_2014_ASIC_CONNECTOR_DIM[0],distance=45,quote_type=DIM_OVER);
    }
    //FRONT
    translate([200,8,0])
    union(){
	rotate([0,90,0])
        FEB_2014();
    color("Black")
    translate(FEB_2014_PCB_POS+[0,FEB_2014_PCB_DIM[1],0]+[0, 0, 100])
    quote_up(length=FEB_2014_PCB_DIM[2],distance=20,quote_type=DIM_LEFT);
    color("Black")
    translate([FEB_2014_ASIC_CONNECTOR_POS[2],FEB_2014_ASIC_CONNECTOR_POS[1],0]+[0,7*ASIC_PITCH[1],0]+[0,FEB_2014_ASIC_CONNECTOR_DIM[1],0]+[0, 0, 100])
    quote_up(length=FEB_2014_ASIC_CONNECTOR_DIM[2],distance=FEB_2014_PCB_DIM[1]-(FEB_2014_ASIC_CONNECTOR_POS[1]+7*ASIC_PITCH[1]),quote_type=DIM_OVER);
    }
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
        "FEB/D",   // title
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
        "2014-1-8",        // Date
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
