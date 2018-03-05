///lineWidth(x0,y0,dx,dy, einit,width,winit, tilemap_id):

//code taken from http://kt8216.unixcab.org/murphy/index.html

//helper for function that draws paths
//currently only works properly in the octant 45 degrees 
//under the positive x axis on a normal graph

var x0= argument0;
var y0= argument1;
var dx= argument2;
var dy= argument3;
var einit = argument4;
var width = argument5
var winit = argument6; 
var tilemap_id = argument7;
var terraform_on = argument8;


var xc=x0+(sign(dx) * 6/ (sqrt(1 + (power(dy, 2)/power(dx, 2))))); //current x you are drawing, shifted some distance away from the player
var yc=y0+(sign(dy) * 6 / (sqrt(1 + (power(dx, 2)/power(dy, 2))))); //current y you are drawing, shifted some distance away from the player

var xstep = 1;
var ystep = 1;
if (dx < 0)
	xstep = -1; //tests if x is in a negative quadrant
if (dy < 0)
    ystep = -1; //tests if y is in a negative quadrant

var vOctant = (abs(dy) > abs(dx)); //tests if path lies in a vertical octant or not

if (vOctant)
  {
	  var threshold = abs(dy) - 2*abs(dx);
	  var E_diag= -2*abs(dy);
	  var E_square= 2*abs(dx);
  }
else
  {
	  var threshold = abs(dx) - 2*abs(dy);
	  var E_diag= -2*abs(dx);
	  var E_square= 2*abs(dy);
  }
var wthr= 2*width*sqrt(dx*dx+dy*dy);

var error= einit;
var tk= abs(dx)+abs(dy)-winit;

while (tk<=wthr){ //remove "=" for even tiled widths
	
	if(tilemap_get(tilemap_id, xc, yc) == 0) {
		if(terraform_on) {
		  /*var coinflip = floor(random(4));
			
		  if(coinflip != 0)
			tilemap_set(tilemap_id, 15, xc, yc);
		  else*/
			tilemap_set(tilemap_id, 39, xc, yc);
			
		  instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_barrierSmall);
		}
		else {
			tilemap_set(tilemap_id, 38, xc,yc);
		}
	}

    if (error > threshold) { 
       if (vOctant)
	   {
		   yc= yc - ystep;
	       error = error + E_diag;
	       tk= tk + 2*abs(dx);
	   }
	   else
	   {
		   xc= xc - xstep;
	       error = error + E_diag;
	       tk= tk + 2*abs(dy);
	   }
	 }
	 if (vOctant)
	   {
		   error = error + E_square;
		   xc= xc + xstep;
		   tk= tk + 2*abs(dy);
	   }
	   else
	   {
		   error = error + E_square;
		   yc= yc + ystep;
		   tk= tk + 2*abs(dx);
	   }
     
}

  
xc=x0+(sign(dx) * 6 / (sqrt(1 + (power(dy, 2)/power(dx, 2))))); //current x you are drawing
yc=y0+(sign(dy) * 6 / (sqrt(1 + (power(dx, 2)/power(dy, 2))))); //current y you are drawing

error= -einit;
tk= abs(dx)+abs(dy)+winit;

while (tk<=wthr) { 
	
	if(tilemap_get(tilemap_id, xc, yc) == 0) {
		if(terraform_on) {
		  /*var coinflip = floor(random(4));
			
		  if(coinflip != 0)
			tilemap_set(tilemap_id, 15, xc, yc);
		  else*/
			tilemap_set(tilemap_id, 39, xc, yc);
			
		  instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_barrierSmall);
		}
		else {
			tilemap_set(tilemap_id, 38, xc,yc);
		}
	}
	
    if (error > threshold) { 
	if (vOctant)
	{
		yc= yc + ystep;
	    error = error + E_diag;
	    tk= tk + 2*abs(dx);
	}
	else
	{
	    xc= xc + xstep;
	    error = error + E_diag;
	    tk= tk + 2*abs(dy);
	}
	}
	if (vOctant)
	{
		error = error + E_square;
		xc= xc - xstep;
		tk= tk + 2*abs(dy);
	}
	else
	{
		error = error + E_square;
		yc= yc - ystep;
		tk= tk + 2*abs(dx);
	}
}