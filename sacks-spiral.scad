/*
    Sacks Spiral
    2019-10-01
    https://github.com/GeoffMaciolek/????
    https://thingiverse.com/whatever (geo profile)

    An archimedes spiral highlighting prime numbers.  The Sacks Spiral
    is based on the Ulam spiral.
    https://en.wikipedia.org/wiki/Ulam_spiral
*/

/*
    Settings
*/

// Base Width - how large do you want this to be, in mm?
// base_width=300;
// Overall Height Ratio - how much of a 'pancake' vs a soda can? 0.1 = Height is 1/10th the width
overall_height_ratio=0.1;
// Max Number - How high do you want to count?
max_num=300; //scale needs fixing for 'width/num ratio'


//$fn=160; // Circle face number (can be defined per object)

/*
    GLOBALS
*/
returnPrime=false; // Used as a return in the isPrime "module"
                   // to emulate a standard C-esque function


base_width=max_num; //*0.173; // Happens to work out this way IF max_num is 300. Fiddling?


overall_height=base_width*overall_height_ratio;
section_height=overall_height/4;

/*
    MODULES
*/


module base() {
    $fn=160;
        
    cylinder(
        h = section_height*2,
        r = base_width
    );
}

module middle(base_width=200) {
    $fn=160;
    overall_height=base_width*overall_height_ratio;
    translate([0, 0, overall_height])
        cylinder(
            h = overall_height,
            r = base_width*0.8
            // y = 0 + overall_height*overall_height_ratio
        );
}

module littlespot(x,y,type) { } // TODO

module arch_spiral() {
    dia=base_width/45; // to be set up based on max num.
    spacing_factor=16;
    
    for(i = [1:max_num]) {        
        // time = i / 20 * PI;
        //x= (4 + (20 * time)) * cos(time);
        //y= (4 + (20 * time)) * sin(time);
        
        //x=(-1 * cos(sqrt(i)*2*PI)*sqrt(i))*400;
        //y=(sin(sqrt(i)*2*PI)*sqrt(i))*400;
        
        r = sqrt(i);
        //echo("I: ", i, "   R: ", r);
        theta = r * 2 * PI;

        x = cos(theta*(180/PI))*(r*spacing_factor);
        y = sin(theta*(180/PI))*(r*spacing_factor)*-1;
        
        primeoffset=1;
        // if it's prime, set above to 2
        
        translate([x,y,overall_height])
            cylinder(
                r=dia+((primeoffset-1)*1.5), //1.5 here is the 'larger factor' for prime spots
                h=section_height//*primeoffset
            );
            //cube([5,5,5]);
    }
    
    /* sachs type:
    
    theta = sqrt(i) * 2 * pi
    r = sqrt(i),

    and thus its x,y co-ordinates are given by:

    x = -cos(sqrt(i)*2*pi)*sqrt(i)
    y = sin(sqrt(i)*2*pi)*sqrt(i)

    
    
    
    standard:
    for i in range(200):
        t = i / 20 * pi
        x = (1 + 5 * t) * cos(t)
        y = (1 + 5 * t) * sin(t)
        plot(x, y)

    */
    
}

module isPrime(num) { // Uses the "global" boolean 'returnPrime' to return value
    returnPrime=false;
}

function isPrimeNotWorky(intp) = 
    intp == 1 ? 1
    : intp == 2 ? 1
    : ((intp % 2) == 0) ? 1 : 0;

    
    /* Python 2.5
    return not (a < 2 or any(a % x == 0 for x in xrange(2, int(a**0.5) + 1)))
    
    some openscad ternary thing:
    function f(x) = x == 1 ? 42
                    : x == 2 ? 99 : 0;

    This returns 42 when x is 1, 99 when x = 2 otherwise 0.
    
    */


/*
    BEGIN MAIN EXECUTION
*/

base();

arch_spiral();
//middle();

for(testy = [1:15]) {
    echo(testy, "is prime? ",isPrime(testy));
}
   