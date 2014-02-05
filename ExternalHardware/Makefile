DRAWINGS=Dimension0.png Dimension1.png Rendering0.png Rendering1.png Rendering2.png Rendering3.png Rendering4.png Rendering5.png CoolingPlate.png Rendering6.png Rendering7.png # Rendering8.png Rendering9.png
CSGMODELS= FEBA.csg FEBD.csg CoolingPlate.csg


all: ${DRAWINGS} ${CSGMODELS}

clean: 
	rm ${DRAWINGS}

%.csg: %.scad
	openscad -m make -o $@ -d $@.deps $<

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

Dimension0.png: Dimension0.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 --camera=-80,-65,0,90,0,0,850 --projection=o 2>&1 | head

Dimension1.png: Dimension1.scad Parts.scad
	openscad $< -o $@ --imgsize=2800,2100 --camera=-200,-160,0,90,0,0,2050 --projection=o 2>&1 | head

CoolingPlate.png: CoolingPlate.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head

Rendering0.png: Rendering0.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head

Rendering1.png: Rendering1.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head

Rendering2.png: Rendering2.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head

Rendering3.png: Rendering3.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering4.png: Rendering4.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering5.png: Rendering5.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering6.png: Rendering6.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering7.png: Rendering7.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering8.png: Rendering8.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
Rendering9.png: Rendering9.scad Parts.scad
	openscad $< -o $@ --imgsize=2500,2100 2>&1 | head
