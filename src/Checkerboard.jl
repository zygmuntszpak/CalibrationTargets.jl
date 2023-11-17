function checkerboard(nrow::Int, ncol::Int; square_size::Int = 50)
    board = zeros(Int, nrow, ncol)
    # Construct an nrow x ncol checkerboard where each square is a single pixel
    for i in range(1, stop=nrow)
        if mod(i,2) != 0
            for j in range(1,stop=ncol)
                if mod(j,2) == 0
                    board[i,j] = 1
                end 
            end
        else 
            for j in range(1,stop=ncol)
                if mod(j,2) != 0
                    board[i,j] = 1
                end
            end
        end
    end
    # Expand each pixel to square_size x square_size
    return Gray.(repeat(board, inner = (square_size, square_size)))
end


