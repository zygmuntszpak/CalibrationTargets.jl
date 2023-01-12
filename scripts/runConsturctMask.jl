using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

# Rotating checkerboard
img = checkerboard(8,8)
trfm = recenter(RotMatrix(pi/4), center(img));
imgw = warp(img, trfm);
imshow(imgw)

# Apply detect points with a "squeezed" mask
out = detect_points(imgw, 0.60, 15)
imshow(out)