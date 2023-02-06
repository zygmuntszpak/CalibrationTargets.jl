using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

img = Gray{Float64}.(load("data/checkerboard2.png"))
output = find_points(img,0.2,10)
imshow(output)