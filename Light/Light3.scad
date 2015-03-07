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

module Handle(handle,radius,thickness,hole)
{
	translate([radius*0.95,(-(handle*1.5)/2),-thickness/2])
		difference() {
			union() {
				translate([handle,(handle*1.5)/2,thickness/2])
					rotate([90,90,0])
						cylinder(h = handle*1.5, r=thickness/2, center=true);
				cube([handle,handle*1.5,thickness], centre=true);
			}
			translate([handle,(handle*1.5)/2,thickness/2])
				rotate([90,90,0])
					cylinder(h = handle*2, d=hole, center=true);
		}
	}
	
module Body(thickness,d,d_lens,lights,LEDSize)
	{
		d_diff = d - d_lens;
		difference() {
			union() {
				cylinder(h = thickness, r=d/2, center=true);
				rotate_extrude(){
					 translate([d/2-12,0.5,0])
						scale([2, 1.2, 1])
							circle(r = thickness/2);
				}
			}
			cylinder(h = thickness*1.2, r=d_lens*0.45, center=true);
			translate([0,0,thickness / 3]) 
				cylinder(h = thickness*1.2, d=d_lens, center=true);
			WireSlot((d-(d_diff/2))/2,thickness,LEDSize,6);
			LEDs(lights,(d-(d_diff/2))/2,thickness,LEDSize);
		}	
	}
	

module Light()
{
	d = 125;
	d_lens = 90;
	lights = 24;
	LEDSize = 5.25;
	thickness = 20;
	handle=25;
	slot=11;
	difference() {
		union() {
		Handle(25,d/2,thickness,6.5);
		Body(thickness,d,d_lens,lights,LEDSize);
		}
		translate([(d/2)+3,-slot/2,-thickness])
			cube([handle*2,slot,thickness*2], centre=true);

	}
}

Light();