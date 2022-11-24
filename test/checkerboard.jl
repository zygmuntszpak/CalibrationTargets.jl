@testset "Checkerboard" begin
    # Check square_size produces correct size of image with an input
    img = checkerboard(10,10 ; square_size = 1)
    @test size(img) == (10,10)

    # Check square_size produces correct size of image without an input
    img = checkerboard(10,10)
    @test size(img) == (500,500)

    # Check that we alternate black and white vertically
    img = checkerboard(10,10 ; square_size = 1)
    @test img[1,1] != img[2,1]

    # Check that we alternate black and white horizontally
    img = checkerboard(10,10 ; square_size = 1)
    @test img[1,1] != img[1,2]

end