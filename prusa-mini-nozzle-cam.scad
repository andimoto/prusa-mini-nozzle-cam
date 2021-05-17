$fn=70;


camR = 4;
camTubeR = 6;
camTubeL = 60;



module camTube()
{

}


module nozzleCam()
{
  difference() {
    cylinder(r=camTubeR,h=camTubeL,center=false);
    cylinder(r=camR,h=camTubeL,center=false);
    #translate([0,0,30]) rotate([0,-90,-90]) cylinder(r=1.5,h=8,center=false);
  }
}


nozzleCam();
