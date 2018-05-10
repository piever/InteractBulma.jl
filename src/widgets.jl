choosefile(::Bulma, args...; class="input", kwargs...) = choosefile(NativeHTML(), args...; class=class, kwargs...)

autocomplete(::Bulma, args...; class="input", kwargs...) = autocomplete(NativeHTML(), args...; class=class, kwargs...)

dropdown(::Bulma, args...; class="input", kwargs...) = dropdown(NativeHTML(), args...; class=class, kwargs...)

checkbox(::Bulma, args...; class="interact-widget", kwargs...) =
    checkbox(NativeHTML(), args...; class=class, kwargs...)

toggle(s::Bulma = Bulma(), args...; class="switch", kwargs...) =
    checkbox(NativeHTML(), args...; class=class, kwargs...)

textbox(::Bulma, label=""; value="", class="input", kwargs...) =
    input(NativeHTML(), value; typ="text", class=class, placeholder=label, kwargs...)

function slider(::Bulma, args...; class="slider is-fullwidth", kwargs...)
    slider(NativeHTML(), args...; class=class, kwargs...)
end
