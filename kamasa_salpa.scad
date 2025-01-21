width = 29.5;
length = 42;
height = 7;

edge_ridge_width = 3.5;
center_ridge_width = 3.8;
center_ridge_length = 17;

channel_bottom_width = 12.5;
right_channel_top_width = 8.5;
left_channel_top_width = 10;

difference() {
  cube([width,length,height], false);
 
  //right channel top opening
  translate([edge_ridge_width,0,0]) 
    cube([8.5,17,5], false);

  //right channel bottom
  translate([1.7,0,2]) 
    cube([12.5,35,3], false);

  translate([
    edge_ridge_width + 
    right_channel_top_width +
    center_ridge_width,0,0]) 
    cube([left_channel_top_width,17,5], false);

  //left channel bottom
  translate([edge_ridge_width+8.5+center_ridge_width,0,2]) 
    cube([channel_bottom_width,35,3], false);
  
  //hollow
  translate([edge_ridge_width,center_ridge_length,0]) 
    cube([
      right_channel_top_width +
      center_ridge_width +
      left_channel_top_width, 19, 5], false);
   
   //right channel edge
   translate([2,0,0])
     rotate([0,45,0])
       cube([width,center_ridge_length,height], false);
   

}
