module pyramid_sharp_origin(r, h){
    polyhedron(points = [ [r, 0, 0], [0, r, 0], [-r, 0, 0], [0, -r, 0], [0, 0, h] ], faces = [[0,1,2,3], [0,1,4], [1,2,4], [2,3,4], [0,3,4]]);
};

module pyramid_straight_origin(r, h){
    polyhedron(points = [ [r, r, 0], [-r, r, 0], [-r, -r, 0], [r, -r, 0], [0, 0, h] ], faces = [[0,1,2,3], [0,1,4], [1,2,4], [2,3,4], [0,3,4]]);
};

module pyramid(r,h, coords){
    translate([coords[0],coords[1],coords[2]]){
        pyramid_straight_origin(r/2,h);
    }
}

module wall(r, h, coords1, coords2){
    hull(){
    pyramid(r,h,[coords1[0], coords1[1], coords1[2]]);
    pyramid(r,h,[coords2[0], coords2[1], coords2[2]]);
    };
};