@testset "Checkerboard" begin
    # Check square_size is assigned correctly 
    img = checkerboard(1,1; square_size =1000)
    @test size(img) == (1000,1000)
    
    # Check square_size produces correct size of image with an input
    img = checkerboard(10,10 ; square_size = 1)
    @test size(img) == (10,10)

    # Check square_size produces correct size of image without an input (deafult square_size == 50)
    img = checkerboard(10,10)
    @test size(img) == (500,500)

    # Check that we alternate black and white vertically
    img = checkerboard(10,10 ; square_size = 1)
    @test img[1,1] != img[2,1]

    # Check that we alternate black and white horizontally
    img = checkerboard(10,10 ; square_size = 1)
    @test img[1,1] != img[1,2]

    # Check every second square is assigned white (deafult square_size = 50)
    img = checkerboard(2,6)
    @test img[1,1] == img[1,(3*50)] == img[1,(5*50)] == img[(2*50),(2*50)] == img[(2*50),(4*50)] == img[(2*50),(6*50)] == 1

    # Check every second square is assigned black
    img = checkerboard(2,6)
    @test img[1,(2*50)] == img[1,(4*50)] == img[1,(6*50)] == img[(2*50),(1*50)] == img[(2*50),(3*50)] == img[(2*50),(5*50)] == 0
end