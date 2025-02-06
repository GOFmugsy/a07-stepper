$caseTh = 5;
$innerCase = [100, 35];
$outerCase = [$innerCase[0] + $caseTh, $innerCase[1] + $caseTh];
$len = 50;

$stepperInner = [42, 42];
$stepperOuter = [$stepperInner[0] + $caseTh, $stepperInner[1] + $caseTh];
$stepperLen = 25;

$clipTh = 2;

$fn = 50;

difference() {
	cube(size = [$outerCase[0], $len, $outerCase[1]]);
	translate([($outerCase[0] - $innerCase[0]) / 2, 0, ($outerCase[1] - $innerCase[1]) / 2])
	cube(size = [$innerCase[0], $len, $innerCase[1]]);
	// clip opening
	translate([0, 0, ($outerCase[1] / 2) - ($clipTh / 2)])
	cube(size = [$caseTh, $len, $clipTh]);
}

difference() {
	translate([$outerCase[0], 0, 0])
	cube(size = [$stepperOuter[0], $stepperLen, $stepperOuter[1]]);
	translate([$outerCase[0] + (($stepperOuter[0] - $stepperInner[0]) / 2), 0, ($stepperOuter[1] - $stepperInner[1]) / 2])
	cube(size = [$stepperInner[0], $stepperLen, $stepperInner[1]]);
	// clip opening
	translate([$outerCase[0] + $stepperOuter[0] - $caseTh, 0, ($stepperOuter[1] / 2) - ($clipTh / 2)])
	cube(size = [$caseTh, $len, $clipTh]);
}
