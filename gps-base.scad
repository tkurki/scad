support_width = 16;
support_length = 10;
slab_radius = 75 / 2;
support_height = 120;
slab_thickness = 10;
first_hole_from_slab_bottom = 40;
hole_distance = 54;

difference() {
 linear_extrude(slab_thickness) circle(slab_radius, $fn=100);
 rotate([0,0,0])
  translate([0,22,0])
   union() {
    cylinder (h = 150, r=2, center = true, $fn=100);
    translate([0,0,10])
    cylinder (h = 5, r=5, center = true, $fn=100);
   }
 rotate([0,0,120])
  translate([0,22,0])
   union() {
    cylinder (h = 150, r=2, center = true, $fn=100);
    translate([0,0,10])
    cylinder (h = 5, r=5, center = true, $fn=100);
   }
 rotate([0,0,240])
  translate([0,22,0])
   union() {
    cylinder (h = 150, r=2, center = true, $fn=100);
    translate([0,0,10])
    cylinder (h = 5, r=5, center = true, $fn=100);
   }
}
difference() {
translate([slab_radius - support_length,-support_width / 2,0]) {
cube([support_length,support_width,support_height]);
}
translate([10,0,slab_thickness + first_hole_from_slab_bottom])
  rotate ([0,90,00])
    cylinder (h = 150, r=2, center = true, $fn=100);
translate([10,0,slab_thickness + first_hole_from_slab_bottom + hole_distance])
  rotate ([0,90,00])
    cylinder (h = 150, r=2, center = true, $fn=100);

}