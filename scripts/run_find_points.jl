using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

# Goto the binary and binary + mag of this to try find error when there is a rotation with gradient carve
img = Gray{Float64}.(load("data/test3.jpeg"))
output = find_points(img,0.4,10)
imshow(output)

# Slight errors, test at 0.37, 0.4 and 0.3 # I think i may need to add the stop point of the gradient carve as a a parameter
img = Gray{Float64}.(load("data/test5.jpeg"))
output = find_points(img,0.37,10)
imshow(output)

