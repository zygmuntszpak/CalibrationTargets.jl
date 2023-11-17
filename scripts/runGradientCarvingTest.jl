using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

#img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
img2 = Gray{Float64}.(load("data/test5.jpeg"))
detected_points = detect_points(img2, 0.37, 10)
imshow(detected_points)

imshow(img2)

kernelfunc = KernelFactors.scharr
Gy, Gx = imgradients(img2,kernelfunc, "replicate");
mag = sqrt.(Gy.^2 + Gx.^2)

binary = detected_points .> 0.0
conrner_candiates = Vector{CartesianIndex{2}}()
map = Dict{CartesianIndex{2}, Int64}()
# Store candidates
for i in CartesianIndices(detected_points)
    if detected_points[i] > 0.0
        push!(map, i => 0)
        push!(conrner_candiates, i)
    end
end


seam_carving_down!(mag, conrner_candiates, map)
seam_carving_up!(mag, conrner_candiates, map)
final_points = remove_after_carve(map)
differences = setdiff(conrner_candiates, final_points)

for point in differences
       x = point[1]
    y = point[2]
    detected_points[x,y] = 0
end
#imshow(binary + mag)
imshow(detected_points)