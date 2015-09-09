module clamp_body()
{
screw_hole_r=1.85; // for 3.5mm screws
  difference()
    {
    translate([0,7,6])
    // main body around spar hole
    cube([32,14,24], center=true);
    union()
      {
      translate([0,-2,0])
        // main hole for spar
        cylinder(h=50, r=10, center=true,$fn=128);
    rotate(90,[1,0,0])
      {
      translate([0,6,0])
      // centre hole for bolting through spar
      cylinder(h=40,r=screw_hole_r,center=true,$fn=48);
      // Holes along side rails for bolting alongside spar
      translate([12,1,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,1,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([12,11,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      translate([-12,11,-20])
      cylinder(h=40,r=screw_hole_r,centre=true,$fn=48);
      }
    }
  }
 
}

module plate()
{
union()
  {
  cylinder(r=14,h=3,$fn=48,center=true,$fn=128);
  translate([0,4.6,0])
  cube([28,10,3],center=true);
  }
}

module centralHole(diam)
{
cylinder(r=diam/2,h=3.2,$fn=32,center=true);
}

module screwholes()
{
translate([8,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true,$fn=128);
  }
translate([-8,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true,$fn=128);
  }
translate([0,9.75,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true,$fn=128);
  }
translate([0,-9.75,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true,$fn=128);
  }

}

module countersinks()
{
translate([8,0,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32,$fn=128);
  }
translate([-8,0,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32,$fn=128);
  }
translate([0,9.75,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32,$fn=128);
  }
translate([0,-9.75,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32,$fn=128);
  }
}

module buttresses()
{
difference()
  {
  union()
    {
    translate([12.5,0,6.4])
      difference()
        {
        cube([3,20,12],center=true);
        rotate(30,[1,0,0])
          translate([0,0,6])
            cube([4,28,12],center=true);
        }
    translate([-12.5,0,6.4])
      difference()
        {
        cube([3,20,12],center=true);
        rotate(30,[1,0,0])
          translate([0,0,6])
            cube([4,28,12],center=true);
        }
    }
    difference()
    {   
    cylinder(h=40,r=20,center=true);
    cylinder(h=50,r=14,center=true,$fn=128);
    translate([-50,0,-25])
      cube([100,100,100]);
    }
  }
}

module motorMount()
{
union()
  {
  difference()
    {
    plate();
    centralHole(10);
    rotate(129,[0,0,1])
      {
      screwholes();
      countersinks();
      }
    }
  buttresses();
  translate([0,15.5,12.5])
  rotate(270,[1,0,0])
  clamp_body();
  }
}

motorMount();