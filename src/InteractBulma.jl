module InteractBulma

using Reexport
@reexport using InteractBase
using WebIO, Vue, DataStructures
import InteractBase:
    filepicker,
    autocomplete,
    input, dropdown,
    checkbox,
    toggle,
    textbox,
    button,
    slider,
    togglebuttons,
    tabs,
    radiobuttons,
    radio,
    wrap,
    wdglabel,
    NativeHTML

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

function InteractBase.libraries(::Bulma)
    bulmalibs = isfile(joinpath(dirname(@__DIR__), "assets", "main.css")) ?
        ["/pkg/InteractBulma/main.css"] :
        [
            "/pkg/InteractBulma/bulma.min.css",
            "/pkg/InteractBulma/bulma-slider.min.css",
            "/pkg/InteractBulma/bulma-switch.min.css",
            "/pkg/InteractBulma/bulma-checkradio.min.css",
        ]
    vcat("/pkg/InteractBulma/all.js", bulmalibs)
end

InteractBase.settheme!(Bulma())

include("widgets.jl")

end # module
