function detect_points(img::AbstractArray, quality::Number, min_dist::Int )
    
    main = Gray{Float64}.(img)
    template_cb = Float64.(checkerboard(2,2 ; square_size = 5)) 
    template_cb = template_cb[1:end-1, 1:end-1]
    window = axes(centered(template_cb))

    f₁ = Template(template_cb)

    # rotation_angle = 0
    # trfm = recenter(RotMatrix(deg2rad(rotation_angle)), center(img));
    # imgw = warp(img, trfm);

    out₁ = mapwindow(f₁, main, window)
    responses = cat(out₁; dims = 3)
    out = pick_maximum_response(responses)
    # Apply the inverse warp to bring the image back to its original pose
    # Fimg = warp(out,inv(trfm));
   
   
    out = non_max_supress(out, quality, min_dist)
    return out
end

