@testset "checkerboard_points.jl" begin

    # Test there is exactly 49 corner points for a 8 x 8 generated checkerboard
    img = Gray{Float64}.(load("data/checkerboard2.png"))
    output = checkerboard_points(img,0.2,10,0.2)
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48

    img = Gray{Float64}.(load("data/checkerboard_example.jpg"))
    output = checkerboard_points(img,0.475,10,0.2)
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48

    img = Gray{Float64}.(load("data/checkerboard1.PNG"))
    output = checkerboard_points(img,0.3,10,0.2)    
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48
end