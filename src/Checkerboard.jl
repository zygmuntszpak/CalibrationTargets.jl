function checkerboard(i,j)
    a = zeros(Int,i,j);

    for i in range(1,stop=i);
        #odd rows
        if mod(i,2) != 0
            for j in range(1,stop=j)
                if mod(j,2) != 0
                    a[i,j] = 1;
                end 
            end
        else 
            for j in range(1,stop=j)
                if mod(j,2) == 0
                    a[i,j] = 1;
                end
            end
        end
    end
    guidict = imshow(a)
end


checkerboard(8,8)