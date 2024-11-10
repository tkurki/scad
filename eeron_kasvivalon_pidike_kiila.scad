
SLOT_WIDTH = 4 +1;
WIDTH = SLOT_WIDTH * 2;
LENGTH = 15;
HEIGHT = 5;


difference() {
  union() {
      cube([LENGTH, WIDTH, HEIGHT]);
  }
  
      translate([0, SLOT_WIDTH/2, 0])
      rotate([0,-10,0])
      cube([LENGTH+1, SLOT_WIDTH, HEIGHT]);

}