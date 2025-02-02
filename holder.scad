$outerCase = [20, 5];
$innerCase = [18, 3];
$len = 50;

$stepperOuter = [10, 10];
$stepperInner = [8, 8];
$stepperLen = 20;

$fn = 50;

difference() {
	cube(size = [$outerCase[0], $len, $outerCase[1]]);
	translate([($outerCase[0] - $innerCase[0]) / 2, 0, ($outerCase[1] - $innerCase[1]) / 2])
	cube(size = [$innerCase[0], $len, $innerCase[1]]);
}

difference() {
	translate([$outerCase[0], 0, 0])
	cube(size = [$stepperOuter[0], $stepperLen, $stepperOuter[1]]);
	translate([$outerCase[0] + (($stepperOuter[0] - $stepperInner[0]) / 2), 0, ($stepperOuter[1] - $stepperInner[1]) / 2])
	cube(size = [$stepperInner[0], $stepperLen, $stepperInner[1]]);
}
