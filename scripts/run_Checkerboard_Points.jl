using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations
using Statistics

img = Gray{Float64}.(load("data/checkerboard1.PNG"))
output = checkerboard_points(img,0.3,10,0.2)
imshow(output)