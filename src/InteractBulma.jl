module InteractBulma

using InteractNative
import InteractNative: choosefile, autocomplete, input, dropdown, checkbox, textbox, button, slider, set_libraries, observe
import InteractNative: NativeHTML

struct Bulma<:InteractNative.CSSFramework; end

export choosefile, autocomplete, input, dropdown, checkbox, textbox, button, slider, observe

InteractNative.set_backend(
    Bulma(),
    [
        "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css",
        "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-slider/dist/bulma-slider.min.css",
        "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-switch/dist/bulma-switch.min.css"
    ]
)

include("widgets.jl")

end # module
