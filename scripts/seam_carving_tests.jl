using CalibrationTargets

A = [1 2 3 4 5 6;
    3 4 1 1 1 1;
    1 5 6 3 3 3;
    5 6 8 4 3 2;
    7 6 8 9 6 5]

seam_carving_down!(A,1 ,1 )

A
