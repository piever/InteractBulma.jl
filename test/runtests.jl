using InteractBulma, InteractBase
using Test

@testset "ijulia" begin
    @test !InteractBase.isijulia()
end

@testset "deps" begin
    libs = InteractBase.libraries(Bulma())
    @test all(isfile, libs)
end
