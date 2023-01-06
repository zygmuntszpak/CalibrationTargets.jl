using CalibrationTargets
using Test

@testset "CalibrationTargets.jl" begin
    include("checkerboard.jl")
    include("generatepoints.jl")
    include("detect_points.jl")
end
