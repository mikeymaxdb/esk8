// More faces
$fn=200;

boxWidth = 170;
boxHeight = 120;
boxRadius = 35;
wallThickness = 5;

bufferHeight = 10;
bufferWidth = 15;

holeLocations = [
    [0, boxHeight / 2 - bufferHeight / 2, 0],
    [-50, boxHeight / 2 - bufferHeight / 2, 0],
    [50, boxHeight / 2 - bufferHeight / 2, 0],
    [0, -boxHeight / 2 + bufferHeight / 2, 0],
    [-50, -boxHeight / 2 + bufferHeight / 2, 0],
    [50, -boxHeight / 2 + bufferHeight / 2, 0],

    [-boxWidth / 2 + bufferHeight / 2, boxHeight / 2 - 35, 0],
    [boxWidth / 2 - bufferHeight / 2, boxHeight / 2 - 35, 0],
    [-boxWidth / 2 + bufferHeight / 2, -boxHeight / 2 + 35, 0],
    [boxWidth / 2 - bufferHeight / 2, -boxHeight / 2 + 35, 0]
];

difference() {
    union() {
        roundedRect(boxWidth, boxHeight, boxRadius);
        /* difference() { */
        /*     roundedRect(boxWidth, boxHeight, boxRadius); */
        /*     roundedRect( */
        /*             boxWidth - wallThickness * 2, */
        /*             boxHeight - wallThickness *2, */
        /*             boxRadius - wallThickness */
        /*             ); */
        /* } */

        /* for ( hole = holeLocations ) { */
        /*     translate(hole) holeBuffer(); */
        /* } */
    }

    for ( hole = holeLocations ) {
        translate(hole) hole();
    }
}

module hole() {
    circle(2);
}

module holeBuffer() {
    color("green") roundedRect(bufferWidth, bufferHeight, 2);
}

module roundedRect(width, height, radius) {
    hull() {
        translate([-width/2 + radius, height/2 - radius, 0]) circle(radius);
        translate([width/2 - radius, height/2 - radius, 0]) circle(radius);
        translate([-width/2 + radius, -height/2 + radius, 0]) circle(radius);
        translate([width/2 - radius, -height/2 + radius, 0]) circle(radius);
    }
}
