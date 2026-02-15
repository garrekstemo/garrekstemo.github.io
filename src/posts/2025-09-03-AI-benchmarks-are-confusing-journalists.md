---
title: "AI Benchmarks Are Confusing Journalists"
date: 2025-09-03
---

In July, *The Economist* repeated a claim that prognosticators at the Forecasting Research Institute (FRI) had underestimated the progress of AI by nearly a decade. OpenAI’s o3 model, they wrote, was already performing at the level of a top team of human virologists. On its face this would suggest that super-intelligent AI had arrived. If language models (LLMs) can solve problems that require a team of scientists, then they surely can do my job and can now get on with driving a new scientific and economic revolution.

The trouble is that any serious look at FRI’s benchmarks puts the claims into question. Testimony from people actually using LLMs for creative work makes me question the authors' seriousness. LLMs do not perform like a bunch of PhDs in a data center. They will not get us there, even with more training and tricks. A new architecture is needed for AI to do original research.

Those in the AI forecasting business are not testing what they think they are testing and often misinterpret their own results. The media exacerbate the problem. They must do better to understand what a benchmark actually measures and evaluate that against forecasters’ claims before reporting them. More importantly, they should interview experts trying to incorporate LLMs into their work. There is no benchmark that can substitute for integrating AI into a creative workflow. Doing so makes the shortcomings of language models like o3 obvious.

Dwarkesh Patel, a podcaster who has interviewed executives and academics working on AI, quibbles with the predictions that AI will be able to replace white collar work in a few years. His main critique is that current LLM systems’ inability to learn will hold them back. He makes the point by analogy of teaching a student the saxophone. Using an LLM is like having a student play a song, writing detailed instructions about mistakes and improvements to make, and then inviting a new student to try again based on those notes. AI systems will always be mildly infuriating in this way until they can learn and remember. Students improve with practice; LLMs are stuck until a new version is built.

Chris Rackauckas, a scientific machine learning researcher at MIT, described a similar experience on the Julia language forums. He found that Claude Code was useful for repetitive code maintenance and simple problems “that a first year undergrad can do”. But it was unable to do extensive or novel algorithmic work. “This Claude thing is pretty dumb,” he writes, “but I had a ton of issues open that require a brainless solution”. Useful, but a team of machine learning experts it is not.

The release of GPT-5 in ChatGPT coincided with me wanting to implement a quantum master equation for nonlinear spectroscopy based on a paper published this year. ChatGPT (and Claude Code) could translate well-known parts of the theory, like the Lindblad equation, into Julia. But it struggled with new material and putting the pieces together so that everything worked. As most papers go, the authors left out details that the LLMs are happy to guess about. I still needed to work through the paper, understand the theory, understand how to express it in code, and do a lot of the writing myself.

What ChatGPT-5 improves upon is retrieving fundamental information and filling in my own knowledge gaps with correct references (which wasn't the case a short while ago). It can create toy problems to test how parts of the code should work within the larger framework. What it still cannot do is implement a just-published piece of theory in code, let alone extend it into novel territory, a natural next step for research.

LLMs are interpolation machines, not extrapolation machines. They can reproduce what is in their training data and generate new output within those limits. Yann LeCun has said in interviews that LLMs are “systems with a gigantic memory and retrieval ability”. They do not function like a PhD, which requires asking the right questions and solving novel problems.

My gripe is not about the capabilities of LLMs, which are already quite powerful. It is with these benchmarks claiming there is something there that isn’t and extrapolating to predict an intelligence explosion that will start solving real problems. I agree with LeCun and Patel that progress will require a new architecture that can learn, have persistent memory, plan, and understand the physical world.

Reputable media outfits conflating AI generally with LLM technology specifically is a major problem that I hope is resolved soon. There will not be a continuous line from the current architecture to the next one. In reality, progress is likely to be discontinuous, and bridging that gap will take more than scaling up LLM technology with bolted-on tricks.

<br>

[AI labs' all-or-nothing race leaves no time to fuss about safety](https://economist.com/briefing/2025/07/24/ai-labs-all-or-nothing-race-leaves-no-time-to-fuss-about-safety) -- *The Economist*

[What if AI made the world's economic growth explode?](https://economist.com/briefing/2025/07/24/what-if-ai-made-the-worlds-economic-growth-explode) -- *The Economist*

[Why I don't think AGI is right around the corner](https://youtu.be/nyvmYnz6EAg) -- Dwarkesh Patel

[Everyone is judging AI by these tests, but experts say they're close to meaningless](https://themarkup.org/artificial-intelligence/2024/07/17/everyone-is-judging-ai-by-these-tests-but-experts-say-theyre-close-to-meaningless) -- Jon Keegan, *The Markup*

[This Claude thing is pretty dumb, but I had a ton of issues open that require a brainless solution.](https://discourse.julialang.org/t/the-use-of-claude-code-in-sciml-repos/131009/8) -- Chris Rackauckas, JuliaLang Discourse

[Why AI won't take my job](https://on.ft.com/4oYOX9U) -- Rana Foroohar, *Financial Times*