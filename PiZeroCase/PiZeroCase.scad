offset = 0.5;
wall = 1.4;

module mountingpost(width,length,x,y) {
    difference() {
        hull() {
            translate([5.0,5.0,0]) cylinder(h=4,r=3.0,$fn=30);
                cylinder(h=4,r=1.5,$fn=30);
        }
        translate([0,0,1])
            cylinder(h=5,r=0.5,$fn=30);
    }
}

module foot()
{
    difference() {
        hull() {
            cube([3,8,2]);
            translate([-4,4,0])
                cylinder(h=2,r=4,$fn=30);;
        }
        translate([-4,4,-1])
        cylinder(h=6,r=1,$fn=30);
    }
}

module plate(width,depth,height) {
    $fn=50;
    translate([-width/2,-depth/2,0]) {
        minkowski()
        {
         cube([width,depth,height], centre=true);
         cylinder(r=2,h=1,centre=true);
        }
    }
}

module slot(len=10,height=8) {
	translate([0,20,0]){
		hull(){
			hull(){
			translate([-len/2+1.5,0,height/2])
				rotate([90,0,0])
				cylinder(h=10,d=2,$fn=30);
			translate([len/2-1.5,0,height/2])
				rotate([90,0,0])
				cylinder(h=10,d=2,$fn=30);
			}
			hull(){	
			translate([-len/2+1.5,0,-height/2])
				rotate([90,0,0])
				cylinder(h=10,d=2,$fn=30);
			translate([len/2-1.5,0,-height/2])
				rotate([90,0,0])
				cylinder(h=10,d=2,$fn=30);			
			}
		}
	}
}


module case(width,length) {
union() {
	
	Xoffset = 65/2;
	Yoffset = 30/2;
    difference() {
        plate(width,length,14);
        translate([0,0,wall])
            plate(width-(2*wall),length-(2*wall),20);
        translate([41.4-Xoffset,-width/2,7])
            slot(11,3);
        translate([54-Xoffset,-width/2,7])
            slot(11,3);
        translate([12.4-Xoffset,-width/2,8])
            slot(14,4);
        translate([12.4-Xoffset,16.9-Yoffset,7])
            rotate([0,0,90])
                slot(17,2.5);
    }
    translate([29,23/2,0])
        mountingpost();
    translate([29,-23/2,0])
        rotate([0,0,-90])
            mountingpost();
    translate([-29,23/2,0])
        rotate([0,0,90])
            mountingpost();
    translate([-29,-23/2,0])
        rotate([0,0,180])
            mountingpost();
    
    translate([(length/2)+21,(width/2)-20,0])
        rotate([0,0,180])
            foot();
    translate([-(length/2)-21,-(width/2)+20,0])
            foot();
}
}

module lid() {
    difference() {
        union() {
            plate(72,35,3);
            translate([0,0,2.5])
                difference() {
                    plate(72-(2*wall)-offset,35-(2*wall)-offset,3);
                    plate(72-(4*wall)-offset,35-(4*wall)-offset,4);
                    }
            }
         translate([-19,10,2]) {
                rotate([180,0,0]) {
                    linear_extrude(height = 10)
                    {
                        text("\u03C0\u00D8",22);
                    }
                }
        }
    }
}

module pizero()
{
	//Rough Pi to check sizes against
	union() {
	color("green") {
		difference() {
		plate(65,30,1);
		translate([(58/2),(23/2),-2.5])	
			cylinder(h=10,d=2.75,$fn=30);
		translate([-(58/2),-(23/2),-2.5])	
			cylinder(h=10,d=2.75,$fn=30);
		translate([(58/2),-(23/2),-2.5])	
			cylinder(h=10,d=2.75,$fn=30);
		translate([-(58/2),(23/2),-2.5])	
			cylinder(h=10,d=2.75,$fn=30);
		}
	}
	color("silver"){
		translate([-(65/2)+54,-15,3])
			cube([9,8,3],center=true);
		translate([-(65/2)+41.4,-15,3])
			cube([9,8,3],center=true);
		translate([-(65/2)+4,-15+16.9,3])
			cube([15,15,3],center=true);
		translate([-(65/2)+12.4,-13,5])
			cube([14,10,5],center=true);
		}
	}
}


case(72,35);
translate([0,-50,-3.5]) {
	rotate([180,0,0])
		*lid();
}

translate([0,0,4])
	pizero();
