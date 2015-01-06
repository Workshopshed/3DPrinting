//Used "DeskEngrave" to create DXF files for texts
//using "IMPACT" font

module logo()
{	
color("BLUE")
		union() {
			translate([0,0,-15])
				linear_extrude(height=15,convexity = 5, center = true)
					difference() {
						circle(100);
						translate([75,00,0]) circle(10);
						}
	
linear_extrude(height=15,convexity = 5, center = true)
	union() {
		difference() {
			union() {
					difference() {
						circle(100);
						circle(90);
					}
			   	translate([20,-51.5,0]) square([60,103]);
			}
			translate([0,-40,0]) square([100,80]);
		}
		union() {
		translate([20,35,0])
			rotate([0,0,-90]) 
				scale([18,25,0])
					import(file = "PSTOIC.DXF", convexity = 12);
		translate([-40,51,0])
			rotate([0,0,-90])
				scale([40,40,0])
					import(file = "2015.DXF", convexity = 12);
		}
	}
}
}


logo();




