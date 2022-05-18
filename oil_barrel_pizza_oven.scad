laatanpaksuus = 20;
laatanleveys = 200;
arinanpaksuus = 50;
union() {
  translate([220, -100, 0])
     cube([20, 200, 400]);

 translate([arinanpaksuus + laatanleveys -130 + laatanleveys - 100, 60, 0])
   rotate([0, 0, 30])
     cube([20, 200, 400]);

 translate([arinanpaksuus + laatanleveys -130 + 5, 250-laatanpaksuus, 0])
   rotate([0, 0, 90])
     cube([20, 200, 400]);
 translate([-130,0, 0]) {
 cube([50,250,250]);
 translate([0,0,251]) cube([50,250,250]);
 translate([0,0,502]) cube([50,250,250]);

 translate([0,-251,0])cube([50,250,250]);
 translate([0,-251,251]) cube([50,250,250]);
 translate([0,-251,502]) cube([50,250,250]);
 }

difference(){
 cylinder(880, 610/2, 610/2);
translate([0,0,-1]) cylinder(882, 600/2, 600/2);
}

    
}
