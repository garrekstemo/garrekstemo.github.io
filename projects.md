---
layout: default
title: Research
permalink: /projects/
---

## Projects

### [TransferMatrix.jl](https://garrek.org/TransferMatrix.jl)

A general 4 &times; 4 transfer matrix implementation for Julia built for reusability, ease-of-use, shareability based on up-to-date research on the topic with full documentation and extensive tutorials.

### [Models.jl](https://garrek.org/Models.jl)

A collection of mathematical models for curve fitting to be used with [Optim.jl](https://julianlsolvers.github.io/Optim.jl/stable/). Most of the models are lineshapes that I use in infrared spectroscopy. One thing I really miss from Python is the excellent non-linear least-squares minimization package [lmfit](https://lmfit.github.io/lmfit-py/), especially the way they integrate models. Models.jl is not even close to the functionality of lmfit, but works pretty well with the Optim.jl minimizer.

### Other Projects

Check out my [GitHub](https://github.com/garrekstemo) page for other projects I'm working on.

I also want to give a shout-out to [Makie.jl](https://docs.makie.org/stable/). This is the workhorse of my research and the best plotting software I've *ever* used. The plots that it generates look good out of the box, and its GPU-powered and interactive features let me do modeling and data exploration easily. I try to push the boundaries of the interactive features of Makie and occasionally post about any rough edges and any cool things that I find on the [Julia Discourse](https://discourse.julialang.org).