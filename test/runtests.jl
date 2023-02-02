using CalibrationTargets
using Test

@testset "CalibrationTargets.jl" begin
    include("checkerboard.jl")
    include("generatepoints.jl")
    include("checkerboard_points.jl")
    include("seam_carving.jl")
end
