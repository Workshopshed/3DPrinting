offset = 0.5;

module mountingpost() {
    difference() {
        cylinder(h=5,r=1.5,$fn=30);
        translate([0,0,3])
            cylinder(h=3,r=0.5,$fn=30);
    }
}

module plate(width,depth,height) {
    $fn=50;
    translate([-width/2,-depth/2,-height/2]) {
        minkowski()
        {
         cube([width,depth,h], centre=true);
         cylinder(r=2,h=height,centre=true);
        }
    }
    
}

module slot(len=10) {
    union() {
        cube([len,10,3], center=true);
        translate([-len/2,5,0])
            rotate([90,0,0])
            cylinder(h=10,r=1.5,$fn=30);
        translate([len/2,5,0])
            rotate([90,0,0])
            cylinder(h=10,r=1.5,$fn=30);
    }
}


module case() {
union() {
    difference() {
        plate(70,35,15);
        translate([0,0,2.5])
            plate(65,30,15);
        translate([5,-15,0])
            slot();
        translate([20,-15,0])
            slot();
        translate([-18,-15,0])
            slot(14);
        translate([-33,0,0])
            rotate([0,0,90])
                slot(14);
    }
    translate([30,12,-7])
        mountingpost();
    translate([30,-12,-7])
        mountingpost();
    translate([-30,12,-7])
        mountingpost();
    translate([-30,-12,-7])
        mountingpost();
}
}

module lid() {
    difference() {
        union() {
            plate(70,35,3);
            translate([0,0,2.5])
                difference() {
                    plate(65-offset,30-offset,3);
                    plate(62,27,4);
                    }
            }
         translate([-19,10,0]) {
                rotate([180,0,0]) {
                    linear_extrude(height = 10)
                    {
                        text("\u03C0\u00D8",22);
                    }
                }
        }
    }
}

case();
translate([100,0,-6.5]) {
    lid();
}

