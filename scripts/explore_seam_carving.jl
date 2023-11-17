using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

#img = Gray{Float64}.(load("data/checkerboard_example.jpg"))
img = Gray{Float64}.(load("data/test1.png"))
#img = Gray{Float64}.(load("data/test4.jpeg"))

# define transformation
trfm = recenter(RotMatrix(pi/3), center(img));
imgw = warp(img, trfm);
display(imgw)

detected_points = detect_points(imgw, 0.3, 10)

function foo(detected_points)

    #detected_points = detect_points(imgw, 0.3, 10)
    #imshow(detected_points)

    kernelfunc = KernelFactors.scharr
    Gy, Gx = imgradients(imgw, kernelfunc, "replicate");
    mag = sqrt.(Gy.^2 + Gx.^2)

    corner_candidates = Vector{CartesianIndex{2}}()
    mapping = Dict{CartesianIndex{2}, Int64}()

    # Store candidates
    for i in CartesianIndices(detected_points)
        if detected_points[i] > 0.0
            push!(mapping, i => 0)
            push!(corner_candidates, i)
        end
    end

    for i in corner_candidates
        mag[i] = 1.0
    end

    threshold = find_threshold(mag, UnimodalRosin())
    
    i = first(corner_candidates)
    @show i

    # Use histogram thresholding to select a decent threshold for the magnitude strength

    # Send a probe out south_east, south, and south_west and determine which
    # one yields the strongest edge magnitude...
    south_eastward = south_east() 
    max_iteration = length(mag)
    iteration = 1
    while(mag[i] >= threshold && iteration < max_iteration) # TODO add max_iterations
        j = argmax(map(δ -> mag[i + δ], south_eastward))
        i = i + south_eastward[j]
        # TODO remove this.. (this is just for drawing purposes)
        mag[i] =  (mag[i] >= threshold && mag[i] != 1.0)  ? 0.8 : mag[i]
        iteration = iteration + 1
    end

    return mag
end

north() = SVector{3, CartesianIndex{2}}(CartesianIndex(-1, -1), CartesianIndex(-1, 0), CartesianIndex(-1, 1)) 
east() = SVector{3, CartesianIndex{2}}(CartesianIndex(-1, 1), CartesianIndex(0, 1), CartesianIndex(1, 1)) 
south() = SVector{3, CartesianIndex{2}}(CartesianIndex(1, -1), CartesianIndex(1, 0), CartesianIndex(1, 1)) 
west() = SVector{3, CartesianIndex{2}}(CartesianIndex(-1, -1), CartesianIndex(0, -1), CartesianIndex(1, -1)) 

north_east() = SVector{3, CartesianIndex{2}}(CartesianIndex(-1, 0), CartesianIndex(-1, 1), CartesianIndex(0, 1)) 
south_east() = SVector{3, CartesianIndex{2}}(CartesianIndex(1, 0), CartesianIndex(1, 1), CartesianIndex(0, 1)) 

north_west() = SVector{3, CartesianIndex{2}}(CartesianIndex(-1, 0), CartesianIndex(-1, -1), CartesianIndex(0, -1))
south_west() = SVector{3, CartesianIndex{2}}(CartesianIndex(1, 0), CartesianIndex(1, -1), CartesianIndex(0, -1))

# function foo2(img)
#     main = Gray{Float64}.(img)
#     rotations = [0, 15, 30, 45, 60, 75]
#     squeezes = [0, 9, 18, 27]
#     T = typeof(similar(main, Float64))
#     responses = Vector{T}()
#     for rotation in rotations
#         for squeeze in squeezes
#             template_cb = construct_sectors(squeeze,rotation)   
#             f₁ = Template(template_cb)
#             window = axes(centered(template_cb))
#             out = mapwindow(f₁, main, window)
#             push!(responses,out)
#         end
#     end
#     return responses
#     #layered_responses = cat(responses...; dims = 3)
# end