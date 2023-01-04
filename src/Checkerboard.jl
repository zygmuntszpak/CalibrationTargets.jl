function checkerboard(nrow::Int, ncol::Int; square_size::Int = 50)
    a = zeros(Int, nrow, ncol)

    for i in range(1, stop=nrow)
        if mod(i,2) != 0
            for j in range(1,stop=ncol)
                if mod(j,2) == 0
                    a[i,j] = 1
                end 
            end
        else 
            for j in range(1,stop=ncol)
                if mod(j,2) != 0
                    a[i,j] = 1
                end
            end
        end
    end

    return Gray.(repeat(a, inner = (square_size, square_size)))
end


