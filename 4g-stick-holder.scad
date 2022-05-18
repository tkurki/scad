width = 55;
length = 80;
height = 15;

sticklength=73.5;
stickwidth = 28;
stickheight=11.5;

wholewallthickness = 5;
thinwallthickness = 2;

antennacenterfromusbend = 22.5;

usbwidth = 12.5;

connectorminthickness = 5.4;
connectormaxhickness = 9;
connectorgroovefrombody= 5.5;
connectorgroovethickness = 2;

connectordistance = 34;



difference() {
  
    
union() {
  //base
  cube([ length,width,height]);
}
//body
translate([thinwallthickness, wholewallthickness, -0.001])
  cube([sticklength, stickwidth, stickheight]);
//usb
translate([-0.001, wholewallthickness + usbwidth/2, -0.001])
  cube([10, usbwidth, stickheight]);

//1st antenna
translate([thinwallthickness + antennacenterfromusbend - connectorminthickness / 2, wholewallthickness, -0.001])
  cube([connectorminthickness, 1000, stickheight]);

translate([thinwallthickness + antennacenterfromusbend - connectormaxhickness / 2, wholewallthickness, -0.001])
  cube([connectormaxhickness, stickwidth + connectorgroovefrombody, stickheight]);
translate([thinwallthickness + antennacenterfromusbend - connectormaxhickness / 2, wholewallthickness + stickwidth + connectorgroovefrombody + connectorgroovethickness, -0.001])
  cube([connectormaxhickness, 1000, stickheight]);


//2nd antenna
translate([connectordistance, 0, 0])
  union() {
translate([thinwallthickness + antennacenterfromusbend - connectorminthickness / 2, wholewallthickness, -0.001])
  cube([connectorminthickness, 1000, stickheight]);

translate([thinwallthickness + antennacenterfromusbend + - connectormaxhickness / 2, wholewallthickness, -0.001])
  cube([connectormaxhickness, stickwidth + connectorgroovefrombody, stickheight]);
translate([thinwallthickness + antennacenterfromusbend - connectormaxhickness / 2, wholewallthickness + stickwidth + connectorgroovefrombody + connectorgroovethickness, -0.001])
  cube([connectormaxhickness, 1000, stickheight]);
  }
}

