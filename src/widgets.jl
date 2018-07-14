function dropdown(::Bulma, options::Observable; multiple = false, className = "", kwargs...)
    className = InteractBase.mergeclasses(className, multiple ? "select is-multiple" : "select")
    div_select = Node(:div, className=className)
    dropdown(NativeHTML(), options; multiple = multiple, div_select = div_select, kwargs...)
end
