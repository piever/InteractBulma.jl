module InteractBulma

import InteractBase

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

const main_css = joinpath(@__DIR__, "..", "assets", "main.min.css")
const main_interactbulma_css = joinpath(@__DIR__, "..", "assets", "main_interactbulma.min.css")
const font_awesome = InteractBase.font_awesome

function InteractBase.libraries(::Bulma)
    bulmalib = InteractBase.isijulia() ? main_interactbulma_css : main_css
    vcat(font_awesome, InteractBase.style_css, bulmalib)
end

end # module
