support_width = 16;
support_length = 15;
slab_radius = 75 / 2;
support_height = 120;
slab_thickness = 10;
first_hole_from_slab_bottom = 40;
hole_distance = 54;

linear_extrude(slab_thickness) circle(slab_radius);
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