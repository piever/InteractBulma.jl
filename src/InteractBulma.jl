module InteractBulma

using Reexport
@reexport using InteractNative
using WebIO, Vue
import InteractNative: choosefile, autocomplete, input, dropdown, checkbox, toggle, textbox, button, slider, setlibraries
import InteractNative: NativeHTML

export Bulma

struct Bulma<:InteractNative.CSSFramework; end

InteractNative.libraries(::Bulma) = [
        "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css",
        "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-slider/dist/bulma-slider.min.css",
        "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-switch/dist/bulma-switch.min.css",
        "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-checkradio/dist/bulma-checkradio.min.css",
        "https://use.fontawesome.com/releases/v5.0.7/js/all.js"
    ]

InteractNative.setbackend(Bulma())

include("widgets.jl")

end # module
