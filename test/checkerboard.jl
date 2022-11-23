@testset "Checkerboard" begin
    # Write you checkerboard test
    img = checkerboard(10,10 ; square_size = 1)
    @test size(img) == (10,10)

    # Check that we alternate black and white
end