@testset "GeneratePoints" begin
    # Check Size of Output Array is Correct (x)
    points = generatepoints(8,8,10)
    n = 8;
    @test (n-1)*(n-1) == size(points,1)
   
    # Check Size of Output Array is Correct (y)
    points = generatepoints(8,8,10)
    n = 8;
    @test 2 == size(points,2)
    
    # Check First Point Is Correct
    points = generatepoints(8,8,10)
    @test points[1,1] == (1-1)*10

    # Check Column Increments Correctly 
    points = generatepoints(8,8,10)
    @test points[2,2] == (2-1)*10

    # Check X Coordinate Is Recorded Correctly For New Row
    points = generatepoints(8,8,10)
    @test points[8,1] == (2-1)*10

    # Check Y Coordinate Is Recorded Correctly For New Row
    points = generatepoints(8,8,10)
    @test points[8,2] == 0

    # Check Size of Square is Accounted correctly for
    points = generatepoints(8,8,5)
    square_size = 5
    @test points[6,2] == square_size*(6-1)
end