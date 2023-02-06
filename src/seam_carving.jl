function seam_carving_down!(A::AbstractArray, i::Int64, j::Int64)

    global curr = [i,j]
    row, col = size(A)

    while (curr[1] <= row)
        x, y = curr[1], curr[2]
        A[x,y] = 1
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

function seam_carving_up!(A::AbstractArray, i::Int64, j::Int64)

    global curr = [i,j]
    row, col = size(A)

    while (curr[1] >= 1)
        x, y = curr[1], curr[2]
        A[x,y] = 1
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