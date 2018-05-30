# InteractBulma

[![Build Status](https://travis-ci.org/piever/InteractBulma.jl.svg?branch=master)](https://travis-ci.org/piever/InteractBulma.jl)
[![codecov.io](http://codecov.io/github/piever/InteractBulma.jl/coverage.svg?branch=master)](http://codecov.io/github/piever/InteractBulma.jl?branch=master)

Package to create simple web apps in Julia based on [InteractBase](https://github.com/piever/InteractBase.jl/). To install the package and its dependencies simply run the following code in the REPL:

```julia
Pkg.clone("https://github.com/piever/InteractBulma.jl")
Pkg.build("InteractBulma")
```

To learn how to use this package, check out the [InteractBase documentation](https://piever.github.io/InteractBase.jl/latest/).

Simply type `using InteractBulma` instead of `using InteractBase` and the same commands of InteractBase will work and the GUI will be styled with [Bulma](https://bulma.io/) css.
