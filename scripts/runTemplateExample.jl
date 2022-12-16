using CalibrationTargets
using Images 
using LinearAlgebra
using ImageFiltering
using ImageView
using ImageTransformations
using CoordinateTransformations
using Rotations

struct Template{T <: AbstractArray} 
    mask::T
end

function (template::Template)(patch::AbstractArray)
    #return norm(patch .- template.mask) / length(template.mask)
    N₀ = 0
    N₁ = 0
    total₀ = zero(eltype(patch))
    total₁ = zero(eltype(patch))

    for i in CartesianIndices(template.mask)
        if template.mask[i] == 1
            N₁ = N₁ + 1
            total₁ = total₁ + patch[i]
        else
            N₀ = N₀ + 1
            total₀ = total₀ + patch[i]
        end
    end

    μ₀ = total₀ / N₀
    μ₁ = total₁ / N₁
    # If we hit a checkerboard corner point then the average
    # intensities between the two regions will be the highest
    # because we will be subtracting pure white from pure black.
    return abs(μ₀ - μ₁)
end

function pick_maximum_response(responses)
    nrow, ncol, ndepth = size(responses)
    maximum_response = zeros(nrow, ncol)
    for r = 1:nrow
        for c = 1:ncol
            maximum_response[r,c] = maximum(responses[r,c,:]) 
        end
    end
    return maximum_response 
end


# Example checkerboard template
main_cb = Float64.(checkerboard(8, 7))

# Small checkerboard patch which we shall try to slide across
# the target image to detect the checkerboard corners
template_cb = Float64.(checkerboard(2,2 ; square_size = 5)) 
template_cb = template_cb[1:end-1, 1:end-1]
window = axes(centered(template_cb))
# Construct two templates based on the small checkerboard patch
f₁ = Template(template_cb)
# Slide the two templates across the target image
out₁ = mapwindow(f₁, main_cb, window)


# Combine the responses into a multi-dimensional array
# Here you would be appending the result of applying the template to
# rotated versions of the input image. 
responses = cat(out₁; dims = 3)
out = pick_maximum_response(responses)
imshow(template_cb)

# Notice how the corner points have the largest values
imshow(out)


# Run this to stretch the contrast so that everything is brigher (for debugging)
#adjust_histogram(Gray.(out₁), LinearStretching())
#adjust_histogram(Gray.(out), LinearStretching())


# Here we work with a real image 
img = Gray{Float64}.(load("data/checkerboard_example.jpg"))
rotation_angle = 0
trfm = recenter(RotMatrix(deg2rad(rotation_angle)), center(img));
imgw = warp(img, trfm);

out₁ = mapwindow(f₁, imgw, window)
responses = cat(out₁; dims = 3)
out = pick_maximum_response(responses)
# Apply the inverse warp to bring the image back to its original pose
fimg = warp(out,inv(trfm));
imshow(out)




