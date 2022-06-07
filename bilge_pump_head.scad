width = 57; //53
length = 88; //84
height = 5;
channel_radius = 2;
channel_length = length-10;
short_channel_length = width - 10;
hole_inner_radius = 5;
hole_outer_radius = 8;
hole_height = height + 15;

difference() {
union() {  
  cube([width, length,height]);
    translate([width / 2, length / 2, 0])
      linear_extrude(hole_height) circle(hole_outer_radius, $fn=100);
    translate([width / 2, length / 2 + hole_outer_radius, hole_height])
      rotate([90,0,0])
        linear_extrude(hole_height +  15) circle(hole_outer_radius, $fn=100);
 }
 translate([width / 2, length / 2, 0])
   translate([0,0, -1])
     linear_extrude(hole_height +2) circle(hole_inner_radius, $fn=100);
 translate([width / 2, length / 2 + hole_outer_radius - (hole_outer_radius - hole_inner_radius), hole_height])
      rotate([90,0,0])
        linear_extrude(hole_height + 15) circle(hole_inner_radius, $fn=100);
 
 translate([width/2,length - ((length - channel_length) / 2),-channel_radius / 1.2])
   rotate([90,0,0])
     linear_extrude(channel_length) circle(channel_radius, $fn=100);

 translate([width/2,length / 2,-channel_radius / 1.2])
   rotate([90,0,0])
     translate([0,0,-channel_length / 2])
     linear_extrude(channel_length) circle(channel_radius, $fn=100);
 translate([width/2,length / 2,-channel_radius / 1.2])
   rotate([90,0,-30])
     translate([0,0,-channel_length / 2])
     linear_extrude(channel_length) circle(channel_radius, $fn=100);
 translate([width/2,length / 2,-channel_radius / 1.2])
   rotate([90,0,30])
     translate([0,0,-channel_length / 2])
     linear_extrude(channel_length) circle(channel_radius, $fn=100);

 translate([width/2,length / 2,-channel_radius / 1.2])
   rotate([90,0,90])
     translate([0,0,- short_channel_length / 2])
     linear_extrude(short_channel_length) circle(channel_radius, $fn=100);

}

