using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations
using Statistics


#img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))
 img2 = Gray{Float64}.(load("data/checkerboard2.png"))

out2 = detect_points(img2, 0.2, 10)

detected_points = Vector{CartesianIndex{2}}()

# Store candidates
for i in CartesianIndices(out2)
    if out2[i] > 0.0
        push!(detected_points, i)
    end
end


points = median_dist_elim(detected_points, 0.2)

differences = setdiff(detected_points, points)

for point in differences
    x = point[1]
    y = point[2]
    out2[x,y] = 0
end

imshow(out2)