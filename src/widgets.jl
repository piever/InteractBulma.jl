function filepicker(::Bulma, lbl = "Choose a file..."; label=lbl, class="", kwargs...)
    fp = filepicker(NativeHTML(), label; class="interactbulma file-input $class", kwargs...)
    scope(fp).dom =
        dom"div.file"(
            dom"label.file-label"(
                scope(fp).dom,
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
    isdefined(InteractBase, :wrapfield) ? InteractBase.wrapfield(fp) : fp
end

function radio(T::Bulma, s, key, val, vmodel; class = "", kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $class", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
