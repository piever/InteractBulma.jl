wrap(::Bulma, ui, f = dom"div.field.interactbulma") = wrap(NativeHTML(), ui, f)
wrapclass(ui) = wrap(ui, dom"div.interactbulma")

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
    filepicker(NativeHTML(), args...; postprocess = postprocess, class="interactbulma file-input $class", kwargs...) |> wrap
end

function dropdown(T::Bulma, options::Associative; label = nothing, class="", outer = dom"div.interactbulma"∘vbox, kwargs...)
    s = dropdown(NativeHTML(), options; label = nothing, postprocess = dom"div.select", class="interactbulma input $class", kwargs...)
    label == nothing && return wrap(s)
    wrap(s, t->dom"div.interactbulma"(dom"div.field"(s), wdglabel(T, label)))
end

checkbox(::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="interactbulma is-checkradio $class", kwargs...) |> wrap

toggle(s::Bulma, args...; class="", kwargs...) =
    checkbox(NativeHTML(), args...; class="interactbulma switch $class", kwargs...) |> wrap

textbox(::Bulma, label=""; value="", class="", kwargs...) =
    input(NativeHTML(), value; typ="text", class="interactbulma input $class", placeholder=label, kwargs...) |> wrap

function slider(::Bulma, args...; label=nothing, showvalue=true, class="is-fullwidth", kwargs...)
    s = gensym()
    postprocess = function (t)
        (label == nothing) && !showvalue && return t
        dom"div.columns.interactbulma.is-mobile[style=align-items:center;]"(
            dom"div.column.interactbulma[style=text-align:right;]"(dom"div"(label)),
            dom"div.column.interactbulma.is-8"(t),
            dom"div.column.interactbulma"(
                showvalue ? dom"div"("{{value}}") : dom"div"()
            )
        )
    end
    slider(NativeHTML(), args...;
        class="interactbulma slider $class", id = s, postprocess = postprocess, kwargs...) |> wrap
end

button(::Bulma, args...; class= "is-primary", kwargs...) =
    button(NativeHTML(), args...; class="interactbulma button $class", kwargs...) |> wrap

input(::Bulma, args...; class="", kwargs...) =
    input(NativeHTML(), args...; class="interactbulma input $class", kwargs...) |> wrap

function togglebuttons(::Bulma, options::Associative;
    label=nothing, class="is-fullwidth", outer = identity, outer_attributes = Dict(), activeclass = "is-primary is-selected", kwargs...)

    postprocess = function (t)
        label == nothing && return t
        dom"div.columns.interactbulma.is-mobile[style=align-items:center;]"(
            dom"div.column.interactbulma[style=text-align:right;]"(dom"div"(label)),
            dom"div.column.interactbulma.is-8"(t),
            dom"div.column.interactbulma"(dom"div"())
        )
    end

    togglebuttons(NativeHTML(), options;
        outer = postprocess∘outer∘Node(
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
    radiobuttons(NativeHTML(), options::Associative; radiotype = T, outer = outerfunction, kwargs...) |> wrap
end


function radio(T::Bulma, s, key, val, vmodel; class = "", kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $class", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
