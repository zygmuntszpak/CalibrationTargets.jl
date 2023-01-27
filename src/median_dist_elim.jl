function median_dist_elim(points::Vector{CartesianIndex{2}}, forgiveness::Float64)
    distances = []
    # Store the distances between points
    for point in points
        x₁, y₁ = point.I
        current_distances = [] # Store Distances between current point and other points
        for point2 in points
            if point != point2 
                x₂, y₂ = point2.I
                d = norm([x₁, y₁] - [x₂, y₂])    
                # Add Distances into array for this point
                push!(current_distances, d)
            end
        end
        # Get the closest two points for every point (i choose this as corners only have two neighbours apart of checkerboard)
        sort!(current_distances)
        push!(distances, current_distances[1], current_distances[2])
    end

    median_dist = median(distances) # Median of all distances of points (Assuming this is a distance between two correct points)
    threshold = forgiveness * median_dist
    remaining_points = [] # Only store points which are 'close' to median value

    # Get Distance between point and all other points
    for point in points
        x₁, y₁ = point.I
        current_distances = []
        for point2 in points
            if point != point2
                x₂, y₂ = point2.I
                d = norm([x₁, y₁] - [x₂, y₂])
                push!(current_distances, d)
            end
        end
        # Get the distance too closest point
        min_dist = minimum(current_distances)

        # Only keep points who's closest point is in the distance threshold
        if abs(min_dist - median_dist) < threshold
            push!(remaining_points, point)
        end
    end

    return remaining_points
end