using InteractBulma, Observables, Colors, DataStructures
import Widgets: scope
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@testset "ijulia" begin
    @test !InteractBase.isijulia()
end

@testset "deps" begin
    libs = InteractBase.libraries(Bulma())
    @test all(isfile, libs)
end
