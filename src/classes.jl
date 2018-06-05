function getclass(T::Bulma, arg, typ...)
    length(typ) > 0 && last(typ) == "label" && return ""
    if arg == :input
        typ==() && return "interactbulma input"
        typ[1]=="checkbox" && return "interactbulma is-checkradio"
        typ[1]=="toggle" && return "interactbulma switch"
        typ==("range",) && return "interactbulma slider"
        typ==("range", "fullwidth") && return "interactbulma slider is-fullwidth"

        if typ[1]=="file"
            typ[2:end]==() && return "file"
            typ[2:end]==("span",) && return "file-cta"
            typ[2:end]==("span", "icon") && return "file-icon"
            typ[2:end]==("span","label") && return "file-label"
            typ[2:end]==("icon",) && return "fas fa-upload"
            typ[2:end]==("label",) && return "file-label"
            typ[2:end]==("name",) && return "file-name"
        end
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
