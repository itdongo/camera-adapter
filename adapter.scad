$fn = 96;

include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

testvar=7;
clip_angle  = 20;
clip_radius = 154;
clip_size = 2;

phone_width=135;
phone_depth=68;
phone_height=3;
phone_edge_curve=11;
phone_edge_width=6;
phone_corner=phone_edge_curve-3;
camera_notch_width=39;
camera_notch_depth=39;
case_height=11.3;

distance_to_lens=24.8;

binoc_base_width=8;
binoc_base_height=2;
binoc_eyepiece_dia=34;
binoc_eyepiece_radius_inside=12;
binoc_width=71;
binoc_eyepiece_height=20.5-phone_height/2;

screw_width_max=2.85;
screw_width_min=1.6;
screw_head_height=1.67;
screw_height=phone_height;


module base()
{
  difference()
  {
    union()
    {
      //the phone base          
      cube([ phone_width, phone_depth, phone_height ], center = true);

      mirror([0,1,0])
      { 
         translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, -11.3 ])
       {
         rotate([ 0, 0, 180 ])
         rotate_extrude( angle = 90, $fn = 96 )
         translate([ phone_edge_curve, 0 ]) //curve and z height      
           square([ phone_edge_width, phone_height+case_height], center = true );
       }
      }

      mirror([1,1,0])
      { 
         translate([ -phone_depth/2+phone_corner, -phone_width/2+phone_corner, 0 ])
       {
         rotate([ 0, 0, 180 ])
         rotate_extrude( angle = 90, $fn = 96 )
         translate([ phone_edge_curve, 0 ]) //curve and z height      
           square([ phone_edge_width, phone_height+case_height], center = true );
       }
      }
    }
    
    //camera notch
    translate([ -phone_width/2+camera_notch_width/2, -phone_depth/2+camera_notch_depth/2, -phone_height/2 ])
      cube([ camera_notch_width, camera_notch_depth, 1 ], center = true );
   
    //remove the core
    translate([ -phone_width/2+distance_to_lens+screw_width_min, -phone_depth/2+distance_to_lens+screw_width_min, -phone_height/2 ])
    cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside, center = true );

    //Round the corners
      translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, 0 ])
    {
      rotate([ 0, 0, 180 ])
      rotate_extrude( angle = 90, $fn = 96 )
      translate([ phone_edge_curve, 0 ]) //curve and z height      
        square([ phone_edge_width, phone_height], center = true );
    }

   mirror([1,0,0])
   { 
      translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, 0 ])
    {
      rotate([ 0, 0, 180 ])
      rotate_extrude( angle = 90, $fn = 96 )
      translate([ phone_edge_curve, 0 ]) //curve and z height      
        square([ phone_edge_width, phone_height], center = true );
    }
   }
/*
   mirror([0,1,0])
   { 
      translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, 0 ])
    {
      rotate([ 0, 0, 180 ])
      #rotate_extrude( angle = 90, $fn = 96 )
      translate([ phone_edge_curve, 0 ]) //curve and z height      
        square([ phone_edge_width, phone_height], center = true );
    }
   }

   mirror([1,1,0])
   { 
      translate([ -phone_depth/2+phone_corner, -phone_width/2+phone_corner, 0 ])
    {
      rotate([ 0, 0, 180 ])
      #rotate_extrude( angle = 90, $fn = 96 )
      translate([ phone_edge_curve, 0 ]) //curve and z height      
        square([ phone_edge_width, phone_height], center = true );
    }
   }
 */   
    orientaion="top";
    //Screw holes
    if (orientaion=="top") {
      translate([ -phone_width/2+screw_width_min, distance_to_lens/2+binoc_base_width/2+screw_width_min/2, 0 ]) 
      {
        rotate([ 180, 0, 0, ])
        {
          translate([ distance_to_lens, binoc_base_width+.8, .7 ])
          {
            rotate([ 180, 0, 0, ])
            {
              cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
              cylinder( h = screw_height*2, r = screw_width_min, center = true );
              translate([binoc_width, 0, 0]) {
                cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
                cylinder( h = screw_height*2, r = screw_width_min, center = true );
              }
            }
          }
          translate([ binoc_base_width+1.3, distance_to_lens-4, 1 ])
          {
            rotate([ 180, 0, 0, ])
            {
              cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
              cylinder( h = screw_height*2, r = screw_width_min );
              translate([binoc_width, 0, -1]) {
                cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
                cylinder( h = screw_height*2, r = screw_width_min );
              }
            }
          }
          translate([ camera_notch_width+binoc_base_width/2-2.7, distance_to_lens-4, 1.5 ])
          {
            rotate([ 180, 0, 0, ])
            {
              cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
              #cylinder( h = screw_height*2, r = screw_width_min );
              translate([binoc_width, 0, 0]) {
                cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
                cylinder( h = screw_height*2, r = screw_width_min );
              }
            }
          }
        }
      }
    }
    else {
      translate([ -phone_width/2+screw_width_min, -distance_to_lens/2-binoc_base_width/2+screw_width_min, 0 ]) 
      {
        rotate([ 180, 0, 0, ])
        {
          translate([ distance_to_lens, binoc_base_width+1.6, .7 ])
          {
            rotate([ 180, 0, 0, ])
            {
              #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
              #cylinder( h = screw_height*2, r = screw_width_min, center = true );
              translate([binoc_width, 0, 0]) {
                #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
                #cylinder( h = screw_height*2, r = screw_width_min, center = true );
              }
            }
          }
        }
      }
    }
  }
}

module eye_piece()
{
  difference()
  {
    union()
    {
      //Eye piece reference
      //Create the eye piece   
      rotate_extrude( angle = 180, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, binoc_base_width ] )       
      translate( [0, -binoc_base_width] )
        square([ binoc_base_width, binoc_eyepiece_height ] );
    
      //Add the eye piece clip
      translate([ 0, 0, binoc_eyepiece_height ])
      rotate_extrude( angle = 180, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, -clip_size] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);
      
    }
    //bolt holes
  translate([ 0, binoc_eyepiece_radius_inside+binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ binoc_eyepiece_radius_inside+binoc_base_width/2-.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ -binoc_eyepiece_radius_inside-binoc_base_width/2+.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        #nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      //#nutcatch_sidecut("M3", l=100, clk=0.1, clh=0.1, clsl=0.1);
      }
    }
  }
}
            
base();
rotate([ 0, 0, 0 ])
    translate([ -phone_width/2+distance_to_lens+1.6, -phone_depth/2+distance_to_lens+1.6, phone_height/2 ])
eye_piece();