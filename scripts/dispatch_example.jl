
function foo(matrix::AbstractMatrix)
    @show "I've called foo Abstract."
end

function foo(matrix::Matrix{Float64})
    @show "I've called foo MatrixFloat64."
end
