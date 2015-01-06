//Needs version 2014.12.30 or above to support text
module logo()
{	
color("BLUE")
	union() {
		translate([0,0,-15])
			linear_extrude(height=15,convexity = 5, center = true)
				difference() {
					circle(100);
					translate([75,00,0]) circle(10);
					};
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
				};
				translate([20,35,0])
					rotate([0,0,-90]) 
						scale([1,1.5,1])
							text("PSTOIC", font="Impact", size=18);
				translate([-40,50,0])
					rotate([0,0,-90])
						text("2015", font="Impact", size=38);
			}
		}
}

logo();




