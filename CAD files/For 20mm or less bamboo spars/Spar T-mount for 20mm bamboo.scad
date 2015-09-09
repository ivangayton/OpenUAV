module clamp_body()
{
screw_hole_r=1.85; // for 3.5mm screws
screw_head_r=3.5;
  difference()
    {
    // main body around spar hole
    union()
      {
      cube([32,24,14], center=true);
      translate([0,0,-5.5])
      cube([72,24,3], center=true);
      }
   union()
      {
      translate([0,0,9])
        // main notch for spar
        rotate(90,[1,0,0])
        cylinder(h=50, r=10, center=true,$fn=128);

      // centre hole for bolting through spar
      cylinder(h=40,r=screw_hole_r,center=true,$fn=48);

      // Holes along side rails for bolting alongside spar
      translate([12,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([12,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);

      // Screw head holes (wider than screw holes)
      translate([12,-6,-7.1])
      cylinder(h=4,r=screw_head_r,centre=true,$fn=48);
      translate([-12,-6,-7.1])
      cylinder(h=4,r=screw_head_r,centre=true,$fn=48);
      translate([12,6,-7.1])
      cylinder(h=4,r=screw_head_r,centre=true,$fn=48);
      translate([-12,6,-7.1])
      cylinder(h=4,r=screw_head_r,centre=true,$fn=48);

      // Holes in bottom plate for bolting to fuselage
      translate([-30,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-30,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([30,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([30,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
    }
  }
 
}

module bottom_plate()
{

}

clamp_body();
bottom_plate();