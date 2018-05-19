module InteractBulma

using Reexport
@reexport using InteractBase
using WebIO, Vue
import InteractBase: filepicker, autocomplete, input, dropdown, checkbox, toggle, textbox, button, slider
import InteractBase: NativeHTML

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

InteractBase.libraries(::Bulma) = [
    "/pkg/InteractBulma/bulma.min.css",
    "/pkg/InteractBulma/bulma-slider.min.css",
    "/pkg/InteractBulma/bulma-switch.min.css",
    "/pkg/InteractBulma/bulma-checkradio.min.css",
    "/pkg/InteractBulma/all.js"
]

InteractBase.settheme!(Bulma())

include("widgets.jl")

end # module
