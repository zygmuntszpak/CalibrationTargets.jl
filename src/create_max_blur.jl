function createmaxblur(img::Matrix{Gray{N0f8}})
    # Creates four blurred images at the specified angles
    img_1 = createblur(img,0.0);        # 0 degree  rotation blur 
    img_2 = createblur(img,pi/4);       # 45 degree  rotation blur 
    img_3 = createblur(img, pi/2);      # 90 degree rotation blur  
    img_4 = createblur(img, (3*pi)/4)   # 135 degree rotation blur 

    angles = deg2rad.([0, 45, 90, 135])
    images = [createblur(img, angle) for angle in angles]
    layerd_3d = cat(images...; dims = 3)

    # Creates a four dimensional array of these four imgs
    layerd_3d = cat(img_1,img_2,img_3,img_4; dims = 3);

    width, height, depth = size(layerd_3d);

    combined = zeros(size(img))
    for i = 1:width
        for j = 1:height
            val = (maximum(layerd_3d[i,j,:]) - minimum(layerd_3d[i,j,:]))^2
            combined[i,j] = val
        end
    end
    return combined
end
