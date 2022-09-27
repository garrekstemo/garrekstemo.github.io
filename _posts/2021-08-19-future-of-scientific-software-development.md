---
layout: post
title: "The Future of Software Development in Science"
date:   2021-08-19
---

The future of scientific software development will be cloud-based
together with apps that use web technologies rather than
platform-specific (“native”) applications despite recent mobile
computing hardware advances. Advancements in computing tools and
languages are already changing science to, for example, improve
reproducibility of results and facilitate better collaboration. These
same tools are helping to move development itself into the cloud and are
migrating the community to web-based technologies and away from native
apps and frameworks.

Mobile development for the scientific community now means programming on
a laptop since there are very few scientific tools available on tablets
and phones. “Mobile” in the everyday sense refers to, of course,
smartphones and tablets. Eventually, scientific programming will move to
these mobile platforms. I’m thinking of a tablet that can perform
analysis, run a notebook environment, or even run certain kinds of
simulations. You will be able to hook it up to measurement devices[^1] or
controllers. At conferences, you will be able to answer questions by
running your actual simulation live with different variables and show it
to someone. There is a lot of great desktop-class software, proprietary
and open-source, that powers science today. None of this will be a part
of the mobile future. It will all be done in the cloud and with web
technologies.

The discussion around native versus web technology frameworks is already
robust in programming circles[^2], so I approach the topic as a
researcher looking for mobile and cross-platform solutions. I try to
answer these two questions:

- What does software development look like in the future for science? 
- How are existing cross-platform and mobile frameworks  shaping the future of scientific development?

I briefly describe the problems of the current fragmented ecosystem, how
that ecosystem is converging on open-source tools, and then how the
emerging cloud-based computing paradigm will shape scientific computing
on mobile devices.

### The fragmented ecosystem

The trajectory of scientific programming is interesting because it seems
to be converging on a few tools from a historically fragmented and
siloed ecosystem. Chemists, for example, use their particular flavors of
modeling and analysis software (like Gaussian or ORCA), and Fortran is
used for much of climate science. The fragmentation makes sense because
of the wide range of applications that scientific programming must
serve, including modeling, analysis, visualization, and instrument
control. Furthermore, scientists are often not trained in programming,
leading to large gaps in ability even within a single laboratory.

These factors lead to several problems and realities within the
programmatic scientific community. These include:

1. **Code that is often not reusable or readable across (or within) scientific disciplines.** An example of this is the graduate student who writes software for their project, which nobody knows how to modify after they leave.

2. **Domain-specific applications that inhibit cross-disciplinary collaboration.** This includes proprietary software that, while effective, is not shareable because of cost or underutilization. Barriers to entry exist also because only a subset of people learn how to use a particular piece of software and would-be collaborators use something different.

3. **Complicated old code that stalls development.** Changing an old code base is a monumental task because the expertise that created the code has moved on. This is often the case with complex and large code bases that work, but nobody knows how. Making changes or sharing can require a complete rewrite.

The problems are more apparent today because the frontiers of science
are increasingly cross-disciplinary. Without shareable and reusable
code, there is considerable friction when trying to collaborate[^3].

### Convergence to open-source tools

Several technologies are now maturing and their convergence is solving
some of these problems. The transition will take a long time —
decades-old code bases need to be rewritten and new libraries need to be
built — but I expect the scientific programming landscape to be very
different ten years from now.

The wide-spread adoption of Python, R, and Jupyter in the scientific
community has solved many of the readability the share-ability
problems[^4]. Many projects now bundle Jupyter notebooks to demonstrate
how the code works. Python is easy to read, easy to write, and
open-source, making it an obvious choice for many to replace proprietary
analysis software. The interactive coding environment of Jupyter is also
having a
[major impact on scientific coding](https://crd.lbl.gov/news-and-publications/news/2021/project-jupyter-a-computer-code-that-transformed-science/). Someone reading a
scientific paper no longer has to take the author’s word that the
modeling and analysis are sound; they can go on GitHub and run the
software themselves.

A level above programming languages is apps for developing scientific
software and doing analysis. There are a lot of apps out there, but a
major component of development will use web technologies because of
their inherent interoperability. Jupyter notebooks, for example, can be
opened in the browser, meaning anyone can create and share something
created in Jupyter without obscure or proprietary software. Jupyter can
now also be used in [Visual Studio Code](https://code.visualstudio.com),
the popular, flexible, and rapidly-improving editor that is based on the
web-technology platform, Electron.

The growing popularity of web technologies in science foreshadows the
biggest change on the horizon, the move to cloud-based computing.

### Cloud-based computing for science

Mobile devices are finally powerful and flexible enough that most
people’s primary computing device is a smartphone. If this is the case,
then one might think that they must be powerful enough for scientific
applications. So, where are all of these great tools?

Ever since the iPad Pro came out in 2018[^5], I have been searching for
ways to fit it into my research workflow. So far, the best use-case for
it is reading and annotating journal articles. This great, but nowhere
near the mobile computing workstation I outlined above. The reason I
still cannot do analysis or share a simulation on an iPad is that
Python, Jupyter, an editor, graphing software, etc. are not available
for it — and my iPad is faster and more powerful (in many respects) than
my Mac[^6].

As I look around for solutions, it seems that the answer is to wait for
cloud-based development to mature. Jupyter already has notebooks in the
cloud via [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/). A
service called [Binder](https://mybinder.org) promises to host notebook
repositories and make code "immediately reproducible by anyone,
anywhere". Github will soon debut its
[Codespaces](https://github.com/features/codespaces) cloud platform, and
the Julia community (a promising open-source scientific programming
language) has put their resources into Jupyter and VS Code. Julia
Computing has also introduced [JuliaHub](https://juliahub.com), Julia’s
answer to cloud computing. Legacy tools for science trying to stay
relevant are also moving to the cloud (see MatLab in the cloud,
Mathematica Online, etc.). Any app or platform that does not make the
move will likely become irrelevant as code-bases transition.

There are no mobile-first solutions from any of the major players in
scientific software despite the incredible progress in mobile
hardware[^7]. Today I can write and run my software in a first-generation
cloud-based environment or switch to my traditional computing
workstation.

### Conclusion

What lies ahead for scientific programming? Maybe Julia will continue
its meteoric trajectory and become the *de facto* programming language
for science and scientific papers will come attached with Jupyter
notebooks. Maybe code will become so easy to share and reuse that the
niche and proprietary software that keeps the disciplines siloed will
become obsolete. These would be huge changes for the scientific
community, but I think any of these kinds of changes in the software
space are compounded by the coming cloud computing shift. Scientific
development will happen in the cloud and code will be more reproducible
and shareable than it is today as a result.

This future is different from the mobile computing world that I
imagined, where devices would shrink and simultaneously become powerful
enough that a thin computing slab empowered by a suite of on-device
scientific tools could fulfill most of my computing needs. Instead, the
mobile device will become a window to servers that will host my
software. Reproducible and reusable code will proliferate as a result,
but where does that leave the raw power of mobile computing devices?


<hr class="ref">

[^1]: This just became possible with the Moku devices coming out of [Liquid Instruments](https://liquidinstruments.com).

[^2]: See the [current controversy](https://sixcolors.com/post/2021/08/not-important-enough-1password-abandons-its-native-mac-app) over [OnePassword choosing to make their macOS app using Electron](https://blog.1password.com/1password-8-for-mac-is-now-in-early-access/) instead of one of Apple’s frameworks.

[^3]: Katharine Hyatt describes these problems in the first few minutes of [an excellent talk](https://youtu.be/4giNd6HLUQg) on using Julia for Quantum Physics.

[^4]: Another potential avenue for convergence is the ascent of the Julia open-source programming language, which promises to replace both high-performance code, higher-level analysis software, while making code reuse easy and natural. The language is still far from any sort of standard, but there are promising [examples of its use](https://www.nature.com/articles/d41586-019-02310-3).

[^5]: The iPad is, unfortunately, the only real contender in the mobile platform space. The Android ecosystem has not yet come up with a serious competitor that matches the performance of the iPad.

[^6]: Specifically, Apple does not allow code execution on its mobile operating systems.

[^7]: A great [Twitter thread by Steven Sinofsky](https://twitter.com/stevesi/status/1240327411478061056?s=21), former head of Windows, details the evolution of computing devices.