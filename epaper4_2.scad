EPAPER_WIDTH = 103;
EPAPER_HEIGHT = 77.5;
EPAPER_EDGE_WIDTH = 6;
BOARD_THICKNESS = 1.7;
BOTTOM_TO_CONNECTOR = 29.5;

edge_width = EPAPER_EDGE_WIDTH + 3;
backplate_thickness = 1.5;

slotoffset = 4;
slotdepth = EPAPER_EDGE_WIDTH +1;

width = EPAPER_WIDTH + 2 * (edge_width - EPAPER_EDGE_WIDTH);
height = EPAPER_HEIGHT + EPAPER_EDGE_WIDTH * 2;
thickness = 15;

slot_slab_width = EPAPER_WIDTH;
slot_thickness_ = BOARD_THICKNESS + 0.3;

difference() {
  union() {
      cube([width, height, thickness]);
  }
  //slot
  translate([edge_width-slotdepth,edge_width,thickness - slotoffset])
  cube([slot_slab_width, 200, slot_thickness_]);

  //opening
  translate([edge_width,edge_width,-1])
  cube([EPAPER_WIDTH - 2 * EPAPER_EDGE_WIDTH, height - 2 * edge_width, 100]);

  //space for connector
  translate([edge_width,edge_width + BOTTOM_TO_CONNECTOR,backplate_thickness])
  cube([200, EPAPER_HEIGHT+100, 
    100]);

}



