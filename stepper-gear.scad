include <../gears/gears.scad>;

$gearWidth = 7;

difference() {
	herringbone_gear (modul=1, tooth_number=46, width=$gearWidth, bore=5.2, pressure_angle=20, helix_angle=30, optimized=true);
	translate([0, 0, $gearWidth / 3])
	rotate([90,0,54])
	cylinder(h = 50, r = 1.5);
}

