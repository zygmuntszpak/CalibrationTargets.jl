function checkerboard_points(img::AbstractArray, quality::Number, min_dist::Int, forgiveness::Float64 )
    detected_points = detect_points(img, quality, min_dist, )

    conrner_candiates = Vector{CartesianIndex{2}}()
    
    # Store candidates
    for i in CartesianIndices(detected_points)
        if detected_points[i] > 0.0
            push!(conrner_candiates, i)
        end
    end
    
    
    points = median_dist_elim(conrner_candiates, forgiveness)
    @show size(points)
    differences = setdiff(conrner_candiates, points)
    
    for point in differences
        x = point[1]
        y = point[2]
        detected_points[x,y] = 0
    end
    return detected_points
end