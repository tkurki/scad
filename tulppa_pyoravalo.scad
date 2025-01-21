//sisähalkaisija 28 => sisäsäde 14
//ulkonema minimi 13  => 15  = 20-5

difference() {
    cylinder(20, 17, 17);
    translate([0,0,5]) 
       cylinder(20, 14, 14);
}

