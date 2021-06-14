$fn=70;


camR = 4;
camTubeR = 6;
camTubeL = 30;

fanXY=40;
fanZ=10;


minkowR2=3;
wallThickness=1;
minkowR1=minkowR2+wallThickness;

mountThickness=0.4;

rotatorR=19;

fanScrewR=1.7;

armMoveX=20;
armMoveY=0;


module camTube()
{
  translate([0,0,-10])
  difference() {
    cylinder(r=camTubeR,h=camTubeL,center=false);
    cylinder(r=camR,h=camTubeL,center=false);
    translate([0,0,17]) rotate([0,90,50]) cylinder(r=1.5,h=8,center=false);
  }
}
/* camTube(); */


module miniFanHolder()
{
  difference()
  {
    union()
    {
      translate([-fanXY/2+minkowR2,-fanXY/2+minkowR2,0])  //move zero to middle
      difference()
      {
        union(){
        hull(){
          minkowski() {
            cube([fanXY-minkowR1*2+wallThickness*2,fanXY-minkowR1*2+wallThickness*2,fanZ]);
            cylinder(r=minkowR1,h=0.00000000000001);
          }
            translate([-armMoveX,armMoveY,0]) cylinder(r=minkowR1,h=fanZ);
          }
          translate([-armMoveX,armMoveY,0]) cylinder(r=minkowR1,h=fanZ*2);
        }


        translate([0,0,mountThickness])
        minkowski() {
          cube([fanXY-minkowR2*2,fanXY-minkowR2*2,fanZ]);
          cylinder(r=minkowR2,h=0.00000000000001);
        }
      }
    }
    cylinder(r=rotatorR, h=fanZ);

    translate([-fanXY/2+minkowR2,fanXY/2-minkowR2,0]) cylinder(r=fanScrewR, h=fanZ);
    translate([-fanXY/2+minkowR2,-fanXY/2+minkowR2,0]) cylinder(r=fanScrewR, h=fanZ);
  }

}

/* miniFanHolder(); */



module nozzleCam()
{
  difference(){
    union()
    {
      translate([0,2,0]) rotate([80,0,0]) camTube();
      translate([-12,3,0]) cube([2,10,8]);
      translate([-12,0,0]) cube([7,3,4]);
    }
    translate([-11,6.5,4]) rotate([90,0,90]) cylinder(r=4.2/2,h=2, center=true);

    translate([-12,10,-10]) cube([20,20,20]);
    translate([-10,-10,-25]) cube([20,40,20]);
  }
}


nozzleCam();


/* difference() {
  miniFanHolder();
  #translate([-10,-25,0]) cube([50,50,10]);
  #translate([-25,-25,0]) cube([50,25,10]);
} */
