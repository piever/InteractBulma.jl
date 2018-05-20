function wrap(ui, f = dom"div.field")
    wrapped_ui = f(ui)
    InteractBase.primary_obs!(wrapped_ui, observe(ui))
    wrapped_ui
end

function filepicker(::Bulma, args...; class="", label = "Choose a file...", kwargs...)
    postprocess = t ->
    dom"div.file"(
        dom"label.file-label"(
            t,
            dom"span.file-cta"(
                dom"span.file-icon"(
                    dom"i.fas.fa-upload"()
                ),
                dom"span.file-label"(
                    label
                )
            ),
            dom"span.file-name"("{{filename == '' ? 'No file chosen' : filename}}")
        )
    )
    filepicker(NativeHTML(), args...; postprocess = postprocess, class="file-input $class", kwargs...) |> wrap
end

autocomplete(::Bulma, args...; class="", kwargs...) =
    autocomplete(NativeHTML(), args...; class="input $class", kwargs...) |> wrap

dropdown(::Bulma, options::Associative; class="", kwargs...) =
    dropdown(NativeHTML(), options; postprocess = dom"div.select", class="input $class", kwargs...) |> wrap

checkbox(::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="is-checkradio $class", kwargs...) |> wrap

toggle(s::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="switch $class", kwargs...) |> wrap

textbox(::Bulma, label=""; value="", class="", kwargs...) =
    input(NativeHTML(), value; typ="text", class="input $class", placeholder=label, kwargs...) |> wrap

slider(::Bulma, args...; class="is-fullwidth", kwargs...) =
    slider(NativeHTML(), args...; class="slider $class", kwargs...) |> wrap

button(::Bulma, args...; class= "is-primary", kwargs...) =
    button(NativeHTML(), args...; class="button $class", kwargs...) |> wrap

input(::Bulma, args...; class="", kwargs...) =
    input(NativeHTML(), args...; class="input $class", kwargs...) |> wrap
