using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

#img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
img2 = Gray{Float64}.(load("data/radial_distortion.png"))
out2 = detect_points(img2, 0.25, 100)
imshow(out2)

imshow(img2)

kernelfunc = KernelFactors.scharr
Gy, Gx = imgradients(img2,kernelfunc, "replicate");
mag = sqrt.(Gy.^2 + Gx.^2)

binary = out2 .> 0.0
imshow(mag + binary)