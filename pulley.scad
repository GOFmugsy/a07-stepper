$fn = 500;

$inner = 5;
$outer = 7;
$walls = 5;
$th = 10;
$wallth = 1;

rotate_extrude()
rotate([0, 0, 90])
translate([0, $inner])
difference(){
	square([$th, $outer + $walls]);
	translate([$wallth / 2, $outer])
	square([$th - $wallth, $walls]);
}
