__precompile__()

module InteractBulma

using Reexport
using WebIO
@reexport using InteractBase

import InteractBase: dropdown

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

const custom_css = isdefined(InteractBase, :style_css) ? InteractBase.style_css :
                                                         joinpath(@__DIR__, "..", "assets", "custom.css")
const main_css = joinpath(@__DIR__, "..", "assets", "main.css")
const bulma_min_css = joinpath(@__DIR__, "..", "assets", "bulma.min.css")
const bulma_slider_min_css = joinpath(@__DIR__, "..", "assets", "bulma-slider.min.css")
const bulma_switch_min_css = joinpath(@__DIR__, "..", "assets", "bulma-switch.min.css")
const bulma_accordion_min_css = joinpath(@__DIR__, "..", "assets", "bulma-accordion.min.css")
const bulma_checkradio_min_css = joinpath(@__DIR__, "..", "assets", "bulma-checkradio.min.css")
const bulma_tooltip_min_css = joinpath(@__DIR__, "..", "assets", "bulma-tooltip.min.css")
const font_awesome = InteractBase.font_awesome

function InteractBase.libraries(::Bulma)
    bulmalibs = InteractBase.isijulia() ?
        [main_css, custom_css] :
        [
            custom_css,
            bulma_min_css,
            bulma_slider_min_css,
            bulma_switch_min_css,
            bulma_accordion_min_css,
            bulma_checkradio_min_css,
            bulma_tooltip_min_css,
        ]
    vcat(font_awesome, bulmalibs)
end

function __init__()
    InteractBase.settheme!(Bulma())
    nothing
end

include("widgets.jl")

end # module
