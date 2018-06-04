__precompile__()

module InteractBulma

using Reexport
@reexport using InteractBase
using WebIO, Vue, DataStructures, CSSUtil
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
    entry,
    NativeHTML,
    scope,
    getclass

import InteractBase: textarea

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

function InteractBase.libraries(::Bulma)
    bulmalibs = InteractBase.isijulia() ?
        ["/pkg/InteractBulma/main.css"] :
        [
            "/pkg/InteractBulma/bulma.min.css",
            "/pkg/InteractBulma/bulma-slider.min.css",
            "/pkg/InteractBulma/bulma-switch.min.css",
            "/pkg/InteractBulma/bulma-checkradio.min.css",
        ]
    vcat("/pkg/InteractBulma/all.js", bulmalibs)
end

function __init__()
    InteractBase.settheme!(Bulma())
    nothing
end

function InteractBase.manipulateoutercontainer(::Bulma, args...)
    Node(:div,
        args...,
        className = "interactbulma"
    )
end

include("classes.jl")
include("widgets.jl")

end # module
