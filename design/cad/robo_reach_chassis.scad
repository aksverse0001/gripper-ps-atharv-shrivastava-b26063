// RoboReach Challenge A - simple chassis concept
// Units are mm. Open in OpenSCAD. Use F5 preview / F6 render.
// Animate with $t from 0 to 1 to see a basic forward/gripper motion.
// This is a simplified model, not production-ready CAD.

$fn = 36;
t = $t; // OpenSCAD animation variable

chassis_L = 240;
chassis_W = 180;
plate_T = 6;
wheel_D = 70;
wheel_W = 22;
wheelbase = 170;
track = 150;

module wheel(x,y,z) {
    translate([x,y,z])
        rotate([90,0,0])
            difference() {
                cylinder(d=wheel_D,h=wheel_W,center=true);
                cylinder(d=10,h=wheel_W+1,center=true);
            }
}
module chassis() {
    color([0.20,0.25,0.30])
        translate([0,0,48])
            cube([chassis_L,chassis_W,plate_T],center=true);
    // simple side rails
    color([0.35,0.38,0.40])
        for (y=[-chassis_W/2+8,chassis_W/2-8])
            translate([0,y,39]) cube([chassis_L-15,8,18],center=true);
}
module battery() {
    color([0.16,0.16,0.18])
        translate([-25,0,65]) cube([85,55,28],center=true);
    color([0.85,0.25,0.12])
        translate([-25,0,80]) cube([55,24,2],center=true);
}
module electronics() {
    color([0.05,0.35,0.20])
        translate([-75,0,61]) cube([40,35,8],center=true);
}
module front_arm() {
    // pivot tower
    color([0.70,0.70,0.73])
        translate([78,0,76]) cube([24,30,52],center=true);
    // simple folded / slightly moving arm link
    rotate([0, -12-8*sin(360*t), 0])
        color([0.78,0.58,0.25])
            translate([60 + 52*t,0,84]) cube([75,14,10],center=true);
    // two fingers move inward/outward in animation
    for (s=[-1,1])
        color([0.85,0.70,0.42])
            translate([98 + 53*t, s*(14-4*sin(360*t)), 75])
                cube([36,7,12],center=true);
}
module cube_payload() {
    // Cube centre is 70 mm ahead of the chassis front edge (x=120).
    color([0.88,0.25,0.18])
        translate([100 + 90*t + 3*sin(360*t),0,75])
            cube([50,50,50],center=true);
}
module whole_bot() {
    chassis();
    for (x=[-wheelbase/2,wheelbase/2])
        for (y=[-track/2,track/2])
            wheel(x,y,35);
    battery();
    electronics();
    front_arm();
    cube_payload();
}
module exploded() {
    // Exploded view spacing along z, for presentation only.
    translate([0,0,0]) chassis();
    for (x=[-wheelbase/2,wheelbase/2])
        for (y=[-track/2,track/2])
            wheel(x,y,35+28);
    translate([0,0,28]) battery();
    translate([0,0,22]) electronics();
    translate([0,0,42]) front_arm();
    translate([190,0,100]) cube_payload();
}
if (is_undef(exploded_view)) whole_bot();
else exploded();
