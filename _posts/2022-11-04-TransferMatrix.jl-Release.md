---
layout: post
title: "Introducing TransferMatrix.jl"
date: 2022-11-04
---

I'm excited to introduce my first software package written for broad use. [TransferMatrix.jl](https://github.com/garrekstemo/TransferMatrix.jl) is a general 4 x 4 transfer matrix implementation written in the [Julia programming language](https://julialang.org). The [transfer matrix method](https://en.wikipedia.org/wiki/Transfer-matrix_method_(optics)) analyzes the propagation of an electromagnetic wave through a multi-layered medium. You can compute the reflectance and transmittance spectra, as well as calculate the electric field profile as a function of position within the medium.

<figure>
	<img 
	src="/assets/images/posts/TransferMatrix.jl-quarter-wave.png" 
	alt="Reflectance and transmittance of a quarter-wave mirror"/>
    <figcaption>Reflectance and transmittance of a quarter-wave mirror.</figcaption>
</figure>

I started with some simple code in Python for my own projects and sharing it with other in my lab, but it had some limitations and I was growing to love coding in Julia. I didn't want to switch to Python to do just this one thing. I started rewriting the code in Julia on the weekends, but I didn't just want to reimplement what I had done in Python. You see, I've found that there are a lot of transfer matrix implementations on the web. It seems like every grad student doing something in optics or thin films writes one, plops it on the web, and lets it get stale when they graduate. A simple 2 x 2 algorithm is not hard to write but it can't be fully generalized. I was also frustrated that there are all of these papers that try to improve the method (transfer matrices, apparently, are still an active area of research), but the code is difficult to read, poorly documented, untested, used poor programming practices, and abandonded.

<figure>
	<img 
	src="/assets/images/posts/TransferMatrix.jl-electric-field-profile.png" 
	alt="Electric field profile through a quarter-wave mirror"/>
    <figcaption>Electric field profile through a quarter-wave mirror.</figcaption>
</figure>

I wanted to write something based on the latest developments that dealt with the shortfalls of the traditional transfer matrix (singularities and numerical instabilities), while being highly modular, reusable, and with great documentation and tutorials. And I wanted it in Julia to take advantage of Julia's speed and the scientific community over there.

High modularity means that each function is as small as it can be. This makes it easy for someone to replace one or more steps with something custom to test a new idea and improve on the method in their own research. It means that it is easy to test and easy to read the code (in pure Julia).

Julia's package manager makes it easy to install. Everything is [documented](https://garrek.org/TransferMatrix.jl/stable/) and I have written an extensive [tutorial](https://garrek.org/TransferMatrix.jl/stable/guide/tutorial/) &mdash; all of the code in the tutorial can be run as is.

Sharing and reuse is easy. You can make a config file with all of the simulation parameters (even the refractive index data from a file) and reproduce the results for that structure. You can create multiple variations easily this way and share the exact configuration that you used with others. Even complicated periodic structures are easy to make this way.

This implementation is based on the latest research in general transfer matrix methods and every piece of research that I use is cited at the function level, complete with the DOI so that you can follow everything that has been done and make precise modifications. A full [list of references](https://garrek.org/TransferMatrix.jl/stable/bibliography/) is also on the documentation website.

My hope is for this to be at least a first stop for someone looking for a transfer matrix algorithm. If the community likes it, then I would like this to become a part of a standard set of science or physics packages that currently exist in the Julia ecosystem. Ease of use and readability really were my priorities &mdash; there is little boilerplate code. And Julia's speed means you can do wavelength and angle-tuning simulations to produce 2D contour plots quickly. Together with the generality of this implementation based on current research, I hope that others can use TransferMatrix.jl to try out new ideas.

[Try it out](https://github.com/garrekstemo/TransferMatrix.jl) and please leave feedback!