function createmaxblur(img::Matrix{Gray{N0f8}})
    # Creates four blurred images at the specified angles
    img_1 = createblur(img,pi/4);     # 45 degree  rotation blur 
    img_2 = createblur(img,pi/2);     # 90 degree  rotation blur 
    img_3 = createblur(img, 2.35619); # 135 degree rotation blur  
    img_4 = createblur(img, pi/1)     # 180 degree rotation blur 

    # Creates a four dimensional array of these four imgs
    combined_3d = cat(img_1,img_2,img_3,img_4; dims = 3);
end
