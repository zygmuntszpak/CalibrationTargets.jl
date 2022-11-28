function generatepoints(nrow::Int, ncol::Int, square_size::Int)
    points = zeros(Int, (nrow-1)*(ncol-1), 2)

    row = 1
    col = 1

    for i in 1:((nrow-1)*(ncol-1))        
        points[i,1] = row*square_size
        points[i,2] = col*square_size
        col = col + 1

        if mod(i,(ncol-1)) == 0 
            row = row + 1
            col = 1
        end
    end
    return points
end

