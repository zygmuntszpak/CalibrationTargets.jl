function find_points(img::AbstractArray, quality::Number, min_dist::Int)
    detected_points = detect_points(img,quality,min_dist)

    kernelfunc = KernelFactors.scharr
    Gy, Gx = imgradients(img,kernelfunc, "replicate");
    mag = sqrt.(Gy.^2 + Gx.^2)

    conrner_candiates = Vector{CartesianIndex{2}}()
    map = Dict{CartesianIndex{2}, Int64}()

    # Store candidates
    for i in CartesianIndices(detected_points)
        if detected_points[i] > 0.0
            push!(map, i => 0)
            push!(conrner_candiates, i)
        end
    end

    seam_carving_down!(mag, conrner_candiates, map)
    seam_carving_up!(mag, conrner_candiates, map)   
    final_points = remove_after_carve(map)
    differences = setdiff(conrner_candiates, final_points)


    for point in differences
        x = point[1]
        y = point[2]
        detected_points[x,y] = 0
    end
    return detected_points
end
