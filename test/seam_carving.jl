@testset "seam_carving.jl" begin

    A = [1 2 3 4 5 6;
    3 4 1 1 1 1;
    1 5 6 3 3 3;
    5 6 8 4 3 2;
    7 6 8 9 6 5]

    seam_carving!(A)

    @test  A == [10 2 3 4 5 6;
                3 10 1 1 1 1;
                1 5 10 3 3 3;
                5 6 10 4 3 2;
                7 6 8 10 6 5]
end