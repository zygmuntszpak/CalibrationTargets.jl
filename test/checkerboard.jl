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

    # Check alternating every square (deafult square size is 50)
    checker = checkerboard(8,8)
    for i = range(1, stop=8)
        for j in range(1,stop=7)
            @test checker[i,j*50] != checker[i,j*50+1]
        end
    end

    
end