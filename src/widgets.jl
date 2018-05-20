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

togglebuttons(::Bulma, options::Associative; class="is-fullwidth", outer = identity, outer_attributes = Dict(), activeclass = "is-primary is-selected", kwargs...) =
    togglebuttons(NativeHTML(), options;
        outer = outer∘Node(:div, className = "field is-grouped has-addons is-oneline is-centered", attributes = outer_attributes),
        class = "button $class", activeclass = activeclass, tag = :span, kwargs...)

tabs(::Bulma, options::Associative; class="", outer = identity, outer_attributes = Dict(), activeclass = "is-active", kwargs...) =
    tabs(NativeHTML(), options;
        outer = outer∘Node(:ul, className = "tabs", attributes = outer_attributes),
        class = class, activeclass = activeclass, kwargs...)


function radiobuttons(T::Bulma, options::Associative; outer = identity, outer_attributes = Dict(), kwargs...)
    outerfunction = function (args...)
        outer(Node(:div, className = "field", attributes = outer_attributes))(Iterators.flatten(args)...)
    end
    InteractBase._radiobuttons(T, options::Associative; outer = outerfunction, kwargs...) |> wrap
end


function radio(T::Bulma, s, key, val, vmodel; class = "", kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $class", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
