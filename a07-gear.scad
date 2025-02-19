include <../gears/gears.scad>;

$gearWidth = 7;

herringbone_gear (modul=1, tooth_number=60, width=$gearWidth, bore=6, pressure_angle=20, helix_angle=30, optimized=true);

