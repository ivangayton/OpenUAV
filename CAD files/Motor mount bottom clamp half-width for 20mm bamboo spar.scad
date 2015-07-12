module clamp_body()
{
screw_hole_r=1.85; // for 3.5mm screws
  difference()
    {
    // main body around spar hole
    cube([32,12,14], center=true);
    union()
      {
      translate([0,0,9])
        // main notch for spar
        rotate(90,[1,0,0])
        cylinder(h=50, r=10, center=true,$fn=128);

      // centre hole for bolting through spar
      cylinder(h=40,r=screw_hole_r,center=true,$fn=48);
      // Holes along side rails for bolting alongside spar
      translate([12,0,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,0,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      
    }
  }
 
}

clamp_body();