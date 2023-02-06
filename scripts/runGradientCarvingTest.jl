using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

#img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
img2 = Gray{Float64}.(load("data/checkerboard2.png"))
detected_points = detect_points(img2,0.2,10)
imshow(detected_points)

imshow(img2)

kernelfunc = KernelFactors.scharr
Gy, Gx = imgradients(img2,kernelfunc, "replicate");
mag = sqrt.(Gy.^2 + Gx.^2)

binary = detected_points .> 0.0
conrner_candiates = Vector{CartesianIndex{2}}()
    
# Store candidates
for i in CartesianIndices(detected_points)
    if detected_points[i] > 0.0
        push!(conrner_candiates, i)
    end
end
seam_carving_up!(mag, 216, 285)
imshow(mag + binary)