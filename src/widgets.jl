choosefile(::Bulma, args...; class="", kwargs...) =
    choosefile(NativeHTML(), args...; class="input $class", kwargs...)

autocomplete(::Bulma, args...; class="", kwargs...) = autocomplete(NativeHTML(), args...; class="input $class", kwargs...)

dropdown(::Bulma, args...; class="", kwargs...) =
    dropdown(NativeHTML(), args...; postprocess = dom"div.select", class="input $class", kwargs...)

checkbox(::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="is-checkradio $class", kwargs...)

toggle(s::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="switch $class", kwargs...)

textbox(::Bulma, label=""; value="", class="", kwargs...) =
    input(NativeHTML(), value; typ="text", class="input $class", placeholder=label, kwargs...)

function slider(::Bulma, args...; class="is-fullwidth", kwargs...)
    slider(NativeHTML(), args...; class="slider $class", kwargs...)
end

button(::Bulma, args...; class= "is-primary", kwargs...) =
    button(NativeHTML(), args...; class="button $class", kwargs...)
