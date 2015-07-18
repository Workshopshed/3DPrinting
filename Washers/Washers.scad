clearance=0.6;

module washer(diameter,height,hole)
{
	difference() {
		cylinder(d=diameter,h=height,center=true,$fn=40);
		translate([0,0,0])
			cylinder(d=hole+clearance,h=height*1.2,center=true,$fn=40);
	}
}

module main() {
union(){
    height = 1.5;
	diameter = 8;
	count = 10;
	for (x=[1:2]) {
		for (i=[1:count/2]){
			translate([x*10,i*2*diameter,0]) {
				washer(diameter,height,2);
				if (i < count/2) {
				translate([0,diameter/2-1,-height/2])
					cube([1,10,1]);
				}
			}
		}
	}
	translate([12,diameter*2,-height/2])
		cube([5,1,1]);
	translate([12,(count)*diameter,-height/2])
		cube([5,1,1]);
}
}

main();