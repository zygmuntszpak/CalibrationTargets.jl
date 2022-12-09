function determine_checkerboard_response(img::AbstractArray)
    itp = interpolate(img, BSpline(Linear()))
    etp = extrapolate(itp, Flat())

    radii = range(0, stop = 1.2, step = 0.5) 
    thetas = range(0; stop = 360, length = 360)
 
    out = zeros(size(img))

    for i in CartesianIndices(img)
        r₀, c₀ = i.I
        values = Vector{Float64}()
        for theta in thetas
            sum_centerline₁ = sum_along_centerline(r₀, c₀, theta, radii, etp)
            sum_centerline₂ = sum_along_centerline(r₀, c₀, theta-90, radii, etp)
            score = (sum_centerline₁ - sum_centerline₂)^2
            push!(values, score)
        end
        out[r₀, c₀] = maximum(values)
    end

    return out
end

function sum_along_centerline(r₀, c₀, theta, radii, etp)
    sum_centerline = zero(Float64)
    for radius in radii
        x₁ = radius*cosd(theta) 
        y₁ = radius*sind(theta) 
        r₁ = r₀ + y₁
        c₁ = c₀ + x₁ 

        x₂ = radius*cosd(-theta) 
        y₂= radius*sind(-theta)
        r₂ = r₀ + y₂
        c₂ = c₀ + x₂

        sum_centerline = sum_centerline + etp(r₁, c₁) + etp(r₂, c₂)
    end  
    return sum_centerline
end