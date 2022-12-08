@testset "createblur" begin
    
    img = checkerboard(8,8);
    blured_img = createblur(img, pi/4)
    @test size(img) == size(blured_img);
end 