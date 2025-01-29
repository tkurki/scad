difference() {
  union() {
    cylinder (h = 3, r=50, center = false, $fn=100);
    cylinder (h = 5, r=44, center = false, $fn=100);
  }
  translate([-44,-4,-1])
    cube([88,8,3]);
  translate([-44,-2.5,-1])
    cube([88,5,100]);
}

