// amp holder
$caseTh = 5;
$innerCase = [100, 35];
$outerCase = [$innerCase[0] + $caseTh, $innerCase[1] + $caseTh];
$len = 50;

// stepper holder
$stepperInner = [43, 43];
$stepperOuter = [$stepperInner[0] + $caseTh, $stepperInner[1] + $caseTh];
$stepperLen = 25;

// cutouts for attaching clip
$clipTh = 2;

// stepper attachment
$stepperFaceTh = 0.4;
$boltsDist = 6; //measured at 5mm
$boltsDia = 3;
$stepperDia = 23; //measured at 22mm

// wire arm holder and stuff
$wireHolder = [$caseTh / 2, 5];
$wireHolderLen = 120;

$proto = [81, 51];
$protoTh = 2;
$protoPosY = $len + ($wireHolderLen * (0 / 100)); //% down wire arm
$protoBottomBuff = 5;
$protoTopBuff = 1;
$protoShellBuff = 4;
$protoClipTh = 2;

$fn = 50;

// Build Amp Case
difference() {
	cube(size = [$outerCase[0], $len, $outerCase[1]]);
	translate([($outerCase[0] - $innerCase[0]) / 2, 0, ($outerCase[1] - $innerCase[1]) / 2])
	cube(size = [$innerCase[0], $len, $innerCase[1]]);
	// clip opening
	translate([0, 0, ($outerCase[1] / 2) - ($clipTh / 2)])
	cube(size = [$caseTh, $len, $clipTh]);
}

// Build Stepper Holder
difference() {
	translate([$outerCase[0], 0, 0])
	cube(size = [$stepperOuter[0], $stepperLen, $stepperOuter[1]]);
	translate([$outerCase[0] + (($stepperOuter[0] - $stepperInner[0]) / 2), 0, ($stepperOuter[1] - $stepperInner[1]) / 2])
	cube(size = [$stepperInner[0], $stepperLen, $stepperInner[1]]);
	// clip opening
	translate([$outerCase[0] + $stepperOuter[0] - $caseTh, 0, ($stepperOuter[1] / 2) - ($clipTh / 2)])
	cube(size = [$caseTh, $len, $clipTh]);
}

translate([$outerCase[0] + $caseTh / 2, 0, $caseTh / 2])
difference() {
	cube(size = [$stepperInner[0], $stepperFaceTh, $stepperInner[1]]);
	translate([$stepperInner[0] / 2, 0, $stepperInner[1] / 2])
	rotate([-90,0,0])
	cylinder(h = $stepperFaceTh, r = $stepperDia / 2);
	translate([$boltsDist, 0, $boltsDist])
	rotate([-90,0,0])
	cylinder(h = $stepperFaceTh, r = $boltsDia / 2);
	translate([$stepperInner[0] - $boltsDist, 0, $boltsDist])
	rotate([-90,0,0])
	cylinder(h = $stepperFaceTh, r = $boltsDia / 2);
	translate([$stepperInner[0] - $boltsDist, 0, $stepperInner[1] - $boltsDist])
	rotate([-90,0,0])
	cylinder(h = $stepperFaceTh, r = $boltsDia / 2);
	translate([$boltsDist, 0, $stepperInner[1] - $boltsDist])
	rotate([-90,0,0])
	cylinder(h = $stepperFaceTh, r = $boltsDia / 2);
}

// Add wire arm and ziptie notch
difference() {
	translate([$outerCase[0] - ($caseTh / 2), $len, ($outerCase[1] - $caseTh) / 2])
	cube(size = [$wireHolder[0], $wireHolderLen, $wireHolder[1]]);
	translate([$outerCase[0] - ($caseTh / 2) - ($wireHolder[1] / 2), $len + $wireHolderLen - ($wireHolderLen * (10 / 100)), ($outerCase[1] - $caseTh) / 2])
	rotate([0, 0, 45])
	cube($wireHolder[1]);
}

// Add protoboard clip
translate([$outerCase[0] - ($caseTh / 2), $protoPosY, 0])
difference() {
	cube(size = [$protoBottomBuff + $protoTh + $protoTopBuff + $protoShellBuff, $proto[0] + $protoShellBuff, $proto[1] + $protoShellBuff]);
	translate([$protoShellBuff, 0, ($protoShellBuff / 2) + ($protoClipTh / 2)])
	cube(size = [$protoBottomBuff + $protoTh + $protoTopBuff + $protoShellBuff, $proto[0] + $protoShellBuff, $proto[1] - ($protoClipTh)]);
	translate([$protoShellBuff + $protoBottomBuff, 0, ($protoShellBuff / 2)])
	cube(size = [$protoTh, $proto[0] + $protoShellBuff, $proto[1]]);
}
















