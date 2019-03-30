module InteractBulma

import InteractBase

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

const main_css = joinpath(@__DIR__, "..", "assets", "main.min.css")
const main_confined_css = joinpath(@__DIR__, "..", "assets", "main_confined.min.css")
const font_awesome = InteractBase.font_awesome

function InteractBase.libraries(::Bulma)
    bulmalib = InteractBase.isijulia() ? main_confined_css : main_css
    vcat(font_awesome, InteractBase.style_css, bulmalib)
end

end # module
