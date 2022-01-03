$fn=70;

extra = 1;

camR = 4;
camTubeR = 6;
camTubeL = 30;

fanXY=40;
fanZ=10;
heatBreakZ=20;

minkowR2=3;
wallThickness=1;
minkowR1=minkowR2+wallThickness;

mountThickness=0.4;

rotatorR=19;

fanScrewR=2.5;

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


          /* complete case */
            minkowski() {
              cube([fanXY-minkowR1*2+wallThickness*2,fanXY-minkowR1*2+wallThickness*2,fanZ]);
              cylinder(r=minkowR1,h=0.00000000000001);
            }

            hull() {
              /* outer cylinder for front triangle */
              translate([-armMoveX,armMoveY-11.5,0]) cylinder(r=minkowR1,h=fanZ);
              translate([0,0,0]) cylinder(r=minkowR1,h=fanZ);
              translate([0,fanXY-minkowR1-wallThickness*2,0]) cylinder(r=minkowR1,h=fanZ);
            }

            /* top triangle */
            topHolder();

        /* translate([-armMoveX,armMoveY,0]) cylinder(r=minkowR1,h=fanZ); */
        }

        /* fan case cutout */
        translate([0,0,mountThickness])
        minkowski() {
          cube([fanXY-minkowR2*2,fanXY-minkowR2*2,fanZ]);
          cylinder(r=minkowR2,h=0.00000000000001);
        }
      }
      translate([-10,fanXY/2,2]) snapCone();
    }


    /* cutout for tube camera */
    translate([-51,-22,fanZ+heatBreakZ/2])
    rotate([0,90,-20])
    cylinder(r=camR,h=camTubeL,center=false);

    /* screw for fixing tubeCamera */
    translate([-48,-35,fanZ+heatBreakZ/2])
    rotate([0,90,90-20])
    cylinder(r=1.5,h=12,center=false);

    /* fan rotor cutout */
    cylinder(r=rotatorR, h=fanZ);

    /* fan screws */
    /* translate([-fanXY/2+minkowR2+0.5,fanXY/2-minkowR2-0.5,0]) cylinder(r=fanScrewR, h=fanZ); */

    translate([-fanXY/2+minkowR2+0.5,-fanXY/2+minkowR2+0.5,0]) cylinder(r=fanScrewR, h=fanZ);


    /* fan cap cutoff */
    translate([9-(fanXY+wallThickness*2)/2,-(fanXY+wallThickness*2)/2-8,-extra])
    cube([fanXY+wallThickness*2, fanXY+wallThickness*2, fanZ+extra*2]);
    /* fan cap cutoff */
    translate([8-(fanXY+wallThickness*2)/2+5,-(fanXY+wallThickness*2)/2,-extra])
    cube([fanXY+wallThickness*2, fanXY+wallThickness*2, fanZ+extra*2]);



    /* cutout triangle */
    hull()
    {
      translate([-44,-26,-extra]) cylinder(r=minkowR1-2,h=fanZ+heatBreakZ+extra*2);
      translate([-25.5,-18,-extra]) cylinder(r=minkowR1-2,h=fanZ+heatBreakZ+extra*2);
      translate([-25.5, 2, -extra]) cylinder(r=minkowR1-2,h=fanZ+heatBreakZ+extra*2);
    }


    /* cutouts */
    for(i = [0 : 1 : 3])
    {
      translate([0,12,fanZ/2])
      translate([-60,-8*i,0]) rotate([0,90,0]) cylinder(r=2,h=50,$fn = 6);
    }
    /* cutouts */
    for(i = [0 : 1 : 2])
    {
      translate([0,4,fanZ+(heatBreakZ/4)*3])
      translate([-45,-8*i,0]) rotate([0,90,0]) cylinder(r=2,h=30,$fn = 6);

      translate([0,4,fanZ+heatBreakZ/4])
      translate([-45,-8*i,0]) rotate([0,90,0]) cylinder(r=2,h=30,$fn = 6);
    }
  }

}

/* snapCone(); */
module snapCone()
{
  difference()
  {
    union()
    {
      cylinder(r1=0.00001,r2=2,h=2);
      translate([0,0,2]) cylinder(r=2,h=4);
    }
    translate([-2.5,0,0]) cube([5,5,10]);
  }
}


/* miniFanHolder(); */

module topHolder()
{
  hull()
  {
    translate([-armMoveX,-armMoveY-11.5,0]) cylinder(r=minkowR1,h=fanZ+heatBreakZ);
    translate([-armMoveX+22.26,-armMoveY-2.97,0]) cylinder(r=minkowR1,h=fanZ+heatBreakZ);
    translate([-armMoveX+22.26,-armMoveY+22.27, 0]) cylinder(r=minkowR1,h=fanZ+heatBreakZ);
  }
}



/* nozzleCam(); */
miniFanHolder();
