**Course Materials for Quantitative Methods in Marine Ecology & Conservation (BIOHOPK 143H) Weeks 5-7**

**Stanford University, Winter 2021 & 2022**

This repository contains course materials used as part of Stanford's "Quantitative methods in marine ecology and conservation" course. Material from this section of the course was developed and taught by me, and is meant as an introduction to fitting biological models to data using (1) maximum likelihood and (2) Bayesian methods, as well as on (3) species distribution modeling with GLMs and GAMs. The Bayesian material was dropped for the Winter 2022 material, in favor of an expanded exploration of maximum likelihood and species distribution modeling. This course is taught using a "flipped classroom" format, where students watch lectures and complete readings before class, and then work through labs during class.

The subsections for this part of the course are as follows: 

**1. Maximum likelihood estimation**

- [Lectures 1-3](https://www.youtube.com/watch?v=9j3Toso-BWU&list=PLoSWDc8SaZ3yaCZSJm6dgtFeNwt0wjrAk) (recorded before class) available on YouTube.
- Prior to completing the following labs, students explore probability distributions and their applications to stochastic and statistical modeling of ecological systems during the [distributions lab](https://github.com/mcgoodman/distributions-lab)
- **Lab 1** covers the basics of maximum likelihood estimation, using ordinary linear regression as an example.
- **Lab 2** uses maximum likelihood to estimate the parameters of functional responses. The lab pulls heavily on examples from Ben Bolker's book, *Ecological models and data in R*, and the associated R package `emdbook`.
- **Lab 3** uses maximum likelihood to fit and compare stock-recruitment curves. The lab uses example data from the `FSAdata` R package.
- **Lab 4** fits a dynamic Beverton-Holt model to data on a harvested abalone population, including and AR1 error structure. Before class, students were asked to watch the [lecture](https://www.youtube.com/watch?v=G8iWbBFkrYE) on model assumptions.

**2. Bayesian models**

- A brief [lecture](https://www.youtube.com/watch?v=nA0hciDtSf0&t=2s) on the basics of Bayesian models (recorded before class) is available on YouTube. The material in this lecture and the associated Bayesian labs build on material taught during the maximum likelihood subsection.
- **Lab 1** fits a dynamic Bayesian Lotka-Volterra predator-prey model to the classic Hudson Bay Lynx & Hare dataset, using Stan code modified from Richard McElreath's *Statistical Rethinking* book.
- **Lab 2** fits a dynamic, hierarchical Beverton-Holt model to data from a small-scale reef shark fishery using Stan.

**3. Species distribution models**

- This brief section on SDMs builds on the maximum-likelihood material taught during the first subsection, and covers the basics of using Bernoulli GLMs and GAMs to build correlative species distribution models. The [lecture](https://www.youtube.com/watch?v=xmlIoDEeHDE) is available on YouTube.
- **Lab 1** covers the use of GAMs to model species distributions, including environmental, spatial, and spatiotemporal covariates. The data used (which are publicly available) are from annual bottom trawl surveys conducted in the Eastern Bering Sea by the NOAA Alaska Fisheries Science Center. The aim of the lab is to acquaint students with GAMs as a tool.
- In **Lab 2**, students use California Thrasher presence/pseudo-absence and BIOCLIM data to build species distribution models and project them to 2081-2100 under two different climate scenarios. Students were assigned Grinnell 1917, "The Niche Relationships of the California Thrasher" as a before-class reading. The aim of this lab is to acquaint students with basic principles in biogeography and ecology, and for students to apply those principles to modeling species distributions and interpreting outputs from SDMs.

You are welcome to re-use the materials for this course for your own learning or as part of materials for your course - and please let me know if you do! Additionally, if you have any suggested changes to this material or find any inaccuracies in it, please reach out - I'd love to hear from you, both for my own knowledge and for future students I may teach this material to!