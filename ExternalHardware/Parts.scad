//
//  EndoTOFPET-US: External Plate
//  Single Components and sub assemblies
//
// 
//
// alessandro.silenzi@desy.de
//
seethrough_crystals=true;
$fn=20;
delta=0.04;
//MPPC();
//DETECTOR_MODULE();
//ASIC_MODULE();
electronics_assembly();
//electronics_assembly_singleFEB(asics=true,crystal=true,mppc=true);

module electronics_assembly(){
electronics_assembly_FEB_POS=[0,0,0];
electronics_assembly_FEB_PITCH=[0,62,0];
for ( i = [0 : 3] )
    translate([0,i*electronics_assembly_FEB_PITCH[1],0]+electronics_assembly_FEB_POS)
    electronics_assembly_singleFEB();
}

module electronics_assembly_singleFEB(asics=true,crystal=true,mppc=true){
electronics_assembly_singleFEB_DETECTOR_POS=[0,0,0];
electronics_assembly_singleFEB_DETECTOR_PITCH=[30,30,0];
electronics_assembly_singleFEB_FEB_POS=[0,0,-20];
for ( i = [0 : 7] )
{
for ( j = [0 : 1] )
{
    translate([i*electronics_assembly_singleFEB_DETECTOR_PITCH[0],j*electronics_assembly_singleFEB_DETECTOR_PITCH[1], 0]+electronics_assembly_singleFEB_DETECTOR_POS)
    DETECTORS_PLUS_ASIC(asics=asics,mppc=mppc,crystal=crystal);
}
}
translate(electronics_assembly_singleFEB_FEB_POS)
FEB();
}


// module for a single S12643-050CN MPPC array
module S12643_050CN(){
S12643_050CN_PCB_DIM=[14.3,14.3,1];
S12643_050CN_PCB_POS=[0,0,0];
S12643_050CN_PCB_ALPHA=1.;
S12643_050CN_PCB_COLOR="Lime Green";
S12643_050CN_MPPC_PITCH=[3.6,3.6,0];
S12643_050CN_MPPC_DIM=[3,3,0.3];
S12643_050CN_MPPC_POS=[0.25,0.25,S12643_050CN_PCB_DIM[2]];
S12643_050CN_MPPC_ALPHA=1.;
S12643_050CN_MPPC_COLOR="DarkBlue";
S12643_050CN_EPOXY_DIM=[S12643_050CN_PCB_DIM[0],S12643_050CN_PCB_DIM[1],0.55];
S12643_050CN_EPOXY_POS=S12643_050CN_PCB_POS+[0,0,S12643_050CN_PCB_DIM[2]];
S12643_050CN_EPOXY_ALPHA=0.1;
S12643_050CN_EPOXY_COLOR="White";
S12643_050CN_CONNECTOR_DIM=[9.58,3.7,3.1];
S12643_050CN_CONNECTOR_POS=S12643_050CN_PCB_DIM*0.5-S12643_050CN_CONNECTOR_DIM/2-[0,0,S12643_050CN_PCB_DIM[2]*0.5+S12643_050CN_CONNECTOR_DIM[2]/2];
S12643_050CN_CONNECTOR_ALPHA=1.;
S12643_050CN_CONNECTOR_COLOR="Black";


//PCB
translate(S12643_050CN_PCB_POS)
color(S12643_050CN_PCB_COLOR,alpha=S12643_050CN_PCB_ALPHA)
cube(size = S12643_050CN_PCB_DIM,center=false);
//MPPCs
for(i=[0:3])
{ 
	for(j=[0:3]){
// here should just work a matrix multiplication
		translate(S12643_050CN_MPPC_POS+[S12643_050CN_MPPC_PITCH[0]*i,S12643_050CN_MPPC_PITCH[1]*j,0])
		color(S12643_050CN_MPPC_COLOR,alpha=S12643_050CN_MPPC_ALPHA)
		cube(size = S12643_050CN_MPPC_DIM,center=false);
	}
}
//EPOXY
translate(S12643_050CN_EPOXY_POS)
color(S12643_050CN_EPOXY_COLOR,alpha=S12643_050CN_EPOXY_ALPHA)
cube(size = S12643_050CN_EPOXY_DIM,center=false);
// CONNECTOR
translate(S12643_050CN_CONNECTOR_POS)
color(S12643_050CN_CONNECTOR_COLOR,alpha=S12643_050CN_CONNECTOR_ALPHA)
cube(size = S12643_050CN_CONNECTOR_DIM,center=false);

}

module EXT_SINGLE_CRYSTAL_2013(wrapped=true){
EXT_SINGLE_CRYSTAL_DIM=[3.5,3.5,15];
EXT_SINGLE_CRYSTAL_POS=[0.025,0.025,0];
EXT_SINGLE_CRYSTAL_COLOR="Gainsboro";
EXT_SINGLE_CRYSTAL_ALPHA=.0;
EXT_SINGLE_CRYSTAL_WRAPPING_DIM=[0.025,3.55,15];
EXT_SINGLE_CRYSTAL_WRAPPING_POS=[0.,0.,0];
EXT_SINGLE_CRYSTAL_WRAPPING_COLOR="White";
EXT_SINGLE_CRYSTAL_WRAPPING_ALPHA=1.0;
//CRYSTAL
if(seethrough_crystals==false){
translate(EXT_SINGLE_CRYSTAL_POS)
color(EXT_SINGLE_CRYSTAL_COLOR,alpha=EXT_SINGLE_CRYSTAL_ALPHA)
cube(size = EXT_SINGLE_CRYSTAL_DIM,center=false);
}
//WRAPPING
if(wrapped){
translate(EXT_SINGLE_CRYSTAL_WRAPPING_POS)
color(EXT_SINGLE_CRYSTAL_WRAPPING_COLOR,alpha=EXT_SINGLE_CRYSTAL_WRAPPING_ALPHA)
cube(size = EXT_SINGLE_CRYSTAL_WRAPPING_DIM,center=false);

translate(EXT_SINGLE_CRYSTAL_WRAPPING_POS+[EXT_SINGLE_CRYSTAL_DIM[0]+EXT_SINGLE_CRYSTAL_POS[1],0,0])
color(EXT_SINGLE_CRYSTAL_WRAPPING_COLOR,alpha=EXT_SINGLE_CRYSTAL_WRAPPING_ALPHA)
cube(size = EXT_SINGLE_CRYSTAL_WRAPPING_DIM,center=false);

translate(EXT_SINGLE_CRYSTAL_WRAPPING_POS)
color(EXT_SINGLE_CRYSTAL_WRAPPING_COLOR,alpha=EXT_SINGLE_CRYSTAL_WRAPPING_ALPHA)
cube(size = [EXT_SINGLE_CRYSTAL_WRAPPING_DIM[1],EXT_SINGLE_CRYSTAL_WRAPPING_DIM[0],EXT_SINGLE_CRYSTAL_WRAPPING_DIM[2]],center=false);

translate(EXT_SINGLE_CRYSTAL_WRAPPING_POS+[0,EXT_SINGLE_CRYSTAL_WRAPPING_DIM[0]+EXT_SINGLE_CRYSTAL_DIM[1],0])
color(EXT_SINGLE_CRYSTAL_WRAPPING_COLOR,alpha=EXT_SINGLE_CRYSTAL_WRAPPING_ALPHA)
cube(size = [EXT_SINGLE_CRYSTAL_WRAPPING_DIM[1],EXT_SINGLE_CRYSTAL_WRAPPING_DIM[0],EXT_SINGLE_CRYSTAL_WRAPPING_DIM[2]],center=false);
}
}

module EXT_CRYSTAL_MATRIX_2013(wrapped=true){
EXT_CRYSTAL_MATRIX_PITCH=[3.55,3.55,0];
EXT_CRYSTAL_MATRIX_POS=[0.05,0.05,0];
EXT_CRYSTAL_MATRIX_DIM=[14.2,14.2,15];
EXT_CRYSTAL_MATRIX_WRAPPING_POS=[0,0,0];
EXT_CRYSTAL_MATRIX_WRAPPING_DIM=[0.05,14.3,15];
EXT_CRYSTAL_MATRIX_WRAPPING_COLOR="White";
EXT_CRYSTAL_MATRIX_WRAPPING_ALPHA=1.;
for(i=[0:3])
{ 
	for(j=[0:3]){
		// here should just work a matrix multiplication
		translate(EXT_CRYSTAL_MATRIX_POS+[EXT_CRYSTAL_MATRIX_PITCH[0]*i,EXT_CRYSTAL_MATRIX_PITCH[1]*j,0])
		EXT_SINGLE_CRYSTAL_2013(wrapped);
	}
}

if(wrapped){
	echo("External crystal matrix extra wrapping");
	translate(EXT_CRYSTAL_MATRIX_WRAPPING_POS)
	color(EXT_CRYSTAL_MATRIX_WRAPPING_COLOR,alpha=EXT_CRYSTAL_MATRIX_WRAPPING_ALPHA)
	cube(size = EXT_CRYSTAL_MATRIX_WRAPPING_DIM,center=false);

	translate(EXT_CRYSTAL_MATRIX_WRAPPING_POS+[EXT_CRYSTAL_MATRIX_DIM[0]+EXT_CRYSTAL_MATRIX_POS[1],0,0])
	color(EXT_CRYSTAL_MATRIX_WRAPPING_COLOR,alpha=EXT_CRYSTAL_MATRIX_WRAPPING_ALPHA)
	cube(size = EXT_CRYSTAL_MATRIX_WRAPPING_DIM,center=false);

	translate(EXT_CRYSTAL_MATRIX_WRAPPING_POS)
	color(EXT_CRYSTAL_MATRIX_WRAPPING_COLOR,alpha=EXT_CRYSTAL_MATRIX_WRAPPING_ALPHA)
	cube(size = [EXT_CRYSTAL_MATRIX_WRAPPING_DIM[1],EXT_CRYSTAL_MATRIX_WRAPPING_DIM[0],EXT_CRYSTAL_MATRIX_WRAPPING_DIM[2]],center=false);

	translate(EXT_CRYSTAL_MATRIX_WRAPPING_POS+[0,EXT_CRYSTAL_MATRIX_WRAPPING_DIM[0]+EXT_CRYSTAL_MATRIX_DIM[1],0])
	color(EXT_CRYSTAL_MATRIX_WRAPPING_COLOR,alpha=EXT_CRYSTAL_MATRIX_WRAPPING_ALPHA)
	cube(size = [EXT_CRYSTAL_MATRIX_WRAPPING_DIM[1],EXT_CRYSTAL_MATRIX_WRAPPING_DIM[0],EXT_CRYSTAL_MATRIX_WRAPPING_DIM[2]],center=false);
}
}


// This renaming helps in case I will extend to other MPPCs
module EXT_CRYSTAL_MATRIX(){
EXT_CRYSTAL_MATRIX_2013(true);
//EXT_SINGLE_CRYSTAL_2013();
}

// This renaming helps in case I will extend to other MPPCs
module MPPC(){
S12643_050CN();
}


module DETECTOR_MODULE(crystal=true,mppc=true){
CRYSTAL_POS=[0,0,1.65];
if(crystal){
translate(CRYSTAL_POS)
EXT_CRYSTAL_MATRIX();
}
if(mppc){
MPPC();
}
}

module ASIC_MODULE(){
//ASIC_MODULE_001();
ASIC_MODULE_002();
}

module DETECTORS_PLUS_ASIC(asics=true,crystal=true,mppc=true){
//ASIC_MODULE_PCB_DIM=[29.,29.,3];
ASIC_MODULE_PCB_DIM=[29.,29.,18];
ASIC_MODULE_MPPC_CONNECTOR_DIM=[9.58,3.7,3.1];
ASIC_MODULE_MPPC_CONNECTOR_CENT=[-.10,-0.10,-3.5];
ASIC_MODULE_MPPC_CONNECTOR_POSS=[
[ASIC_MODULE_PCB_DIM[0]/2.,ASIC_MODULE_PCB_DIM[1]/2.,ASIC_MODULE_PCB_DIM[2]]-ASIC_MODULE_MPPC_CONNECTOR_CENT,
[ASIC_MODULE_PCB_DIM[0]*0/2.,ASIC_MODULE_PCB_DIM[1]/2.,ASIC_MODULE_PCB_DIM[2]]-ASIC_MODULE_MPPC_CONNECTOR_CENT,
[ASIC_MODULE_PCB_DIM[0]/2.,ASIC_MODULE_PCB_DIM[1]*0/2.,ASIC_MODULE_PCB_DIM[2]]-ASIC_MODULE_MPPC_CONNECTOR_CENT,
[ASIC_MODULE_PCB_DIM[0]*0/2.,ASIC_MODULE_PCB_DIM[1]*0/2.,ASIC_MODULE_PCB_DIM[2]]-ASIC_MODULE_MPPC_CONNECTOR_CENT,
];

if(asics){
ASIC_MODULE();
}
for(i=ASIC_MODULE_MPPC_CONNECTOR_POSS)
{
translate(i)
DETECTOR_MODULE(crystal,mppc);
}

}

//translate(_POS)
//color(_COLOR,alpha=_ALPHA)
//cube(size = _DIM,center=false);


module ASIC_MODULE_001(){
ASIC_MODULE_001_PCB_DIM=[29.,29.,2];
ASIC_MODULE_001_PCB_POS=[0,0,0];
ASIC_MODULE_001_PCB_ALPHA=1.;
ASIC_MODULE_001_PCB_COLOR="Lime Green";
ASIC_MODULE_001_MPPC_CONNECTOR_DIM=[9.58,3.7,3.1];
ASIC_MODULE_001_MPPC_CONNECTOR_CENT=[ASIC_MODULE_001_MPPC_CONNECTOR_DIM[0]/2.,ASIC_MODULE_001_MPPC_CONNECTOR_DIM[1]/2.,0];
ASIC_MODULE_001_MPPC_CONNECTOR_POSS=[
[ASIC_MODULE_001_PCB_DIM[0]/4.,ASIC_MODULE_001_PCB_DIM[1]/4.,ASIC_MODULE_001_PCB_DIM[2]]-ASIC_MODULE_001_MPPC_CONNECTOR_CENT+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_PCB_DIM[0]*3/4.,ASIC_MODULE_001_PCB_DIM[1]/4.,ASIC_MODULE_001_PCB_DIM[2]]-ASIC_MODULE_001_MPPC_CONNECTOR_CENT+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_PCB_DIM[0]/4.,ASIC_MODULE_001_PCB_DIM[1]*3/4.,ASIC_MODULE_001_PCB_DIM[2]]-ASIC_MODULE_001_MPPC_CONNECTOR_CENT+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_PCB_DIM[0]*3/4.,ASIC_MODULE_001_PCB_DIM[1]*3/4.,ASIC_MODULE_001_PCB_DIM[2]]-ASIC_MODULE_001_MPPC_CONNECTOR_CENT+ASIC_MODULE_001_PCB_POS
];
ASIC_MODULE_001_MPPC_CONNECTOR_ALPHA=1.;
ASIC_MODULE_001_MPPC_CONNECTOR_COLOR="Black";

ASIC_MODULE_001_HOLES_DIAM=2.2;
ASIC_MODULE_001_HOLES_CENTERTOMARGIN=1.2+ASIC_MODULE_001_HOLES_DIAM/2.;
ASIC_MODULE_001_HOLES_CENT=[ASIC_MODULE_001_MPPC_CONNECTOR_DIM[0]/2.,ASIC_MODULE_001_MPPC_CONNECTOR_DIM[1]/2.,0];
ASIC_MODULE_001_HOLES_POSS=[
[ASIC_MODULE_001_HOLES_CENTERTOMARGIN,ASIC_MODULE_001_HOLES_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_PCB_DIM[0]-ASIC_MODULE_001_HOLES_CENTERTOMARGIN,ASIC_MODULE_001_HOLES_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_HOLES_CENTERTOMARGIN,ASIC_MODULE_001_PCB_DIM[1]-ASIC_MODULE_001_HOLES_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_001_PCB_POS,
[ASIC_MODULE_001_PCB_DIM[0]-ASIC_MODULE_001_HOLES_CENTERTOMARGIN,ASIC_MODULE_001_PCB_DIM[1]-ASIC_MODULE_001_HOLES_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_001_PCB_POS,
];
ASIC_MODULE_001_FEB_CONNECTOR_DIM=[5,12,13];
ASIC_MODULE_001_FEB_CONNECTOR_POS=[ASIC_MODULE_001_PCB_DIM[0]/8.,(ASIC_MODULE_001_PCB_DIM[1]-ASIC_MODULE_001_FEB_CONNECTOR_DIM[1])/2.,-1*ASIC_MODULE_001_FEB_CONNECTOR_DIM[2]]+ASIC_MODULE_001_PCB_POS;
ASIC_MODULE_001_FEB_CONNECTOR_ALPHA=1.;
ASIC_MODULE_001_FEB_CONNECTOR_COLOR="Black";

ASIC_MODULE_001_ASIC_DIM=[10,6,1];
ASIC_MODULE_001_ASIC_POS=[ASIC_MODULE_001_PCB_DIM[0]*4.2/8.,(ASIC_MODULE_001_PCB_DIM[1]-ASIC_MODULE_001_ASIC_DIM[1])/2.,-1*ASIC_MODULE_001_ASIC_DIM[2]]+ASIC_MODULE_001_PCB_POS;
ASIC_MODULE_001_ASIC_ALPHA=1.;
ASIC_MODULE_001_ASIC_COLOR="Gray";

difference(){
translate(ASIC_MODULE_001_PCB_POS)
color(ASIC_MODULE_001_PCB_COLOR,alpha=ASIC_MODULE_001_PCB_ALPHA)
cube(size = ASIC_MODULE_001_PCB_DIM,center=false);
for(i=ASIC_MODULE_001_HOLES_POSS){
translate(i)
cylinder(r=ASIC_MODULE_001_HOLES_DIAM/2.,h=ASIC_MODULE_001_PCB_DIM[2]+2*delta);
}

}
translate(ASIC_MODULE_001_FEB_CONNECTOR_POS)
color(ASIC_MODULE_001_FEB_CONNECTOR_COLOR,alpha=ASIC_MODULE_001_FEB_CONNECTOR_ALPHA)
cube(size = ASIC_MODULE_001_FEB_CONNECTOR_DIM,center=false);

translate(ASIC_MODULE_001_ASIC_POS)
color(ASIC_MODULE_001_ASIC_COLOR,alpha=ASIC_MODULE_001_ASIC_ALPHA)
cube(size = ASIC_MODULE_001_ASIC_DIM,center=false);

for(i=ASIC_MODULE_001_MPPC_CONNECTOR_POSS)
{
translate(i)
color(ASIC_MODULE_001_MPPC_CONNECTOR_COLOR,alpha=ASIC_MPPC_MODULE_CONNECTOR_ALPHA)
cube(size = ASIC_MODULE_001_MPPC_CONNECTOR_DIM,center=false);

}
}

module ASIC_MODULE_002(){
ASIC_MODULE_002_PCB1_DIM=[29.,29.,2];
ASIC_MODULE_002_PCB1_POS=[0,0,15];
ASIC_MODULE_002_PCB1_ALPHA=1.;
ASIC_MODULE_002_PCB1_COLOR="Lime Green";
ASIC_MODULE_002_MPPC_CONNECTOR_DIM=[9.58,3.7,3.1];
ASIC_MODULE_002_MPPC_CONNECTOR_CENT=[ASIC_MODULE_002_MPPC_CONNECTOR_DIM[0]/2.,ASIC_MODULE_002_MPPC_CONNECTOR_DIM[1]/2.,0];
ASIC_MODULE_002_MPPC_CONNECTOR_POSS=[
[ASIC_MODULE_002_PCB1_DIM[0]/4.,ASIC_MODULE_002_PCB1_DIM[1]/4.,ASIC_MODULE_002_PCB1_DIM[2]]-ASIC_MODULE_002_MPPC_CONNECTOR_CENT+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_PCB1_DIM[0]*3/4.,ASIC_MODULE_002_PCB1_DIM[1]/4.,ASIC_MODULE_002_PCB1_DIM[2]]-ASIC_MODULE_002_MPPC_CONNECTOR_CENT+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_PCB1_DIM[0]/4.,ASIC_MODULE_002_PCB1_DIM[1]*3/4.,ASIC_MODULE_002_PCB1_DIM[2]]-ASIC_MODULE_002_MPPC_CONNECTOR_CENT+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_PCB1_DIM[0]*3/4.,ASIC_MODULE_002_PCB1_DIM[1]*3/4.,ASIC_MODULE_002_PCB1_DIM[2]]-ASIC_MODULE_002_MPPC_CONNECTOR_CENT+ASIC_MODULE_002_PCB1_POS
];
ASIC_MODULE_002_MPPC_CONNECTOR_ALPHA=1.;
ASIC_MODULE_002_MPPC_CONNECTOR_COLOR="Black";

ASIC_MODULE_002_HOLES1_DIAM=2.2;
ASIC_MODULE_002_HOLES1_CENTERTOMARGIN=1.2+ASIC_MODULE_002_HOLES1_DIAM/2.;
ASIC_MODULE_002_HOLES1_CENT=[ASIC_MODULE_002_MPPC_CONNECTOR_DIM[0]/2.,ASIC_MODULE_002_MPPC_CONNECTOR_DIM[1]/2.,0];
ASIC_MODULE_002_HOLES1_POSS=[
[ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_PCB1_DIM[0]-ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,ASIC_MODULE_002_PCB1_DIM[1]-ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB1_POS,
[ASIC_MODULE_002_PCB1_DIM[0]-ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,ASIC_MODULE_002_PCB1_DIM[1]-ASIC_MODULE_002_HOLES1_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB1_POS,
];

ASIC_MODULE_002_PCB2_DIM=[29.,29.,2];
ASIC_MODULE_002_PCB2_POS=[0,0,0];
ASIC_MODULE_002_PCB2_ALPHA=1.;
ASIC_MODULE_002_PCB2_COLOR="Lime Green";
ASIC_MODULE_002_HOLES2_DIAM=2.2;
ASIC_MODULE_002_HOLES2_CENTERTOMARGIN=1.2+ASIC_MODULE_002_HOLES2_DIAM/2.;
ASIC_MODULE_002_HOLES2_CENT=[ASIC_MODULE_002_MPPC_CONNECTOR_DIM[0]/2.,ASIC_MODULE_002_MPPC_CONNECTOR_DIM[1]/2.,0];
ASIC_MODULE_002_HOLES2_POSS=[
[ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB2_POS,
[ASIC_MODULE_002_PCB1_DIM[0]-ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB2_POS,
[ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,ASIC_MODULE_002_PCB1_DIM[1]-ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB2_POS,
[ASIC_MODULE_002_PCB1_DIM[0]-ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,ASIC_MODULE_002_PCB1_DIM[1]-ASIC_MODULE_002_HOLES2_CENTERTOMARGIN,-1*delta]+ASIC_MODULE_002_PCB2_POS,
];

ASIC_MODULE_002_FEB_CONNECTOR_DIM=[5,12,13];
ASIC_MODULE_002_FEB_CONNECTOR_POS=[ASIC_MODULE_002_PCB2_DIM[0]/8.,(ASIC_MODULE_002_PCB2_DIM[1]-ASIC_MODULE_002_FEB_CONNECTOR_DIM[1])/2.,-1*ASIC_MODULE_002_FEB_CONNECTOR_DIM[2]]+ASIC_MODULE_002_PCB2_POS;
ASIC_MODULE_002_FEB_CONNECTOR_ALPHA=1.;
ASIC_MODULE_002_FEB_CONNECTOR_COLOR="Black";

ASIC_MODULE_002_ASIC_DIM=[6,10,1];
ASIC_MODULE_002_ASIC_POS=[ASIC_MODULE_002_PCB1_DIM[0]*3.2/8.,(ASIC_MODULE_002_PCB2_DIM[1]-ASIC_MODULE_002_ASIC_DIM[1])/2.,-1*ASIC_MODULE_002_ASIC_DIM[2]]+ASIC_MODULE_002_PCB2_POS;
ASIC_MODULE_002_ASIC_ALPHA=1.;
ASIC_MODULE_002_ASIC_COLOR="Gray";


//PCB on the TOP
difference(){
translate(ASIC_MODULE_002_PCB1_POS)
color(ASIC_MODULE_002_PCB1_COLOR,alpha=ASIC_MODULE_002_PCB1_ALPHA)
cube(size = ASIC_MODULE_002_PCB1_DIM,center=false);
//HOLES ON TOP PCB
for(i=ASIC_MODULE_002_HOLES1_POSS){
translate(i)
cylinder(r=ASIC_MODULE_002_HOLES1_DIAM/2.,h=ASIC_MODULE_002_PCB1_DIM[2]+2*delta);
}
}
//CONNECTOR FOR MPPCS
for(i=ASIC_MODULE_002_MPPC_CONNECTOR_POSS)
{
translate(i)
color(ASIC_MODULE_002_MPPC_CONNECTOR_COLOR,alpha=ASIC_MPPC_MODULE_CONNECTOR_ALPHA)
cube(size = ASIC_MODULE_002_MPPC_CONNECTOR_DIM,center=false);
}

//PCB on the BOTTOM
difference(){
translate(ASIC_MODULE_002_PCB2_POS)
color(ASIC_MODULE_002_PCB2_COLOR,alpha=ASIC_MODULE_002_PCB2_ALPHA)
cube(size = ASIC_MODULE_002_PCB2_DIM,center=false);
//HOLES ON BOTTOM PCB
for(i=ASIC_MODULE_002_HOLES2_POSS){
translate(i)
cylinder(r=ASIC_MODULE_002_HOLES2_DIAM/2.,h=ASIC_MODULE_002_PCB2_DIM[2]+2*delta);
}
}
//FEB CONNECTOR ON THE BOTTOM
translate(ASIC_MODULE_002_FEB_CONNECTOR_POS)
color(ASIC_MODULE_002_FEB_CONNECTOR_COLOR,alpha=ASIC_MODULE_002_FEB_CONNECTOR_ALPHA)
cube(size = ASIC_MODULE_002_FEB_CONNECTOR_DIM,center=false);
//ASICS ON THE BOTTOM
translate(ASIC_MODULE_002_ASIC_POS)
color(ASIC_MODULE_002_ASIC_COLOR,alpha=ASIC_MODULE_002_ASIC_ALPHA)
cube(size = ASIC_MODULE_002_ASIC_DIM,center=false);

}

module FEB(){

FEB_PCB_DIM=[4*60.+25.,60.,2];
FEB_PCB_POS=[0,0,0];
FEB_PCB_ALPHA=1.;
FEB_PCB_COLOR="Lime Green";

FEB_ASIC_CONNECTOR_DIM=[5-2*delta,12-2*delta,13];
FEB_ASIC_CONNECTOR_POS=[3.625+delta,(FEB_PCB_DIM[1]/2-FEB_ASIC_CONNECTOR_DIM[1])/2-0.5+0.5*delta,FEB_PCB_DIM[2]]+FEB_PCB_POS;
FEB_ASIC_CONNECTOR_PITCH=[30,30,0];
FEB_ASIC_CONNECTOR_COLOR="Gray";
FEB_ASIC_CONNECTOR_ALPHA=1.;
electronics_assembly_FEB_POS=[0,0,-20];
for ( i = [0 : 7] )
{
for ( j = [0 : 1] )
{
    translate([i*FEB_ASIC_CONNECTOR_PITCH[0],j*FEB_ASIC_CONNECTOR_PITCH[1], 0]+FEB_ASIC_CONNECTOR_POS)
    color(FEB_ASIC_CONNECTOR_COLOR,alpha=FEB_ASIC_CONNECTOR_ALPHA)
    cube(size = FEB_ASIC_CONNECTOR_DIM,center=false);
}
}
translate(FEB_PCB_POS)
color(FEB_PCB_COLOR,alpha=FEB_PCB_ALPHA)
cube(size = FEB_PCB_DIM,center=false);
}