function seam_carving_down!(A::AbstractArray, points::Vector{CartesianIndex{2}}, map::Dict{CartesianIndex{2}, Int64})


    row, col = size(A)

    for point in points
        x₁, y₁ = point.I
        curr = [x₁, y₁]
        while (curr[1] <= row)
            x, y = curr[1], curr[2]
            A[x,y] = 1
            for diff in -10:10
                if haskey(map,  CartesianIndex(x,y + diff))
                    map[CartesianIndex(x, y + diff)] += 1
                    break
                end
            end

            if x + 1 > row 
                break
            end
            max_next = -Inf
            if y - 1 > 0 
                if A[x+1,y-1] > max_next
                    max_next = A[x+1,y-1]    
                    curr = [x+1,y-1]
                end
            end
            if y + 1 <= col
                if A[x+1,y+1] > max_next
                    max_next = A[x+1,y+1]    
                    curr = [x+1,y+1]
                end
            end
            if A[x+1,y] > max_next 
                max_next = A[x+1,y]    
                curr = [x+1,y]
            end
        end
    end
end

function seam_carving_up!(A::AbstractArray, points::Vector{CartesianIndex{2}}, map::Dict{CartesianIndex{2}, Int64})

    row, col = size(A)

    for point in points
        x₁, y₁ = point.I
        curr = [x₁, y₁]
        while (curr[1] >= 1)
            x, y = curr[1], curr[2]
            A[x,y] = 1
            for diff in -10:10
                if haskey(map,  CartesianIndex(x,y + diff))
                    map[CartesianIndex(x, y + diff)] += 1
                    break
                end
            end
            if x - 1 < 1 
                break
            end
            max_next = -Inf
            if y - 1 > 0 
                if A[x-1,y-1] > max_next
                    max_next = A[x-1,y-1]    
                    curr = [x-1,y-1]
                end
            end
            if y + 1 <= col
                if A[x-1,y+1] > max_next
                    max_next = A[x-1,y+1]    
                    curr = [x-1,y+1]
                end
            end
            if A[x-1,y] > max_next 
                max_next = A[x-1,y]    
                curr = [x-1,y]
            end
        end
    end
end