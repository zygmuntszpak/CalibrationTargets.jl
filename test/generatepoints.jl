@testset "GeneratePoints" begin
    # Check First Point Is Correct
    points = generatepoints(8,8,10)
    @test points[1,1] == 10

end