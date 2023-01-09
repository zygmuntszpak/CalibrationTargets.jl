# 0 <= squeeing_angle < 45
# 0 <= rotation_angle <= 180
function construct_sectors(squeezing_angle::Real = 0, rotation_angle::Real = 0; dim::Int = 9)
    ρ = squeezing_angle
    α = rotation_angle
    !(0 <= ρ < 45) ? throw(ArgumentError("You squeezing_angle must lie in the interval [0,45).")) : nothing
    !(0 <= α <= 180) ? throw(ArgumentError("The rotation_angle must lie in the interval [0, 180].")) : nothing

    mask = centered(zeros(Float64, (dim,dim)))
    for i in CartesianIndices(mask)
        γ = rad2deg(atan(i.I[1], i.I[2]))
        # Ensure the angle lies in the interval 0..360 degrees
        θ = (γ  + 360) % 360
        # Apply the rotation angle α
        θ = (θ + α) % 360

        if  (0 + ρ) % 360 < θ <  (90 - ρ ) % 360
            mask[i] = 0.0
        elseif (180 + ρ) % 360  <= θ <= (270 - ρ) % 360
            mask[i] = 0.0
        else
            mask[i] = 1.0
        end
    end
    mask[0,0] = 0
    return collect(mask)
end