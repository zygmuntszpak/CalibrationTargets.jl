function createblur(img::Matrix{Gray{N0f8}}, angle::Float64 )

    # define transformation
    trfm = recenter(RotMatrix(angle), center(img))
    imgw = warp(img, trfm)

    # Applying blur
    bimg = imfilter(imgw,Kernel.gaussian(3))

    trfm = recenter(RotMatrix(-(angle)), center(img))

    fimg = warp(bimg,trfm)

    width, height = size(img)

    final = fimg[1:width, 1:height]

    return final
end
