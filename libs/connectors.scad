/**
 * Author: Ennis Massey <ennisbaradine@gmail.com>
 * 
 * Library with various electrical connectors
 */

include <MCAD/materials.scad>
use <MCAD/polyholes.scad>
use <utils.scad>


BNC_female_outer_radius=4.8006;
BNC_female_inner_radius=4.0513;
BNC_female_notch_radius=5.4864;


module BNC_Jack_50ohm() {
        render() {
        union() {
                difference() {
                        union() { 
                                translate([0, 0, 8.3058-10.5156]) cylinder(r=BNC_female_outer_radius, h=10.5156);       
                                translate([0, 0, 4.7752-(0.9525/2)]) {
                                translate([BNC_female_inner_radius, 0, 0]) rotate([0, 90, 0]) cylinder(r=0.9525, h=BNC_female_notch_radius-BNC_female_inner_radius);
                                translate([-BNC_female_inner_radius, 0, 0]) rotate([0, -90, 0]) cylinder(r=0.9525, h=BNC_female_notch_radius-BNC_female_inner_radius);
                                }
                        }
                        cylinder(r=BNC_female_inner_radius, h=8.3058);
                }
                union() { 
                        cylinder(r=3.2512, h=0.1524);
                        difference() {
                                cylinder(r=2.3622, h=4.7752);
                                translate([0, 0, 0.1524]) cylinder(r=1.0287, h=4.953);
                        }
                }
        }
        }
}

module BananaPlug_Head(w_corners, h) {
        difference() {
                cylinder(d=w_corners, $fn=6, h=h);
                translate([0,0,h]) cube([1, w_corners, h/1.1], center=true);
        }
}

// Uninsulated Banana Plug Socket
// Source: https://www.mouser.com/ds/2/516/BananaPlugs%20D7MOOCE-257160.pdf Page: 15
module BananaPlug_Panel_Socket_Uninsulated(threaded) {
        difference() {
                union() {
                        // This will cause a considerable performance hit, so only use it for previews
                        if (threaded == true) {
                                intersection() {
                                        BananaPlug_Panel_Drilling_Bolt(1, 14.6+2.3, true);
                                        thread(6.15/2, 14.6+2.3, 0.5);
                                } 
                        } else {
                                BananaPlug_Panel_Drilling_Bolt(1, 14.6+2.3);
                        }
                        translate([0, 0, 14.6+2.3]) BananaPlug_Head(7.66, 1.8);
                }
                translate([0,0,2.3]) cylinder(d=4, h=16.5);
        }
        difference() {
                translate([0, 0, -10.6]) cylinder(h=27.5-(14.6+2.3), d=3);
                translate([0, 0, -10]) rotate([0, 45, 0]) cube([7, 3, 3], center=true);
        }
}

// Insulated Banana Plug Socket
// Source: https://www.mouser.com/ds/2/516/BananaPlugs%20D7MOOCE-257160.pdf Page: 15
module BananaPlug_Panel_Socket_Insulated(threaded) {
        difference() {
                union() {
                        // This will cause a considerable performance hit, so only use it for previews
                        BananaPlug_Panel_Drilling_Bolt(6, 10+8.2, false);
                        translate([0, 0, 10+8.2]) BananaPlug_Head(11.05, 3);
                }
                translate([0,0,8.2]) cylinder(d=4, h=20);
        }
        difference() {
                translate([0, 0, -15]) cylinder(h=15, d=3);
                translate([0, 0, -15]) rotate([0, 45, 0]) cube([7, 3, 3], center=true);
        }
        
}


module BananaPlug_Panel_Drilling_Hole(index, h, threaded) {
        if(index == 1) {
                cylinder(d=6.15, h=h);
        } else if (index == 2) {
                cylinder(d=5.15, h=h);
        } else if (index==3) {
                cylinder(d=4.15, h=h);
        } else if (index == 4) {
                cylinder(d=3.65, h=h);
        } else if (index == 5) {
                intersection() {
                        cylinder(d=12.15, h=h);
                        cube([12.15, 11.15, h], center=true);
                }
        } else if (index == 6) {
                intersection() {
                        cylinder(d=8.15, h=h);
                        cube([8.15, 7.15, h], center=true);
                }
        }      
}

module BananaPlug_Panel_Drilling_Bolt(index, h, threaded) {
        if(index == 1) {
                cylinder(d=5, h=h);
        } else if (index == 2) {
                cylinder(d=5.15, h=h);
        } else if (index==3) {
                cylinder(d=4.15, h=h);
        } else if (index == 4) {
                cylinder(d=3.65, h=h);
        } else if (index == 5) {
                intersection() {
                        cylinder(d=12.15, h=h);
                        translate([0, 0, h/2]) cube([12.15, 11.15, h], center=true);
                }
        } else if (index == 6) {
                intersection() {
                        cylinder(d=8.15, h=h);
                        translate([0, 0, h/2]) cube([8.15, 7.15, h], center=true);
                }
        }
        
}


$fs=1.1;
