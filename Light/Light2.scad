module LEDs(lights,radius,thickness,LEDSize)
{
	translate([0,0,thickness / 3]) 
		for ( i = [0 : 360/lights : 359] )
			translate([sin(i)*radius,cos(i)*radius,0])
				cylinder(h = thickness*2, d=LEDSize, center=true);
}

module WireSlot(radius,thickness,LEDSize,depth)
{
	translate([0,0,thickness-depth]) 
	difference() {
			cylinder(h = thickness, r=(radius)+LEDSize, center=true);
			cylinder(h = thickness*1.6, r=(radius)-LEDSize, center=true);
		}
}

module Handle(handle,radius,thickness,hole,slot)
{
	translate([radius*0.95,-(handle*1.5)/2,-thickness/2])
		difference() {
			union() {
				*translate([-handle/4,(-handle*0.75)/2,0]) /*fillet but disabled */
				*	cube([handle/2,handle*2.2,thickness], centre=true);
				translate([handle,(handle*1.5)/2,thickness/2])
					rotate([90,90,0])
						cylinder(h = handle*1.5, r=thickness/2, center=true);
				cube([handle,handle*1.5,thickness], centre=true);
			}
			translate([handle,(handle*1.5)/2,thickness/2])
				rotate([90,90,0])
					cylinder(h = handle*2, d=hole, center=true);
			translate([handle*0.2,((handle*1.5)/2)-(slot/2),-thickness/2])
					cube([handle*2,slot,thickness*2], centre=true);
		}
	}

module Light()
{
	d = 140;
	d_lens = 90;
	d_diff = d - d_lens;
	lights = 24;
	LEDSize = 5.25;
	thickness = 20;
	union() {
	Handle(25,d/2,thickness,6.5,11);
	difference() {
		cylinder(h = thickness, r=d/2, center=true);
		cylinder(h = thickness*1.2, r=d_lens*0.45, center=true);
		translate([0,0,thickness / 3]) 
			cylinder(h = thickness*1.2, d=d_lens, center=true);
		WireSlot((d-(d_diff/2))/2,thickness,LEDSize,6);
		LEDs(lights,(d-(d_diff/2))/2,thickness,LEDSize);
	}
	
	}
}

Light();