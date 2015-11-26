module mountingpost() {
    difference() {
        cylinder(h=5,r=1.5,$fn=30);
        translate([0,0,3])
            cylinder(h=3,r=0.5,$fn=30);
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
        cube([70,35,15], center=true);
        translate([0,0,3])
            cube([65,30,15], center=true);
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

case();
