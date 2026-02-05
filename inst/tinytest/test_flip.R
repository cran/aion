Sys.setenv(LANGUAGE = "en") # Force locale

## Create 6 x 3 time-series of 50 observations
## Sampled every two years starting from 2000 BP
arr <- array(rnorm(900), dim = c(50, 6, 3),
             dimnames = list(NULL, paste0("S", 1:6), paste0("V", 1:3)))
X <- series(
  object = arr,
  time = seq(2000, by = 2, length.out = 50),
  calendar = BP()
)
Y <- flip(X)
Z <- flip(Y)

expect_identical(X, Z)
