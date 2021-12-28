$fn=70;

extra = 1;

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

armMoveX=30;
armMoveY=0;



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
          /* top triangle */
          topHolder();

          /* complete case */
          hull(){
            minkowski() {
              cube([fanXY-minkowR1*2+wallThickness*2,fanXY-minkowR1*2+wallThickness*2,fanZ]);
              cylinder(r=minkowR1,h=0.00000000000001);
            }
            /* outer cylinder for front triangle */
            translate([-armMoveX,armMoveY,0]) cylinder(r=minkowR1,h=fanZ);
          }

        /* translate([-armMoveX,armMoveY,0]) cylinder(r=minkowR1,h=fanZ); */
        }

        /* fan case cutout */
        translate([0,0,mountThickness])
        minkowski() {
          cube([fanXY-minkowR2*2,fanXY-minkowR2*2,fanZ]);
          cylinder(r=minkowR2,h=0.00000000000001);
        }
      }
    }
    /* cutout for tube camera */
    translate([-51,-10,fanZ+fanZ/2])
    rotate([0,90,-28])
    cylinder(r=camR,h=camTubeL,center=false);

    /* screw for fixing tubeCamera */
    translate([-49,-23,fanZ+fanZ/2])
    rotate([0,90,90-28])
    cylinder(r=1.5,h=12,center=false);

    /* fan rotor cutout */
    cylinder(r=rotatorR, h=fanZ);

    /* fan screws */
    translate([-fanXY/2+minkowR2,fanXY/2-minkowR2,0]) cylinder(r=fanScrewR, h=fanZ);
    translate([-fanXY/2+minkowR2,-fanXY/2+minkowR2,0]) cylinder(r=fanScrewR, h=fanZ);

    /* fan cap cutoff */
    translate([7-(fanXY+wallThickness*2)/2,-(fanXY+wallThickness*2)/2,-extra])
    cube([fanXY+wallThickness*2,
                                  fanXY+wallThickness*2,
                                  fanZ+extra*2]);

    /* cutout triangle */
    hull()
    {
      translate([-42,-15,-extra]) cylinder(r=minkowR1-2,h=fanZ*2+extra*2);
      translate([-26,-15,-extra]) cylinder(r=minkowR1-2,h=fanZ*2+extra*2);
      translate([-26, 3, -extra]) cylinder(r=minkowR1-2,h=fanZ*2+extra*2);
    }

    for(i = [0 : 1 : 3])
    {
      translate([0,12,fanZ/2])
      translate([-60,-8*i,0]) rotate([0,90,0]) cylinder(r=2,h=50,$fn = 6);
    }

    for(i = [0 : 1 : 1])
    {
      translate([0,4,fanZ+fanZ/2])
      translate([-42.5,-8*i,0]) rotate([0,90,0]) cylinder(r=2,h=30,$fn = 6);
    }
    translate([-30,4-8*2,fanZ+fanZ/2]) rotate([0,90,0]) cylinder(r=2,h=20,$fn = 6);
  }

}

/* miniFanHolder(); */

module topHolder()
{
  hull()
  {
    translate([-armMoveX,-armMoveY,0]) cylinder(r=minkowR1,h=fanZ*2);
    translate([-armMoveX+22,-armMoveY,0]) cylinder(r=minkowR1,h=fanZ*2);
    translate([-armMoveX+22,-armMoveY+25, 0]) cylinder(r=minkowR1,h=fanZ*2);
  }
}



/* nozzleCam(); */
miniFanHolder();
