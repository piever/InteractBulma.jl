wrap(::Bulma, ui, f = dom"div.field.interactbulma") = wrap(NativeHTML(), ui, f)
wrapclass(ui) = wrap(ui, dom"div.interactbulma")

function filepicker(::Bulma, label = "Choose a file..."; class="", kwargs...)
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
    filepicker(NativeHTML(), label; postprocess = postprocess, class="interactbulma file-input $class", kwargs...) |> wrap
end

function dropdown(T::Bulma, options::Associative; label = nothing, class="", outer = dom"div.interactbulma"∘vbox, kwargs...)
    s = dropdown(NativeHTML(), options; label = nothing, postprocess = dom"div.select", class="interactbulma input $class", kwargs...)
    label == nothing && return wrap(s)
    wrap(s, t->dom"div.interactbulma"(s, wdglabel(T, label)))
end

checkbox(::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="interactbulma is-checkradio $class", kwargs...)

toggle(s::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="interactbulma switch $class", kwargs...) |> wrap

function entry(::Bulma, style, args...; class="", kwargs...)
    extraclass = (style=="toggle") ? "switch" : "is-checkradio"
    entry(NativeHTML(), style, args...; class="interactbulma $extraclass $class", outer=dom"div.field.interactbulma", kwargs...)
end

function slider(::Bulma, vals::Range; class="is-fullwidth", kwargs...)
    slider(NativeHTML(), vals;
        class="interactbulma slider $class", kwargs...) |> wrapclass
end

button(::Bulma, args...; class= "is-primary", kwargs...) =
    button(NativeHTML(), args...; class="interactbulma button $class", kwargs...) |> wrap

input(::Bulma, args...; class="", kwargs...) =
    input(NativeHTML(), args...; class="interactbulma input $class", kwargs...) |> wrap

function togglebuttons(::Bulma, options::Associative;
    class="is-fullwidth", outer = identity, outer_attributes = Dict(), activeclass = "is-primary is-selected", kwargs...)

    togglebuttons(NativeHTML(), options;
        outer = outer∘Node(
            :div, className = "interactbulma field is-grouped has-addons is-oneline is-centered", attributes = outer_attributes
        ), class = "button $class", activeclass = activeclass, tag = :span, kwargs...) |> wrapclass
end

tabs(::Bulma, options::Associative; class="", outer = identity, outer_attributes = Dict(), activeclass = "is-active", kwargs...) =
    tabs(NativeHTML(), options;
        outer = outer∘Node(:ul, className = "interactbulma tabs", attributes = outer_attributes),
        class = class, activeclass = activeclass, kwargs...) |> wrapclass


function radiobuttons(T::Bulma, options::Associative; outer = identity, outer_attributes = Dict(), kwargs...)
    outerfunction = function (args...)
        outer(Node(:div, className = "field", attributes = outer_attributes))(Iterators.flatten(args)...)
    end
    radiobuttons(NativeHTML(), options::Associative; outer = outerfunction, kwargs...) |> wrap
end


function radio(T::Bulma, s, key, val, vmodel; class = "", kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $class", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
