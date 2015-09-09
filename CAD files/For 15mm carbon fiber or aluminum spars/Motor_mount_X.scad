module braceArm(width)
{
hull()
  {
  translate([33.5/2,0,0])
  cylinder(r=width/2,h=3,$fn=32,center=true);
  translate([-33.5/2,0,0])
  cylinder(r=width/2,h=3,$fn=32,center=true);
  }
}

module hub(brace_width){
hub=brace_width*2;
divot_rad=brace_width/2;
difference()
  {
  cube([hub,hub,3],center=true);
  translate([brace_width,brace_width,0])
  cylinder(r=divot_rad,h=5,$fn=32,center=true);
  translate([-brace_width,brace_width,0])
  cylinder(r=divot_rad,h=5,$fn=32,center=true);
  translate([brace_width,-brace_width,0])
  cylinder(r=divot_rad,h=5,$fn=32,center=true);
  translate([-brace_width,-brace_width,0])
  cylinder(r=divot_rad,h=5,$fn=32,center=true);
  }
}

module centralHole(diam)
{
cylinder(r=diam/2,h=10,$fn=32,center=true);
}

module screwholes()
{
translate([8,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([-8,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([0,9.75,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([0,-9.75,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([16.5,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([-16.5,0,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([0,16.5,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
translate([0,-16.5,0])
  {
  cylinder(r=1.6,h=10,$fn=32,center=true);
  }
}

module countersinks()
{
translate([8,0,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32);
  }
translate([-8,0,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32);
  }
translate([0,9.75,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32);
  }
translate([0,-9.75,0])
  {
  cylinder(r1=1.6,r2=3,h=1.55,$fn=32);
  }
}

module motorMount()
{
brace_width=10;
difference()
  {
  union()
    {
    braceArm(brace_width);
    rotate(90,[0,0,1])
    braceArm(brace_width);
    hub(brace_width);
    }
  centralHole(10);
  screwholes();
  countersinks();
  }
}

motorMount();
