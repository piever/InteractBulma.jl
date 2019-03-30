module InteractBulma

import InteractBase, Sass

struct BulmaTheme<:InteractBase.WidgetTheme
    path::String
end

const examplefolder = joinpath(@__DIR__, "..", "examples")
const main_css = joinpath(@__DIR__, "..", "assets", "main.min.css")
const main_confined_css = joinpath(@__DIR__, "..", "assets", "main_confined.min.css")
const font_awesome = InteractBase.font_awesome

function InteractBase.libraries(b::BulmaTheme)
    bulmalib = joinpath(b.path, InteractBase.isijulia() ? "main_confined.css" : "main.css")
    vcat(font_awesome, InteractBase.style_css, bulmalib)
end

const main_scss = joinpath(@__DIR__, "..", "assets", "main.scss")
const main_confined_scss = joinpath(@__DIR__, "..", "assets", "main_confined.scss")
const _overrides_scss = joinpath(@__DIR__, "..", "assets", "_overrides.scss")
const _variables_scss = joinpath(@__DIR__, "..", "assets", "_variables.scss")

function clean_or_copy(src, dest)
    src === nothing ? open(io -> nothing, dest, "w") : cp(realpath(abspath(src)), dest, force = true)
end

function compile_theme(output = mktempdir(); overrides = nothing, variables = nothing)
    clean_or_copy(overrides, _overrides_scss)
    clean_or_copy(variables, _variables_scss)
    Sass.compile_file(main_scss, joinpath(output, "main.css"), output_style = Sass.compressed)
    Sass.compile_file(main_confined_scss, joinpath(output, "main_confined.css"), output_style = Sass.compressed)
    return BulmaTheme(output)
end

end # module
