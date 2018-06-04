function getclass(T::Bulma, arg, typ...)
    length(typ) > 0 && last(typ) == "label" && return ""
    if arg == :input
        typ==("checkbox",) && return "interactbulma is-checkradio"
        typ==("toggle",) && return "interactbulma switch"
        typ==("range",) && return "interactbulma slider"
        return "interactbulma input"
    elseif arg == :dropdown
        return "interactbulma input"
    elseif arg == :button
        typ==("primary",) && return "is-primary"
        typ==("active",) && return "is-primary is-selected"
        typ==("fullwidth",) && return "is-fullwidth"
        return "interactbulma button"
    elseif arg==:tab
        typ==("active",) && return "is-active"
        return ""
    elseif arg == :textarea
        return "interactbulma textarea"
    elseif arg==:wdglabel
        return "interactbulma"
    elseif arg==:div
        return "interactbulma field"
    elseif arg==:togglebuttons
        return "interactbulma field is-grouped has-addons is-oneline is-centered"
    elseif arg==:tabs
        return "interactbulma tabs"
    elseif arg==:radiobuttons
        return "interactbulma field"
    else
        return "interactbulma"
    end
end
