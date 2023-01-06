using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

# img = checkerboard(8,8)
# out = detect_points(img)
# imshow(out)

# img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
# out2 = detect_points(img2)
# imshow(out2)

img3 = Gray{Float64}.(load("data/checkerboard1.png"))
out3 = detect_points(img4, 0.25, 10)
imshow(out4)