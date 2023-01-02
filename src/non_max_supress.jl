function non_max_supress(img::AbstractArray)
    m, n = size(img)

    for i in range(1, stop=m)
        for j in range(1, stop=n)
            if img[i,j] < 0.45
                img[i,j] = 0;
            else
                img[i,j] = 1
            end
        end
    end
     return img;
end

