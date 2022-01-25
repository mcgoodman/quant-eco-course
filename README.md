**Course Materials for Quantitative Methods in Marine Ecology & Conservation (BIOHOPK 143H) Weeks 5-7**

**Stanford University, Winter 2021**

This repository contains course materials used as part of Stanford's "Quantitative methods in marine ecology and conservation" course, led by Dr. Giulio De Leo. Material from this section of the course was developed and taught by me, and is meant as an introduction to fitting biological models to data using (1) maximum likelihood and (2) Bayesian methods, as well as on (3) species distribution modeling with GLMs and GAMs.

The subsections for this part of the course are as follows: 

**1. Maximum likelihood estimation**

- [Lectures 1-3](https://www.youtube.com/watch?v=L4aCy5_PhGM&list=PLoSWDc8SaZ3yaCZSJm6dgtFeNwt0wjrAk) (recorded before class) available on YouTube.
- **Lab 1** covers the basics of maximum likelihood estimation, using ordinary linear regression as an example.
- **Lab 2** uses maximum likelihood to estimate the parameters of functional responses. The lab pulls heavily on examples from Ben Bolker's book, *Ecological models and data in R*, and the associated R package `emdbook`.
- **Lab 3** uses maximum likelihood to fit and compare stock-recruitment curves. The lab uses example data from the `FSAdata` R package.
- **Lab 4** fits a dynamic Beverton-Holt model to data on a harvested abalone population, including and AR1 error structure.

**2. Bayesian models**

- A brief [lecture](https://www.youtube.com/watch?v=nA0hciDtSf0&t=2s) on the basics of Bayesian models (recorded before class) is available on YouTube. The material in this lecture and the associated Bayesian labs build on material taught during the maximum likelihood subsection.
- **Lab 1** fits a dynamic Bayesian Lotka-Volterra predator-prey model to the classic Hudson Bay Lynx & Hare dataset, using Stan code modified from Richard McElreath's *Statistical Rethinking* book.
- **Lab 2** fits a dynamic, hierarchical Beverton-Holt model to data from a small-scale reef shark fishery. Please contact me for the data, as they are not published.

**3. Species distribution models**

- This brief section on SDMs builds on the maximum-likelihood material taught during the first subsection, and covers the basics of using Bernoulli GLMs and GAMs to build correlative species distribution models. The [lecture](https://youtu.be/0lBZulpryQM) (recorded during class) is available on YouTube.
- **The Lab** covers the use of GAMs to model species distributions, including environmental, spatial, and spatiotemporal covariates. The data used (which are publicly available) are from annual bottom trawl surveys conducted in the Eastern Bering Sea by the NOAA Alaska Fisheries Science Center.

You are welcome to re-use the materials for this course for your own learning or as part of materials for your course (but please contact me in the latter case, especially if you'd like the data from MLE lab 4 and Bayesian lab 2). Additionally, if you have any suggested changes to this material or find any inaccuracies in it, please reach out - I'd love to hear from you, both for my own knowledge and for future students I may teach this material to!