module Light()
{
	radius = 50;
	lights = 8;
	thickness = 15;
	difference() {
		cylinder(h = thickness, r=radius*2, center=true);
		cylinder(h = thickness*1.2, r=radius, center=true);
		translate([0,0,thickness / 3]) cylinder(h = thickness*1.2, r=radius*1.2, center=true);
		for ( i = [0 : 360/lights : 359] )
			translate([sin(i)*radius*1.6,cos(i)*radius*1.6,0])
				cylinder(h = thickness*1.2, r=5, center=true);
	}
}

Light();