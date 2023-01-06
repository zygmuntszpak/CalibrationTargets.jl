@testset "Detect_Points" begin

    # Test there is exactly 49 corner points for a 8 x 8 generated checkerboard
    img = checkerboard(8,8)
    out = detect_points(img, 0.4, 10)
    count = 0;
    for i in CartesianIndices(out)
        if out[i] > 0
            count += 1
        end
    end
    @test count == 49

end