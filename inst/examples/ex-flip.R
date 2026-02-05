## Create 6 x 3 time-series of 50 observations
## Sampled every two years starting from 2000 BP
X <- series(
  object = array(rnorm(900), dim = c(50, 6, 3)),
  time = seq(2000, by = 2, length.out = 50),
  calendar = BP()
)
plot(X, calendar = BP())

## Permute dimensions 2 and 3
## 3 x 6 time-series of 50 observations
Y <- flip(X)
plot(Y, calendar = BP())
