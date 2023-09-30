$fn = 96;

clip_angle  = 20;
clip_radius = 154;
clip_size = 2;

phone_width=135;
phone_depth=68;
phone_height=3;
camera_notch_width=39;
camera_notch_depth=39;

distance_to_lens=24.8;

binoc_base_width=4;
binoc_base_height=2;
binoc_eyepiece_dia=34;
binoc_eyepiece_radius_inside=17;
binoc_width=71;
binoc_eyepiece_height=20.5-phone_height/2;



module base() {
    difference() {
        union() {
//the phone base          
          //translate([ -phone_width/2-distance_to_lens/2+5, -distance_to_lens, 0 ])
          cube([ phone_width, phone_depth, phone_height ]);
          
//Eye piece reference
    translate([ distance_to_lens, distance_to_lens, 0 ]){
//Create the eye piece   
    rotate_extrude( angle = 360, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, phone_height ] )       
            translate( [0, -binoc_base_width] )
            square([ binoc_base_width, binoc_base_height+binoc_eyepiece_height ] );
    
//second eye piece
translate([ binoc_width, 0, 0 ])
    rotate_extrude( angle = 360, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, phone_height ] )       
            translate( [0, -binoc_base_width] )
            square([ binoc_base_width, binoc_base_height+binoc_eyepiece_height ] );

    
//Add the eye piece clip
              translate([ 0, 0, binoc_eyepiece_height ])
    rotate_extrude( angle = 360, $fn = 96 )
    translate( [-binoc_eyepiece_radius_inside, 0] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);

//second eye piece
translate([ binoc_width, 0,binoc_eyepiece_height ])
    rotate_extrude( angle = 360, $fn = 96 )
    translate( [-binoc_eyepiece_radius_inside, 0] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);

      }
    }
//camera notch
translate([ 0, 0, 0 ])
      cube([ camera_notch_width, camera_notch_depth, 1 ]);
//eye piece cutouts
//Eye piece reference
    #translate([ distance_to_lens, distance_to_lens, phone_height ]){
//Divide the eye piece
rotate([ 0, 0, 10 ])
      rotate_extrude( angle = 160, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, phone_height ] )       
            translate( [-binoc_base_width, -binoc_base_width] )
            square([ binoc_base_width+binoc_base_width+1, binoc_base_height+binoc_eyepiece_height ] );
/*    
mirror([ 1, 0, 0 ])
     # rotate_extrude( angle = 45, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, phone_height ] )       
            translate( [-binoc_base_width, -binoc_base_width] )
            square([ binoc_base_width+binoc_base_width, binoc_base_height+binoc_eyepiece_height ] );

    
//mirror([ 1, 1, 0 ])
        /*
      #rotate_extrude( angle = 45, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, phone_height ] )       
            translate( [-binoc_base_width, -binoc_base_width] )
            square([ binoc_base_width+binoc_base_width, binoc_base_height+binoc_eyepiece_height ]);
    */

//second eye piece
translate([ binoc_width, 0, 0 ]) {
rotate([ 0, 0, 10 ])
//    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
    rotate_extrude( angle = 160, $fn = 96 )
        translate( [binoc_eyepiece_radius_inside, binoc_base_height ] )       
            translate( [-binoc_base_width, -binoc_base_width] )
            square([ binoc_base_width+binoc_base_height+1, binoc_base_height+binoc_eyepiece_height ] );
}}
        
//remove the core
    translate([ distance_to_lens, distance_to_lens, -phone_height/2 ]){
//translate([ 0, 0, -phone_height*2 ])
#cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside );
    
    
//second eyepiece
translate([ binoc_width, 0, 0 ])
#cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside );
    }
 
//Round the corners
      cube([ phone_height*2, phone_height*2, phone_height ]);
    translate([ phone_width-phone_height*2, 0, 0 ])
        #cube([ phone_height*2, phone_height*2, phone_height ]);
translate([ 0, phone_depth-phone_height*2, 0 ])
        #cube([ phone_height*2, phone_height*2, phone_height ]);
translate([ phone_width-phone_height*2, phone_depth-phone_height*2, 0 ])
        #cube([ phone_height*2, phone_height*2, phone_height ]);

  }
  union(){
    translate([ phone_height*2, phone_height*2, 1 ])
      cylinder( h = phone_height-1, r = phone_height*2 );
   translate([ phone_width-phone_height*2, phone_height*2, 0 ])
    cylinder( h = phone_height, r = phone_height*2 );
       
translate([ phone_height*2, phone_depth-phone_height*2, 0 ])
cylinder( h = phone_height, r = phone_height*2 );

translate([ phone_width-phone_height*2, phone_depth-phone_height*2, 0 ])
cylinder( h = phone_height, r = phone_height*2 );

  }
}

module eye_pieces(){
  difference(){
    union(){
  //Eye piece reference
      //translate([ distance_to_lens, distance_to_lens, 0 ]){
//Create the eye piece   
      rotate_extrude( angle = 200, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, binoc_base_width ] )       
      translate( [0, -binoc_base_width] )
        square([ binoc_base_width, binoc_eyepiece_height ] );
    
    
//Add the eye piece clip
      translate([ 0, 0, binoc_eyepiece_height ])
      rotate_extrude( angle = 200, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, -clip_size] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);
      
      
      
    }
  }
}
            
        
               
          
//base();
eye_pieces();