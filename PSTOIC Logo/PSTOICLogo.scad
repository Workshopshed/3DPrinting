use <MCAD/fonts.scad>

thisFont=8bit_polyfont();
letters="PSTOIC";
letters2="2015";
theseIndicies=search(letters, thisFont[2], 1, 1);
theseIndicies2=search(letters2, thisFont[2], 1, 1);
x_shift = thisFont[0][0];
y_shift = thisFont[0][1];

module logo()
{	
		union() {
			color("DarkSlateBlue")
				translate([0,0,-15])
					linear_extrude(height=15,convexity = 5, center = true)						difference() {
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
			   	translate([20,-47.5,0]) square([60,95]);
			}
			translate([0,-40,0]) square([100,80]);
		}
		union() {
		translate([35,35,0])
			rotate([0,0,-90]) 
				scale([1.5,5,0])
					import(file = "example016.stl", convexity = 12);
					//for( j=[0:(len(theseIndicies)-1)] ) {
						//translate([j*x_shift, -y_shift/2])
							//polygon(points=thisFont[2][theseIndicies[j]][6][0], paths=thisFont[2][theseIndicies[j]][6][1]);
			}
		translate([-20,48,0])
			rotate([0,0,-90])
			scale([3,8,0])
				for( j=[0:(len(theseIndicies2)-1)] ) {
					translate([j*x_shift, -y_shift/2])
						polygon(points=thisFont[2][theseIndicies2[j]][6][0], paths=thisFont[2][theseIndicies2[j]][6][1]);
			}	
		}
	}
}
}


logo();




