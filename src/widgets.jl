function dropdown(::Bulma, options::Observable; multiple = false, className = "")
    className = InteractBase.mergeclasses(className, multiple ? "select is-multiple" : "select")
    div_select = Node(:div, className=className)
    dropdown(NativeHTML(), options; multiple = multiple, div_select = div_select)
end
