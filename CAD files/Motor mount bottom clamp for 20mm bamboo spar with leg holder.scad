module clamp_body()
{
screw_hole_r=1.85; // for 3.5mm screws
leg_rad=5.1; // for a 10mm leg 
  difference()
    {
    // main body around spar hole
    union(){
      cube([32,24,14], center=true);
      translate([0,-2.5,-5])
      rotate(15,[1,0,0])
      cylinder(h=30,r=leg_rad+3,center=true,$fn=48);
    }
    union()
      {
      translate([0,0,9])
        // main notch for spar
        rotate(90,[1,0,0])
        cylinder(h=50, r=10, center=true,$fn=128);

      // hole for leg
      translate([0,2,-22])
      rotate(15,[1,0,0])
      #cylinder(h=40,r=leg_rad,center=true,$fn=48);

      // Holes along side rails for bolting alongside spar
      translate([12,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,-6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([12,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,6,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      
    }
  }
 
}

rotate(180,[0,1,0])
clamp_body();