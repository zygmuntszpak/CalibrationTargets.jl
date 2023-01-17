function detect_points(img::AbstractArray, quality::Number, min_dist::Int )
    
    main = Gray{Float64}.(img)

    angles = deg2rad.([0, 15, 30, 45, 60, 75])

    responses = Array{Any}(undef,0,0,0) # need a data structure to store all the responses

    for angle in angles
        template_cb = construct_sectors(0,angle)    
        f₁ = Template(template_cb)
        window = axes(centered(template_cb))
        out = mapwindow(f₁, main, window)
        push!(out,responses)
    end

    layerd_responses = cat(responses...; dims = 3); # Layer All Together

    out = pick_maximum_response(layerd_responses)   # Take best point for each pixel

    non_max_supress!(out, quality, min_dist)

    return out
end

