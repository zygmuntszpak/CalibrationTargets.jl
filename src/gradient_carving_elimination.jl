function gradient_carving_elimination(img::AbstractArray)
    kernelfunc = KernelFactors.scharr
    Gy, Gx = imgradients(img,kernelfunc, "replicate");
    mag = sqrt.(Gy.^2 + Gx.^2)
    
    binary = out2 .> 0.0
    imshow(mag + binary)


end