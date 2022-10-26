---
layout: post
title: "Jumping over the time-to-first-plot problem in Julia"
date: 2022-10-26
---

I've been using Julia for about a year now after moving my entire workflow
from Python.
When I sometimes revisit Python I am so glad I made the switch. No regrets whatsoever. Julia still has one pain point, 
which is time to first execution (TTFX) or time to first plot (TTFP)[^fn_22021026_1].
But even this "pain point" is somewhat bizarre because Julia is a compiled language. Of 
course there is going to be a compilation step that will make it slow to get going. What makes this a pain
point is the desire to have it all &mdash; "we are greedy," [say the founders](https://julialang.org/blog/2012/02/why-we-created-julia/) of the language.
Julia wants to be interactive and dynamic, but compiled and fast.
But the fact that it's compiled means that when a user wants to make a simple line plot it takes two minutes to precompile the plotting library, compile the plotting functions, and finally show the plot on screen.
Only after that initial setup are all subsequent plots instant &mdash; as long as you keep your session active. There are many more talented programmers in the community than me, and one user in a [recent Discourse thread](https://discourse.julialang.org/t/very-slow-time-to-first-plot-2022/88968/27) explained the tradeoff and the difficulty in reducing compile time:

>A tangent: I believe it is worthwhile to discuss why this is such a phenomenally big problem in julia. Julia has two very special features other languages do not share: (1) multimethods as the fundamental principle for the entirety of the ecosystem and (2) compiled code. It is very difficult to know what code you need compiled and to not discard the vast majority of already compiled code when importing new libraries that add new methods for pre-existing functions. No one has had to deal with this problem before julia. It is being slowly dealt with. Sysimages basically carry the promise that no significant amount of new methods will be defined, hence they can cache more compiled code (this is very oversimplified borderline misleading explanation).


That last point about sysimages is where I want to focus. Making a sysimage in Visual Studio Code is a game changer, and I recommend all Julia users try it. It essentially compiles all the libraries from your project, and any other files you specify, and puts them into a file. I guess you could say it freezes your Julia session to use later. This is faster than precompiling each time. It's built into the Julia extension and easy to set up. Instructions are here: [Compiling Sysimages](https://www.julia-vscode.org/docs/dev/userguide/compilesysimage/). In a nutshell the steps are:

1. Open your project folder in VS Code with the [Julia extension installed](https://code.visualstudio.com/docs/languages/julia) (and make sure it's activated)
2. Make a new folder called `.vscode`
3. Make a file called `JuliaSysimage.toml` in that folder
4. Paste the following into that file

```
 [sysimage]
 exclude=[]   # Additional packages to be exlucded in the system image
 statements_files=[]  # Precompile statements files to be used, relative to the project folder
 execution_files=[] # Precompile execution files to be used, relative to the project folder
```

5. Select `Tasks: Run Build Task` and then `select Julia: Build custom sysimage for current environment`    
6. Check the `useCustomSysimage` setting in the Julia extension settings in VS Code
7. Restart the Julia REPL. (Hit the trash can button and open a new REPL session from the Command Palette)

The VS Code extension automatically uses the sysimage instead of precompiling your project. And now your project should run much faster and TTFX will be significantly sped-up. On my M1 iMac I use the powerful but compiler-heavy [Makie](https://docs.makie.org/stable/) plotting library and I went from waiting about 2 minutes for precompilation and maybe 30 seconds for that first plot to almost no compile time, and execution in less than a second. (Other people have properly benchmarked this, I'm not going to do that here). I see similar results on my 2019 Intel Macbook Pro.

But here's what really got my workflow sailing. I'm PhD student working in experimental physics. I have a lot of messy data and I need to make a ton of plots to explore that data. I have a top-level folder for my experiment.
In there I have separate folders for raw data, daily scripts, and results/plots.
Then I have a `src` folder where plotting, analysis, and file reading/writing scripts go. The files in `src` rarely change, so that means I can add them to the `execution_files` section in my `JuliaSysimage.toml` file. These scripts get compiled along with all my plotting packages into the sysimage. This makes _everything_ fast. It's incredible.

```
My Experiment Folder
|
|_.vscode
|   |_JuliaSysimage.toml
|_data
|   |_221015
|   |_221025
|   |_...
|_lab_notebook
|   |_221015.jl  # julia scripts for that experiment day
|   |_221025.jl
|_results
|   |_plots
|      |_221015
|      |   |_fig1.pdf
|      |_...
|
|_src
|   |_plotting_functions.jl
|   |_data_io.jl
|   |_lab_notebook_template.jl
|   |_analysis_functions.jl
|
|_JuliaSysimage.dylib
|_Project.toml
|_Manifest.toml
|_...
```

For the above example, I put

```
[sysimage]
exclude=[]   # Additional packages to be exlucded in the system image
statements_files=[]  # Precompile statements files to be used, relative to the project folder
execution_files=[] # Precompile execution files to be used, relative to the project folder
```

in the `JuliaSysimage.toml` file. As long as I don't change these files, their functions load instantly. The functions in these files are used in my `lab_notebook` files with an `include()` statement at the top (e.g. `include("plotting_functions.jl")`). For example, I have custom plotting functions and themes that make an interactive grid of plots with toggles and settings so I can look at and compare data exactly the way I want. Recreating the sysimage a couple of times a month (or even once a week) is not a big deal compared to the time savings I get every day.

As an aside, I recommend everyone have some kind of setup like this where you reuse plotting and analysis functions, no matter what language you're using. If you are editing these functions every day then either these scripts have not settled down yet or something isn't quite right with the workflow. It is worth it to sit down and figure out what tools you need to build to smooth out day-to-day computational tasks instead of writing scripts from scratch each time you have to make a graph of some data. For the most part, the file format for my data is the same, so I only need a handful of plotting and data read/write functions. Once they're written, that's it. I can move on.

As many others have said, the time-to-first-X problem is a priority for the Julia developers. The version 1.8 update this year saw some speedups,
and I think the expectation is that this will continue in future releases. 
These improvements to the compilation stage, both in VS Code and the work being done in the language itself, have surpassed my expectations. I thought Julia would always have an initial lag and that people would have to make hacks and workarounds. This really is exciting, and there is a lot to look forward to in Julia's future.

[^fn_22021026_1]: The plotting libraries generally take the longest to precompile.