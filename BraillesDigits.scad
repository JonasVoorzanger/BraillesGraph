// End goal: build a function that outputs a given character (letter of number) in braille at given coordinates

$fn = 20;

dot_radius = 0.6;
dot_height = 0.5;

module dot_full(){
    difference(){
    translate([0,0,-(dot_radius-dot_height)]){
        sphere(dot_radius, center=true);
        };
translate([0,0,-dot_radius]){
cube(2*dot_radius, center=true);
}
    };
};

module dot(x,y){
    translate([x,y,0]){
        dot_full();
        };
    };

module dot1(){dot(0,5);}
module dot2(){dot(0,2.5);}
module dot3(){dot(0,0);}
module dot4(){dot(2.5,5);}
module dot5(){dot(2.5,2.5);}
module dot6(){dot(2.5,0);}

module dot_i(i){
     if(i ==1) {dot1();}
else if(i ==2) {dot2();}
else if(i ==3) {dot3();}
else if(i ==4) {dot4();}
else if(i ==5) {dot5();}
else if(i ==6) {dot6();}
};

    
module dotcombo(dots){
for(i = [0: len(dots)-1]){dot_i(dots[i]);}
    };
    
module brailles_digit_uncentered(i){
     if(i == "1") {dotcombo([1]);}
else if(i == "2") {dotcombo([1,2]);}
else if(i == "3") {dotcombo([1,4]);}
else if(i == "4") {dotcombo([1,4,5]);}
else if(i == "5") {dotcombo([1,5]);}
else if(i == "6") {dotcombo([1,2,4]);}
else if(i == "7") {dotcombo([1,2,4,5]);}
else if(i == "8") {dotcombo([1,2,5]);}
else if(i == "9") {dotcombo([2,4]);}
else if(i == "0") {dotcombo([2,4,5]);}
else if(i == "a") {dotcombo([1]);}
else if(i == "b") {dotcombo([1,2]);}
else if(i == "c") {dotcombo([1,4]);}
else if(i == "d") {dotcombo([1,4,5]);}
else if(i == "e") {dotcombo([1,5]);}
else if(i == "f") {dotcombo([1,2,4]);}
else if(i == "g") {dotcombo([1,2,4,5]);}
else if(i == "h") {dotcombo([1,2,5]);}
else if(i == "i") {dotcombo([2,4]);}
else if(i == "j") {dotcombo([2,4,5]);}
else if(i == "k") {dotcombo([1,3]);}
else if(i == "l") {dotcombo([1,2,3]);}
else if(i == "m") {dotcombo([1,3,4]);}
else if(i == "n") {dotcombo([1,3,4,5]);}
else if(i == "o") {dotcombo([1,3,5]);}
else if(i == "p") {dotcombo([1,2,3,4]);}
else if(i == "q") {dotcombo([1,2,3,4,5]);}
else if(i == "r") {dotcombo([1,2,3,5]);}
else if(i == "s") {dotcombo([2,3,4]);}
else if(i == "t") {dotcombo([2,3,4,5]);}
else if(i == "u") {dotcombo([1,3,6]);}
else if(i == "v") {dotcombo([1,2,3,6]);}
else if(i == "w") {dotcombo([2,4,5,6]);}
else if(i == "x") {dotcombo([1,3,4,6]);}
else if(i == "y") {dotcombo([1,3,4,5,6]);}
else if(i == "z") {dotcombo([1,3,5,6]);}
else if(i == "#") {dotcombo([3,4,5,6]);}
else if(i == "-") {dotcombo([3,6]);}
else if(i == "+") {dotcombo([3,4,6]);}
else if(i == "/") {dotcombo([3,4]);}
else if(i == "^") {dotcombo([4,5]);}
else if(i == " ") {dotcombo();}
    };

module brailles_digit(i){
    translate([-1.25,-5.6,0]){
        brailles_digit_uncentered(i);    
    };
};

// build words in brailles
module brailles_word_uncentered(list){
    length = len(list);
    for(i = [0: length-1]){
        // for every next char, move 6 mm to the right
        translate([6*i,0,0]){
            brailles_digit_uncentered(list[i]);
            }
        }
    };

// word where origin is on the LEFT, vertically centered
module brailles_word_L(list){
    length = len(list);
    translate([0.6, -2.5]){brailles_word_uncentered(list);}
    }

// word where origin is on the RIGHT, vertically centered
module brailles_word_R(list){
    length = len(list);
    translate([-(3.1+(length-1)*6), -2.5]){brailles_word_uncentered(list);}
    }


// word where origin is on the TOP, horizontally centered
module brailles_word_T(list){
    length = len(list);
    translate([-6*length/2+1.8,-5.6]){brailles_word_uncentered(list);}
    }

// word where origin is on the BOTTOM, horizontally centered
module brailles_word_B(list){
    length = len(list);
    translate([-6*length/2+1.8,+0.6]){brailles_word_uncentered(list);}
    }

// Example code to turn '-1/4x^2+4' into brailles
brailles_word_B(["-","1","/","4","x","^","2","+","4"]);
