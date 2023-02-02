A = [1 2 3 4 5 6;
    3 4 1 1 1 1;
    1 5 6 3 3 3;
    5 6 8 4 3 2;
    7 6 8 9 6 5]

global curr = [1,1]

while (curr[1] <= 5)
    x, y = curr[1], curr[2]
    A[x,y] = 10
    if x + 1 == 6 
        break
    end
    max_next = -Inf
    if y - 1 > 0 
        if A[x+1,y-1] > max_next
            max_next = A[x+1,y-1]    
            curr = [x+1,y-1]
        end
    end
    if y + 1 < 6 
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
