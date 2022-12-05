using CalibrationTargets
using ImageTransformations, TestImages, CoordinateTransformations, Rotations

img = checkerboard(3,3)

# define transformation
trfm = recenter(RotMatrix(pi/4), center(img));
imgw = warp(img, trfm);
display(imgw)