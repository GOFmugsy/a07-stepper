$fn = 200;

$inner = 2.5; // diameter
$outer = 7;
$walls = 5;
$th = 10;
$wallth = 1;

$grubhole = 1; // diameter

difference(){
	// pulley
	rotate_extrude()
	translate([$inner, 0])
	difference(){
		square([$th, $outer + $walls]);
		translate([$outer + $walls - (($th - $wallth) / 5), ($th / 2) + $wallth]) // guessing at this point... Needs tuning
		circle(r = ($th - $wallth)/2);
	}
	// grub hole
	translate([$inner - 1, 0, ($th + $wallth) / 2])
	rotate([0, 90, 0])
	cylinder(h = $outer + 2, r1 = $grubhole, r2 = $grubhole);
}
