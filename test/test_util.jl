import JuliaDB: tuplesetindex

@testset "Utilities" begin

    @testset "NamedTuples isless" begin
        @test @NT(x=1, y=2) <  @NT(x=1, y=2.5)
        @test @NT(x=1, y=2) >= @NT(x=1, y=2)
        @test @NT(x=1, y=2) <  @NT(x=1, y=2, z=3)
    end

    @testset "tuplesetindex" begin
        @test tuplesetindex((1,2,3), 4, 2) == (1,4,3)
        @test tuplesetindex(@NT(x=1,y=2,z=3), 4, 2) == @NT(x=1,y=4,z=3)
        @test tuplesetindex(@NT(x=1,y=2,z=3), 4, :y) == @NT(x=1,y=4,z=3)
    end
end

import JuliaDB: Interval, hasoverlap

@testset "Interval" begin

    @testset "hasoverlap" begin
        @test hasoverlap(Interval(0,2), Interval(1,2))
        @test !(hasoverlap(Interval(2,1), Interval(1,2)))
        @test hasoverlap(Interval(0,2), Interval(0,2))
        @test hasoverlap(Interval(0,2), Interval(-1,2))
        @test hasoverlap(Interval(0,2), Interval(2,3))
        @test !hasoverlap(Interval(0,2), Interval(4,5))
    end

    @testset "in" begin
        @test 1 in Interval(0, 2)
        @test !(1 in Interval(2, 1))
        @test !(3 in Interval(0, 2))
        @test !(-1 in Interval(0, 2))
    end

end
