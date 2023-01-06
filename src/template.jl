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