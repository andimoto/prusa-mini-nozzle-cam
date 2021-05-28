$fn=70;


camR = 4;
camTubeR = 6;
camTubeL = 60;

holderWallThickness=2;
coolingFanNoseR=7/2;
coolingFanNoseLen=15;

fanScrewR=1.7;


module camTube()
{
  difference() {
    cylinder(r=camTubeR,h=camTubeL,center=false);
    cylinder(r=camR,h=camTubeL,center=false);
    translate([0,0,30]) rotate([0,90,-50]) cylinder(r=1.5,h=8,center=false);
  }
}
/* camTube(); */


module miniCoolingFanHolder()
{
  difference() {

    hull()
    {
      cylinder(r=coolingFanNoseR+holderWallThickness/2, h=coolingFanNoseLen+holderWallThickness*2);
      cube([coolingFanNoseR*3-0.5, coolingFanNoseR+holderWallThickness/2,coolingFanNoseLen+holderWallThickness*2]);
    }


    translate([0,0,holderWallThickness])
    hull()
    {
      cylinder(r=coolingFanNoseR, h=coolingFanNoseLen);
      translate([-coolingFanNoseR,0,0]) cube([coolingFanNoseR*2,coolingFanNoseR*2,coolingFanNoseLen]);
    }
    translate([0,0,holderWallThickness])
    rotate([0,0,15])
    hull()
    {
      cylinder(r=coolingFanNoseR, h=coolingFanNoseLen);
      translate([-coolingFanNoseR,0,0]) cube([coolingFanNoseR*2,coolingFanNoseR*2,coolingFanNoseLen]);
    }

    cylinder(r=fanScrewR, h=coolingFanNoseLen+holderWallThickness*2);
  }
  hull() {
    translate([coolingFanNoseR,0,0])
      cube([coolingFanNoseR*2, coolingFanNoseR+holderWallThickness/2,coolingFanNoseLen]);
    translate([coolingFanNoseR*2,0,0])
      cube([coolingFanNoseR, coolingFanNoseR+holderWallThickness/2,coolingFanNoseLen*2]);
  }
}
miniCoolingFanHolder();

module nozzleCam()
{

}


/* nozzleCam(); */
