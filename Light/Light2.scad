module LEDs(lights,radius,thickness,LEDSize)
{
	translate([0,0,thickness / 3]) 
		for ( i = [0 : 360/lights : 359] )
			translate([sin(i)*radius,cos(i)*radius,0])
				cylinder(h = thickness*2, r=LEDSize, center=true);
}

module WireSlot(radius,thickness,LEDSize)
{
	translate([0,0,thickness*2/3]) 
	difference() {
			cylinder(h = thickness, r=(radius)+LEDSize*1.6, center=true);
			cylinder(h = thickness*1.6, r=(radius)-LEDSize*1.6, center=true);
		}
}

module Handle(handle,radius,thickness,hole,slot)
{
	translate([radius*0.95,-(handle*1.5)/2,-thickness/2])
		difference() {
			union() {
				cube([handle,handle*1.5,thickness], centre=true);
			}
			translate([handle-thickness/2,handle/2,thickness/2])
				rotate([90,90,0])
					cylinder(h = handle*2, r=hole, center=true);
			translate([handle*0.2,((handle*1.5)/2)-(slot/2),-thickness/2])
					cube([handle,slot,thickness*2], centre=true);
		}
	}

module Light()
{
	radius = 120;
	radius_lens = 90;
	radius_diff = radius - radius_lens;
	lights = 6;
	LEDSize = 2.5;
	thickness = 25;
	union() {
	difference() {
		cylinder(h = thickness, r=radius, center=true);
		cylinder(h = thickness*1.2, r=radius_lens*0.95, center=true);
		translate([0,0,thickness / 3]) 
			cylinder(h = thickness*1.2, r=radius_lens, center=true);
		WireSlot(radius-(radius_diff/2),thickness,LEDSize);
		LEDs(lights,radius-(radius_diff/2),thickness,LEDSize);
		
		
	}
	Handle(40,radius,thickness,3.25,11);
	}
}

Light();