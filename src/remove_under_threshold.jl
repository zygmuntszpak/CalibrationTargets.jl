function remove_under_threshold(img::AbstractArray, quality::Float64 )      # A further addition could be to state how many "good" corners you wish to remain in the image
    m, n = size(img)

    above_min_quality = []
    for i in range(1, stop=m)
        for j in range(1, stop=n)
            if img[i,j] < quality
                img[i,j] = 0
    
            end
        end
    end
     return img;
end

