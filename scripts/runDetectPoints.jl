using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

img = checkerboard(8,8)
detect_points(img)

img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
detect_points(img2)