$fs=0.2;
module motorFixSlot()
{

hull()
{
  translate([-3.75,13.9,0])
  rotate(90,[1,0,0]) 
  cylinder(h=8,r=1.6, center=true);
  translate([3.75,13.9,0])
  rotate(90,[1,0,0])
  cylinder(h=8,r=1.6, center=true);
  }
}

module nutTrap()
{
  {
  rotate(90,[1,0,0])
  translate([0,0,-9])
  cylinder(h=2.5,r=3.1,center=true,$fn=6);  
  }
}

module ringSubtractor()
{
translate([0,2,0])
  difference(){
    difference(){
      cylinder(h=12, r=14, center=true);
      cylinder(h=13, r=12, center=true);
    }
    translate([0,10,0])
      cube([46,4,12], center=true);
    translate([0,-8,0])
      cube([40,12,12], center=true);
  }
}

module tmount()
{
  difference(){
    union(){
      // main body around spar hole
      cube([22,22,10], center=true);
      translate([0,2,0])
      cylinder(h=10, r=12, center=true);
      // top rail
      translate([0,12,0])
        cube([46,4,10],center=true);
      // lip
      //translate([24.5,8,0])
      //	cube([3,10,10], center=true);
      //translate([-24.5,8,0])
      //	cube([3,10,10], center=true);
    }
    ringSubtractor();
    union(){
      // notch below spar hole for tightening
      translate([0,-5,0])
        cube([3,15,12], center=true);
      // main hole for spar
      translate([0,2,0])
        cylinder(h=12, r=7.6, center=true);
      // hole for tightening screw
      translate([0,-7.5,0])
        rotate(90,[0,1,0])
          cylinder(h=100, r=1.6, center=true);
		// Slots for motor mount holding screws
		// 3.5mm wide, 36mm center-to-center widest
		// and 22mm centre-to-centre narrowest
		translate([14.5,0,0])
       {
			motorFixSlot();
        translate([-3.5,-.25,0])
        nutTrap();
       }
		translate([-14.5,0,0])
        {
			 motorFixSlot();
        translate([3.5,-.25,0])
        nutTrap();
        }
		}
	}
	
}

// uncomment for vertical print
rotate(270,[1,0,0])
tmount();