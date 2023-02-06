@testset "find_points" begin

    # Test there is exactly 49 corner points for a 8 x 8 generated checkerboard
    img = Gray{Float64}.(load("data/checkerboard2.png"))
    output = find_points(img,0.2,10)
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48

    # Test there is exactly 49 corner points for a 8 x 8 generated checkerboard
    img = Gray{Float64}.(load("data/checkerboard2.png"))
    output = find_points(img,0.3,10)
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48


    img = Gray{Float64}.(load("data/checkerboard_example.jpg"))
    output = find_points(img,0.48,10)
    count = 0;
    for i in CartesianIndices(output)
        if output[i] > 0
            count += 1
        end
    end
    @test count == 48
end