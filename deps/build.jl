const _pkg_root = dirname(dirname(@__FILE__))
const _pkg_deps = joinpath(_pkg_root,"deps")
const _pkg_assets = joinpath(_pkg_root,"assets")

!isdir(_pkg_assets) && mkdir(_pkg_assets)

deps = [
    "https://raw.githubusercontent.com/piever/BulmaThemes/master/public/styles/main.css",
    "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css",
    "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-slider/dist/bulma-slider.min.css",
    "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-switch/dist/bulma-switch.min.css",
    "https://cdn.jsdelivr.net/npm/bulma-extensions@1.0.14/bulma-checkradio/dist/bulma-checkradio.min.css",
]
for dep in deps
    download(dep, joinpath(_pkg_assets, splitdir(dep)[2]))
end
