using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

img = Gray{Float64}.(load("data/checkerboard_example.jpg"))
output = find_points(img,0.48,10)
imshow(output)