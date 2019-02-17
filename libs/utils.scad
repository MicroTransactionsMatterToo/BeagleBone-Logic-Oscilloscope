// From https://github.com/JohK/nutsnbolts/blob/master/cyl_head_bolt.scad
module thread(
// the thread is extruded with a twisted linear extrusion 

	orad,  // outer diameter of thread 
	tl,    // thread length
	p)     // lead of thread
{ // -----------------------------------------------
	
// radius' for the spiral
r = [orad-0/18*p, orad-1/18*p, orad-2/18*p, orad-3/18*p, orad-4/18*p, orad-5/18*p,
     orad-6/18*p, orad-7/18*p, orad-8/18*p, orad-9/18*p, orad-10/18*p, orad-11/18*p,
     orad-12/18*p, orad-13/18*p, orad-14/18*p, orad-15/18*p, orad-16/18*p, orad-17/18*p,
     orad-p];

// extrude 2d shape with twist
translate([0,0,tl/2])
//difference() {
linear_extrude(height = tl, convexity = 10, twist = -360.0*tl/p, center = true)
	// mirrored spiral (2d poly) -> triangular thread when extruded
	polygon([[ r[ 0]*cos(  0), r[ 0]*sin(  0)], [r[ 1]*cos( 10), r[ 1]*sin( 10)],
		 [ r[ 2]*cos( 20), r[ 2]*sin( 20)], [r[ 3]*cos( 30), r[ 3]*sin( 30)],
		 [ r[ 4]*cos( 40), r[ 4]*sin( 40)], [r[ 5]*cos( 50), r[ 5]*sin( 50)],
	     	 [ r[ 6]*cos( 60), r[ 6]*sin( 60)], [r[ 7]*cos( 70), r[ 7]*sin( 70)],
		 [ r[ 8]*cos( 80), r[ 8]*sin( 80)], [r[ 9]*cos( 90), r[ 9]*sin( 90)],
		 [ r[10]*cos(100), r[10]*sin(100)], [r[11]*cos(110), r[11]*sin(110)],
		 [ r[12]*cos(120), r[12]*sin(120)], [r[13]*cos(130), r[13]*sin(130)],
		 [ r[14]*cos(140), r[14]*sin(140)], [r[15]*cos(150), r[15]*sin(150)],
		 [ r[16]*cos(160), r[16]*sin(160)], [r[17]*cos(170), r[17]*sin(170)],
		 [ r[18]*cos(180), r[18]*sin(180)], [r[17]*cos(190), r[17]*sin(190)],
		 [ r[16]*cos(200), r[16]*sin(200)], [r[15]*cos(210), r[15]*sin(210)],
		 [ r[14]*cos(220), r[14]*sin(220)], [r[13]*cos(230), r[13]*sin(230)],
		 [ r[12]*cos(240), r[12]*sin(240)], [r[11]*cos(250), r[11]*sin(250)],
		 [ r[10]*cos(260), r[10]*sin(260)], [r[ 9]*cos(270), r[ 9]*sin(270)],
		 [ r[ 8]*cos(280), r[ 8]*sin(280)], [r[ 7]*cos(290), r[ 7]*sin(290)],
		 [ r[ 6]*cos(300), r[ 6]*sin(300)], [r[ 5]*cos(310), r[ 5]*sin(310)],
		 [ r[ 4]*cos(320), r[ 4]*sin(320)], [r[ 3]*cos(330), r[ 3]*sin(330)],
		 [ r[ 2]*cos(340), r[ 2]*sin(340)], [r[ 1]*cos(350), r[ 1]*sin(350)]
                ]);
	
}


module shell(thickness) { 
  intersection() {
    children(0);
    minkowski() {
        difference () {
            // Universe cube
            translate([-1000/2, -1000/2, -1000/2 ]) 
                cube([1000, 1000, 1000]);
            // Original part
            children(0);  
        }
        // Tool for the minkowski shell
        sphere(r=thickness, center=true);
    }
  }
}
