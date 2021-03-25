
functions {
  // Sigmoid curve describing the number of fishing days
  real fdays(real slope, real t, real dmax, real midpoint) {
    return dmax/(1 + exp(-slope * (t - midpoint)));
  }
}

data {
  int<lower=0> n_obs; // number of fisherman responses
  int<lower=0> n_fisher; // number of fishermen in survey
  int<lower=0> tmax; // maximum number of time steps
  int<lower=0> year[n_obs]; // response years
  real<lower=0> CPUE[n_obs]; // adjusted CPUE data
  int<lower=0> n_boats[tmax]; // number of fishing boats
  int<lower=0> fisher_id[n_obs]; // unique id for each fisherman
  real<lower=0> K; // carrying capacity
  real midpoint; // midpoint of sigmoid fishing days curve
  real lambda; // finite rate of increase
  real alpha; // ordinarily, (lambda - 1)/K 
  real slope; // slope of sigmoid fishing days curve
}

parameters {
  real<lower = 0> q;
  real<lower = 0> sigma_q;
  real<lower = 0> q_fisher[n_fisher];
  real<lower = 0> sigma_cpue;
  real<lower = 0> dmax;
}

transformed parameters {
  real Np_hat[n_obs];
  
  for (i in 1:n_obs) {
    real N[year[i]];
    real Np[year[i]];
    N[1] = K;
    for (j in 1:year[i]) {
      Np[j] = lambda*N[j] / (1 + alpha*N[j]); 
      if (j < year[i]) {
        N[j + 1] = Np[j] * exp(-q * fdays(slope, j, dmax, midpoint) * n_boats[j]);
      }
    }
    Np_hat[i] = Np[year[i]];
  }
  
}

model {
  vector[n_obs] mu_cpue;
  q ~ normal(0.01, 0.05); // vague prior for catchability
  sigma_cpue ~ normal(0, 0.5); // vague half-normal 
  sigma_q ~ normal(0, 0.05); // vague given scale of catchability
  q_fisher ~ normal(q, sigma_q); // fisherman-level random effect
  dmax ~ normal(114.7, 17.68); // empirical prior

  for (i in 1:n_obs) {
    mu_cpue[i] = Np_hat[i] * (1 - exp(-q_fisher[fisher_id[i]]));
    CPUE[i] ~ normal(mu_cpue[i], sigma_cpue);
  }
}
