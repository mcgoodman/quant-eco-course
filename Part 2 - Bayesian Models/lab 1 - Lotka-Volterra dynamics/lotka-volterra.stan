functions {
  real[] dpop_dt( real t,                 // time
                real[] pop_init,          // initial state {lynx, hares}
                real[] theta,             // parameters
                real[] x_r, int[] x_i) {  // unused
    real L = pop_init[1]; // true population size of lynx
    real H = pop_init[2]; // true population size of hares
    real bh = theta[1]; // prey intrinsic growth rate, alpha
    real mh = theta[2]; // predation efficiency, beta
    real ml = theta[3]; // loss rate of predator population, gamma
    real bl = theta[4]; // rate of conversion from prey to predator, delta
    // differential equations
    real dH_dt = (bh - mh * L) * H; // hare change over time
    real dL_dt = (bl * H - ml) * L; // lynx change over time
    return { dL_dt , dH_dt };
  }
}

data {
  int<lower=0> N;              // number of measurement times
  real<lower=0> pelts[N,2];    // measured populations
}

transformed data{
  real times_measured[N-1];    // N-1 because first time is initial state
  for ( i in 2:N ) times_measured[i-1] = i;
}

parameters {
  real<lower=0> theta[4];      // { alpha, beta, gamma, delta }
  real<lower=0> pop_init[2];   // initial population state
  real<lower=0> sigma[2];      // measurement errors
  real<lower=0,upper=1> p[2];  // trap rate
}

transformed parameters {
  real pop[N, 2];
  pop[1,1] = pop_init[1];
  pop[1,2] = pop_init[2];
  pop[2:N,1:2] = integrate_ode_rk45(
    dpop_dt, pop_init, 0, times_measured, theta,
    rep_array(0.0, 0), rep_array(0, 0),
    1e-5, 1e-3, 5e2);
}

model {
  // priors
  theta[{1,3}] ~ normal( 1 , 0.5 );    // bh,ml
  theta[{2,4}] ~ normal( 0.05, 0.05 ); // mh,bl
  sigma ~ exponential( 1 );
  pop_init ~ lognormal( log(10) , 1 );
  p ~ beta(40,200);
  // observation model
  // connect latent population state to observed pelts
  for ( t in 1:N )
    for ( k in 1:2 )
      pelts[t,k] ~ lognormal( log(pop[t,k]*p[k]) , sigma[k] );
}

generated quantities {
  real pelts_pred[N,2];
  for ( t in 1:N )
    for ( k in 1:2 )
      pelts_pred[t,k] = lognormal_rng( log(pop[t,k]*p[k]) , sigma[k] );
}
