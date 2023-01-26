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
trfm = recenter(RotMatrix(pi/2), center(img));
imgw = warp(img, trfm);
imshow(imgw)

# Apply detect points with a "squeezed" mask
 out = detect_points(imgw, 0.60, 15)
 imshow(out)

 img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
 trfm2 = recenter(RotMatrix(pi/4), center(img2));
 imgw2 = warp(img2, trfm2);
 imshow(imgw2)

 out2 = detect_points(imgw2, 0.475, 15)
 imshow(out2)