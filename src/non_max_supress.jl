function non_max_supress!(img::AbstractArray, quality::Number, min_dist::Int )
    # Vector to store candidates of corners above threshold
    corner_candidates = Vector{CartesianIndex{2}}()

    # Filter out points under threshold and store candidates
    for i in CartesianIndices(img)
        if img[i] < quality 
            img[i] = zero(eltype(img))
        elseif !isnan(img[i])
            push!(corner_candidates, i)
        end
    end
    
    # # Filtering out points not maximum in its local pixel area
     for i in range(1, stop = length(corner_candidates) - 1)
        for j in range(i + 1, stop = length(corner_candidates))
            p = corner_candidates[i]
            q = corner_candidates[j]        

            # Euclidean distance between two points is compared with the minimum distance required
             e_dist = norm(Tuple(p) .- Tuple(q))
             if e_dist <= min_dist
                 img[p] > img[q] ? img[q] = zero(eltype(img)) : img[p] = zero(eltype(img))
             end
         end
     end
end

