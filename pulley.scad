$fn = 500;

$inner = 5;
$outer = 7;
$walls = 5;
$th = 10;
$wallth = 1;

$grubhole = 2;

difference(){
	// pulley
	rotate_extrude()
	rotate([0, 0, 90])
	translate([0, $inner])
	difference(){
		square([$th, $outer + $walls]);
		translate([$wallth / 2, $outer])
		square([$th - $wallth, $walls]);
	}
	// grub hole
	translate([$inner - 1, 0, $th / 2])
	rotate([0, 90, 0])
	cylinder(h = $outer + 2, r1 = $grubhole, r2 = $grubhole);
}
