module clamp_body()
{
  difference()
  {
    union()
    {  
      // main body around spar hole
      cube([28,22,12], center=true);
      //translate([0,2,0])
      // ring to thicken material around spar hole
      //cylinder(h=12, r=12, center=true,$fn=128);
    }
      union()
      {
      translate([0,-5,0])
      // notch below spar hole for tightening
        cube([3,15,14], center=true);
      translate([0,2,0])
      // main hole for spar
        cylinder(h=14, r=7.6, center=true,$fn=128);
      translate([0,-7.5,0])
        rotate(90,[0,1,0])
          // hole for tightening screw
          cylinder(h=100, r=1.6, center=true,$fn=128);
        }
  }
 
}

module plate()
{
union()
  {
  cylinder(r=14,h=3,$fn=48,center=true,$fn=128);
  translate([0,10.5,0])
  cube([28,22,3],center=true);
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