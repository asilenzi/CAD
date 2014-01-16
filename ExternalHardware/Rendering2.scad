include <Parts.scad>

translate([-20,-30,0])one_euro();
//MPPC();
//DETECTOR_MODULE();
//ASIC_MODULE();
//translate([-1.*ASIC_PITCH[0],0,0])
//ASIC_MODULE();
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
//electronics_assembly_2014();
//electronics_assembly_singleFEB_2014(FEB=true,mechanics=true,asics=false,crystal=false,mppc=false);
electronics_assembly_singleFEB_2014(FEB=true,mechanics=true,asics=false,crystal=false,mppc=false);
//FEB_2014();

//BIGFRAME();
//

//translate([0,300,0]) union(){
//electronics_assembly_singleFEB(mechanics=true,asics=true,crystal=true,mppc=true);
//SMALLFRAME_001();
//}
