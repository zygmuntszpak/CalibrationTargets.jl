function non_max_supress(img::AbstractArray, quality::Float64, min_dist::Int )      # A further addition could be to state how many "good" corners you wish to remain in the image
    m, n = size(img)                                                        # Also need to ensure that there is valid 0-1 input

    points = [] # THIS IS MAKING ERROR (How to define a 2d array of unkown size with 2 cols)
    counter = 1
    for i in range(1, stop=m)
        for j in range(1, stop=n)
            if img[i,j] < quality
                img[i,j] = 0
            else 
                points[counter,1] = i          # storing the row 
                points[counter,2] = j          # storing the col
                counter += 1
            end
        end
    end

    points_size, cols = size(points)

    for i in range(1, stop=points_size-1)
        for j in range(i+1, stop=points_size)
            x₁ = points[i,1]
            y₁ = points[i,2]

            x₂ = points[j,1]
            y₂ = points[j,2]

            e_dist = (abs2(x₂ - x₁) + abs2(y₂ - y₁))
            
            # if distance is less then specified we know they are close together
            if e_dist < min_dist                    
                a_quality = img[x₁,y₁]
                b_quality = img[x₂,y₂]

            # take larger
                if a_quality > b_quality
                    img[x₂,y₂] = 0
                else 
                    img[x₁,y₁] = 0
                end
            end
        end
    end

    return img
end
    # need to keep track of location of the remaining points [i,j]
    # also need to keep track of the quality 
    # then need to calculate the euclidean distance between points 
    # if euclidean < minimum distance 
        # set lower of two qualitys to 0



# Remove points under threshold

## Define minimum euclidean distance between remaining points
    # euclidean distance between 2 points = ((x₂ - x₁)^2 + (y₂ -y₁)^2)

# if the distance between 2 points is < minimum. Only take the maximum

# this should leave the best points which will be the cirners of the checkerboard.
