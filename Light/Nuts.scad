//Thumbwheel by Andy Clark

//Hexagon from http://svn.clifford.at/openscad/trunk/libraries/shapes.scad
// size is the XY plane size, height in Z
module hexagon(size, height) {
  boxWidth = size/1.75;
  for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

module nut(size, height) {
  boxWidth = size/1.75;
  rRemove = size/1.75;
  rX = pow(pow(rRemove,2)-pow(boxWidth/2,2),0.5);
  difference() {
	  union() {
		  /* Thumbwheel part */
		  difference() {	   
		  for (r = [-120, 0, 120])
				rotate([0,0,r]){
					difference() {
						union() {
							cube([boxWidth, size, height], true);
							translate([0, size/2, 0])
								cylinder(h = height, r=boxWidth/2,$fn=32, center=true);
							}
						translate([0, -rX-size/2, 0])
							cylinder(h = height+5, r=rRemove,$fn=64, center=true);
					}
				};
		  translate([0,0,height/2])	
			hexagon(10,height);
		  }
	  /* Collar */
	  translate([0,0,-height])
		cylinder(r=8,height,$fn=64,centre=true);
	  }
	/* Hole for bolt */
	translate([0,0,-height*2])	
		cylinder(r=2.5,height*4,centre=true,$fn=32);
  }
}

nut(20,10);