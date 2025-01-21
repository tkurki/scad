insideWidth = 33.5;
insideHeight = 12;
insideLength = 46;


holderWidth = 8;
wallThickness = 2.5;

totalLength = insideLength + wallThickness;
totalWidth = insideWidth + 2 * wallThickness;
totalHeight = insideHeight + 2 * wallThickness;

holeDistanceFromEnd = 5;
endCapMaxLength = 10;

rotate(a=[0,-90,0]) {
difference() {
  union() {
    cube([
    insideLength + wallThickness, 
    insideWidth + 2 * wallThickness,
    insideHeight + 2 * wallThickness], false);
    translate([0, -holderWidth, 0])
      cube([
      insideLength + wallThickness, 
      insideWidth + 2 * wallThickness + 2 * holderWidth,
      wallThickness], false);
  }
    
    translate([wallThickness,wallThickness,wallThickness]) 
    cube([
    insideLength +2 , 
    insideWidth,
    insideHeight], false);
  
    //yläreunan kolo 
    translate([totalLength-3, -holderWidth-1, insideHeight + wallThickness])
      cube([10,totalWidth + 2 * holderWidth +2,wallThickness+1], false);
    //alareunan kolo
    translate([totalLength-10, -holderWidth-1, -1])
      cube([10,totalWidth + 2 * holderWidth +2,wallThickness+1], false);

    translate([holeDistanceFromEnd,-4,-1])
      cylinder(wallThickness+2, 2,2,false);
    translate([holeDistanceFromEnd, totalWidth + 4,-1])
      cylinder(wallThickness+2, 2,2,false);
}
}


translate([10, -holderWidth, 10 + wallThickness])
rotate(a=[0,90,0]) {

difference() {
  cube([10 + wallThickness,totalWidth + 2 * holderWidth,totalHeight], false);
  translate([-1,-1,wallThickness])
    cube([10 + wallThickness+2,holderWidth+1, insideHeight + wallThickness +1], false);
  translate([-1,holderWidth + insideWidth + 2 * wallThickness,wallThickness])
    cube([10 + wallThickness+2,holderWidth+1, insideHeight + wallThickness +1], false);
  translate([-1,0,wallThickness])
    cube([10+1,insideWidth + 2 * holderWidth, insideHeight], false);
  translate([-1,0,wallThickness + insideHeight-1])
    cube([10 - 2,insideWidth + 2 * holderWidth, insideHeight], false);
  
    //ruuvinreiät
  translate([10 + wallThickness - holeDistanceFromEnd,holderWidth - 4,-1])
    cylinder(wallThickness+2, 2,2,false);
  translate([10 + wallThickness - holeDistanceFromEnd, totalWidth + holderWidth + 4 ,-1])
    cylinder(wallThickness+2, 2,2,false);
}
}