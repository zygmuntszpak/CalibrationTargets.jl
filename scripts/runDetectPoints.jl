using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

img = checkerboard(8,8)
out = detect_points(img, 0.4, 10)
imshow(out)

img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
out2 = detect_points(img2, 0.4, 10)
imshow(out2)