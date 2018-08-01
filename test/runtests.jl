using InteractBulma, Observables, Colors, DataStructures
import Widgets: scope
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@testset "options" begin
    a = dropdown(["a", "b", "c"])
    @test observe(a)[] == "a"
    a = dropdown(OrderedDict("a" => 1, "b" => 2, "c" => 3))
    @test observe(a)[] == 1
    a = dropdown(OrderedDict("a" => 1, "b" => 2, "c" => 3), value = 3)
    @test observe(a)[] == 3
end

@testset "ijulia" begin
    @test !InteractBase.isijulia()
end
