# Create normal and skewed distributions
# https://stackoverflow.com/questions/20254084/plot-normal-left-and-right-skewed-distribution-in-r
plot(density(rbeta(100000, 5, 2)), main = 'Positive Skew')
plot(density(rbeta(100000, 5, 5)), main = "Normal Distribution")
plot(density(rbeta(100000, 2, 5)), main = "Negative Skew")
# Plot bimodal density with two peaks
# https://stackoverflow.com/questions/11530010/how-to-simulate-bimodal-distribution-in-r
mu1 <- log(1)
mu2 <- log(900)
sig1 <- log(3)
sig2 <- log(3)
cpct <- 0.4
bimodalDistFunc <- function(n, cpct, mu1, mu2, sig1, sig2) {
  y0 <- rlnorm(n, mean = mu1, sd = sig1)
  y1 <- rlnorm(n, mean = mu2, sd = sig2)
 flag <- rbinom(n, size = 1, prob = cpct)
 y <- y0 * (1 - flag) + y1 * flag
}
bimodal_data <- bimodalDistFunc(n = 1000, cpct, mu1, mu2, sig1, sig2)
plot(density(log(bimodal_data)), main = "Bimodal Density")
# Or more easily 
x <- rnorm(10000, -3, 1)
y <- rnorm(10000, 3, 1)
z <- rbind(x, y)
plot(density(z), main = "Bimodal Density")
