function detect_points(img::AbstractArray, quality::Number, min_dist::Int )
    
    main = Gray{Float64}.(img)
   
   # template_cb = Float64.(checkerboard(2,2 ; square_size = 5)) 
   # template_cb = template_cb[1:end-1, 1:end-1]
    
    #template_cb = construct_sectors() ## Creates 90 degree deafult template
   
    template_cb = construct_sectors(0,22.5)    
    f₁ = Template(template_cb)
    window = axes(centered(template_cb))
    out₁ = mapwindow(f₁, main, window)

    template_cb2 = construct_sectors(0,45)    
    f2 = Template(template_cb2)
    window2 = axes(centered(template_cb2))
    out2 = mapwindow(f2, main, window2)

    template_cb3 = construct_sectors(0,67.5)    
    f3 = Template(template_cb3)
    window3 = axes(centered(template_cb3))
    out3 = mapwindow(f3, main, window3)

    template_cb4 = construct_sectors()    
    f4 = Template(template_cb4)
    window4 = axes(centered(template_cb4))
    out4 = mapwindow(f4, main, window4)

    layerd_responses = cat(out₁,out2,out3,out4; dims = 3);

    out = pick_maximum_response(layerd_responses)
    # Apply the inverse warp to bring the image back to its original pose
    # Fimg = warp(out,inv(trfm));
    non_max_supress!(out, quality, min_dist)
    return out
end

