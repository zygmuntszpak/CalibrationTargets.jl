using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

#img = checkerboard(8,8)
#out = detect_points(img, 0.4, 15)
#imshow(out)

img2 = Gray{Float64}.(load("data/checkerboard_example.jpg"))

#img2 = Gray{Float64}.(load("data/radial_distortion.png"))
out2 = detect_points(img2, 0.475, 10)
imshow(out2)

imshow(img2)

kernelfunc = KernelFactors.scharr
Gy, Gx = imgradients(img2,kernelfunc, "replicate");
mag = sqrt.(Gy.^2 + Gx.^2)

binary = out2 .> 0.0

detected_points = Vector{CartesianIndex{2}}()

threshold = 0.15

# Iterate through each pixel in the image
for i in 1:size(mag, 1)
    for j in 1:size(mag, 2)
        
        # Check if pixel value is below threshold
        if mag[i, j] < threshold
            # If below threshold, set pixel value to 0
            mag[i, j] = 0
        end
    end
end

# Show the final image
imshow(mag)


# non_max_supress(mag)
    



