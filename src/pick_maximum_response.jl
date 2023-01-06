function pick_maximum_response(responses)
    nrow, ncol, ndepth = size(responses)
    maximum_response = zeros(nrow, ncol)
    for r = 1:nrow
        for c = 1:ncol
            maximum_response[r,c] = maximum(responses[r,c,:]) 
        end
    end
    return maximum_response 
end
