EPAPER_WIDTH = 103 +1;
EPAPER_HEIGHT = 77.5 + 1;
EPAPER_EDGE_WIDTH = 6;
BOARD_THICKNESS = 1.7;
BOTTOM_TO_CONNECTOR = 29.5;
CONNECTOR_WIDTH = EPAPER_HEIGHT - 2 * BOTTOM_TO_CONNECTOR;

edge_width = EPAPER_EDGE_WIDTH + 3;
backplate_thickness = 1.5;

slotoffset = 4;
slotdepth = EPAPER_EDGE_WIDTH +1;

width = EPAPER_WIDTH + 2 * (edge_width - EPAPER_EDGE_WIDTH);
height = EPAPER_HEIGHT + edge_width * 2;
thickness = 10;

slot_slab_width = EPAPER_WIDTH;
slot_slab_height = EPAPER_HEIGHT;
slot_thickness = BOARD_THICKNESS + 1;

$fn=25;

screw_hole_radius = 1.3;
nut_radius = 5.6 /2;
nut_recess = 3;

attachment_distance = 82;
attachment_screw_hole_radius = 2;
attachment_nut_radius = 8 / 2;

//for top
// rotate([180,0,0])
// translate([0,0,-thickness])

difference() {
  union() {
      cube([width, height, thickness]);
  }
  //slot
  translate([edge_width-slotdepth,edge_width,thickness - slotoffset])
  cube([slot_slab_width, height - (2 * edge_width), slot_thickness]);

  //opening
  translate([edge_width,edge_width,-1])
  cube([EPAPER_WIDTH - 2 * EPAPER_EDGE_WIDTH, height - 2 * edge_width, 100]);

  //space for connector
  translate([-1,BOTTOM_TO_CONNECTOR + edge_width,-1])
  cube([50, CONNECTOR_WIDTH, 1 + thickness - slotoffset  + slot_thickness + 0.05]);


  // corner screw holes
  translate([edge_width / 2 ,edge_width / 2,-5])
  cylinder(h=thickness + 6,r= screw_hole_radius);
  translate([edge_width / 2 ,edge_width / 2, -thickness + nut_recess]) 
  cylinder(h=thickness,r= nut_radius);
  
  translate([width -edge_width / 2 ,edge_width / 2,-5])
  cylinder(h=thickness + 6,r= screw_hole_radius);
  translate([width -edge_width / 2 ,edge_width / 2, -thickness + nut_recess]) 
  cylinder(h=thickness,r= nut_radius);

  translate([width -edge_width / 2 ,height - edge_width / 2,-5])
  cylinder(h=thickness + 6,r= screw_hole_radius);
  translate([width -edge_width / 2 ,height - edge_width / 2, -thickness + nut_recess]) 
  cylinder(h=thickness,r= nut_radius);

  translate([edge_width / 2 ,height - edge_width / 2,-5])
  cylinder(h=thickness + 6,r= screw_hole_radius);
  translate([edge_width / 2 ,height - edge_width / 2, -thickness + nut_recess]) 
  cylinder(h=thickness,r= nut_radius);

  // attachment screw holes
  translate([(width - attachment_distance) / 2 ,edge_width / 2,-5])
  cylinder(h=thickness + 6,r= attachment_screw_hole_radius);
  translate([(width - attachment_distance) / 2 ,edge_width / 2, 3]) 
  cylinder(h=thickness,r= attachment_nut_radius);
  
  translate([width - (width - attachment_distance) / 2 ,edge_width / 2,-5])
  cylinder(h=thickness + 6,r= attachment_screw_hole_radius);
  translate([width - (width - attachment_distance) / 2 ,edge_width / 2, 3]) 
  cylinder(h=thickness,r= attachment_nut_radius);

  // for bottom
  translate([-2,-2, thickness - slotoffset + 1])
  cube([width+4, height+4, thickness]);

  //for top
  // translate([-2,-2, -1])
  // cube([width+4, height+4, thickness - slotoffset + 2]);

}



