$fn = 96;


//wall_thickness = 3;

//hose_radius = 22/2;
//hose_height = 12;


//clip_base   = 6;
clip_angle  = 20;
clip_radius = 154;
clip_size = 2;

phone_width=135;
phone_depth=68;
phone_height=2;

//adapter_height=2;

distance_to_lens=24.8;

binoc_base_width=2;
binoc_base_height=2;
binoc_eyepiece_dia=34;
binoc_eyepiece_radius_inside=17;
binoc_width=71;
binoc_eyepiece_height=20.5-phone_height+binoc_base_height;



module base() {
    difference() {
        union() {
//the phone base          
          //translate([ -phone_width/2-distance_to_lens/2+5, -distance_to_lens, 0 ])
          cube([ phone_width, phone_depth, phone_height ]);
//Eye piece reference
    translate([ distance_to_lens, distance_to_lens, phone_height ]){
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
    
//eye pieces
//Eye piece reference
    translate([ distance_to_lens, distance_to_lens, phone_height ]){
//Divide the eye piece
    translate([ binoc_base_width, binoc_base_width, -binoc_eyepiece_height/2 ])
 #     rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height+phone_height+binoc_base_height ]);
    }
mirror([ 1, 0, 0 ])
    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
    rotate([ 0, 0, 0 ])
      rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height*2 ]);

mirror([ 1, 1, 0 ])
    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
    rotate([ 0, 0, -20 ])
      rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height*2 ]);

//second eye piece
translate([ 0, binoc_width, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])

//    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
      rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height*2 ]);

mirror([ 1, 0, 0 ])
translate([ 0, binoc_width, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])

//    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
    rotate([ 0, 0, 0 ])
      rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height*2 ]);

mirror([ 1, 1, 0 ])
translate([ -binoc_width, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])

//    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
    rotate([ 0, 0, -20 ])
      rotate_extrude( angle = 45, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -4, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width*8, binoc_eyepiece_height*2 ]);


//remove the outer edges
    translate([ 0, 0, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
      rotate_extrude( angle = 360, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -binoc_base_width*2, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width+1.5, binoc_eyepiece_height*2 ]);
        
//second eye_piece
    translate([ 0, binoc_width, -binoc_eyepiece_height/2+binoc_base_width/2+phone_height ])
      rotate_extrude( angle = 360, $fn = 96 )
    translate( [-binoc_eyepiece_dia/2-binoc_base_width/2, 0 ] )
      translate([ -binoc_base_width*2, binoc_eyepiece_height/2-binoc_base_width ])
        square([ binoc_base_width+1.5, binoc_eyepiece_height*2 ]);
        
//remove the core
translate([ 0, 0, -phone_height*2 ])
cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside );

//second eyepiece
translate([ 0, binoc_width, -phone_height*2 ])
cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside );

                    }

              } 

base();
//clips();