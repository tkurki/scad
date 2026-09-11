// Parametric flexi-leash flashlight holder
// Re-modelled from "Flexi leash flashlight holder" by JoGiz (thing:5061131)
// Defaults reproduce the original: Ø16 mm bore, 62 mm long, Ø15 mm retaining lip.
// All dimensions in mm.

/* [Flashlight] */
// Barrel diameter of the flashlight
flashlight_d   = 16;    // [8:0.5:40]
// Extra slop added to the bore (0 = press fit, 0.4 = loose)
fit_clearance  = 0;     // [0:0.05:1]
// Length of the tube = how much of the flashlight is gripped
holder_len     = 62;    // [20:1:150]
// Tube wall thickness
wall           = 2;     // [1.2:0.2:5]

/* [Retaining lip] */
// How far the lip pinches inwards (radius), 0 = no lip
lock_step      = 0.5;   // [0:0.1:2]
// Length of the pinched section
lock_len       = 4;     // [0:0.5:15]
// Chamfer at the mouth so the flashlight can be pushed in
lock_lead_in   = 1;     // [0:0.2:5]
// Lip at the top of the tube (false = bottom)
lock_at_top    = true;

/* [Leash clip] */
show_clip      = true;
// Distance from the top of the tube down to the top of the clip
clip_from_top  = 15.4;  // [0:0.5:60]
// Height of the flat web between tube and hook
web_height     = 17;    // [5:0.5:40]
// Thickness of the flat web
web_thick      = 3;     // [2:0.2:8]
// Rounding of the web's outer corners
web_round      = 2;     // [0:0.5:6]
// Fillet where the web meets the tube
web_fillet     = 1.2;   // [0:0.1:4]
// How far the hook sticks out past the tube wall
hook_out       = 20;    // [5:0.5:50]
// Arc radius of the hook (bigger = flatter curve)
hook_curve_r   = 34.7;  // [10:0.5:80]
// How far the hook sweeps round, in degrees
hook_sweep     = 39;    // [10:1:120]
// Wall thickness of the hook
hook_thick     = 3;     // [1.5:0.1:8]
// Width of the hook across the tube
hook_width     = 10;    // [4:0.5:25]

/* [Quality] */
$fa = 2;
$fs = 0.4;

/* [Hidden] */
bore_r   = (flashlight_d + fit_clearance) / 2;
outer_r  = bore_r + wall;
lip_r    = bore_r - lock_step;
clip_top = holder_len - clip_from_top;
hook_reach = outer_r + hook_out;
web_bot  = clip_top - web_height;
// centre of the hook arc, in (y,z); at 180 deg the arc is at its outermost point
hook_c   = [-(hook_reach - hook_thick/2) + hook_curve_r, clip_top];

echo(str("bore Ø", 2*bore_r, "  outer Ø", 2*outer_r, "  lip Ø", 2*lip_r, "  length ", holder_len));
echo(str("hook mouth (tube wall to hook tip) = ", round(10*(-arc_pt(1)[0] - outer_r))/10, " mm"));

holder();

module holder() {
    union() {
        tube();
        if (show_clip) clip();
    }
}

// ---------------------------------------------------------------- tube

module tube() {
    difference() {
        cylinder(r = outer_r, h = holder_len);
        difference() {
            translate([0, 0, -1]) cylinder(r = bore_r, h = holder_len + 2);
            if (lock_step > 0 && lock_len > 0) lip();
        }
    }
}

// Ring of material that narrows the bore, with a ramp at the mouth.
module lip() {
    // drawn as if the mouth were at z = 0, then flipped into place
    ramp = min(lock_lead_in, lock_len);
    mirrored(lock_at_top)
        rotate_extrude()
            polygon(ramp > 0
                ? [[outer_r + 1, 0], [outer_r + 1, lock_len],
                   [lip_r, lock_len], [lip_r, ramp], [bore_r, 0]]
                : [[outer_r + 1, 0], [outer_r + 1, lock_len],
                   [lip_r, lock_len], [lip_r, 0]]);
}

module mirrored(flip) {
    if (flip) translate([0, 0, holder_len]) mirror([0, 0, 1]) children();
    else children();
}

// ---------------------------------------------------------------- clip

module clip() {
    // profiles are drawn in (y, z) and extruded along x
    yz_extrude(web_thick) web_profile();
    yz_extrude(hook_width) hook_profile();
    if (web_fillet > 0) fillet();
}

// Extrude a 2D profile drawn in the (y, z) plane along x, centred.
module yz_extrude(t) {
    rotate([90, 0, 90]) linear_extrude(height = t, center = true) children();
}

module web_profile() {
    intersection() {
        rounded(web_round)
            polygon([
                [-(outer_r - 1), web_bot],
                [-hook_reach,    web_bot],
                [-hook_reach,    clip_top],
                [-(outer_r - 1), clip_top]
            ]);
        // keep the web inside the hook's outer surface
        translate(hook_c) circle(r = hook_curve_r + hook_thick / 2);
    }
}

module hook_profile() {
    steps = max(3, ceil(hook_sweep / 3));
    for (i = [0 : steps - 1])
        hull() {
            translate(arc_pt(i / steps))       circle(d = hook_thick);
            translate(arc_pt((i + 1) / steps)) circle(d = hook_thick);
        }
}

function arc_pt(u) =
    hook_c + hook_curve_r * [cos(180 + hook_sweep * u), sin(180 + hook_sweep * u)];

// Local flare where the web leaves the tube.
module fillet() {
    hull() {
        yz_extrude(web_thick + 2 * web_fillet) root_profile(0);
        yz_extrude(web_thick)                  root_profile(5 * web_fillet);
    }
}

module root_profile(off) {
    translate([-(outer_r - 1) - off, web_bot]) square([0.01, web_height]);
}

// Round convex corners of a 2D shape.
module rounded(r) {
    if (r > 0) offset(r = r) offset(r = -r) children();
    else children();
}
