# Clear the workspace
rm(list=ls())


par(mfrow = c(1, 1))

install.packages("VGAM")
library(VGAM)


# Parameters for Beta-binomial distribution
N <- 10  # Number of trials
alpha_values_bbinom <- c(1, 5, 10)  # Different alpha values
beta_value_bbinom <- 5  # Fixed beta value

# Plotting the Beta-binomial distribution for different alpha values
k <- 0:N  # Possible number of successes
plot(NULL, xlim = c(0, N), ylim = c(0, 0.3), xlab = "Number of Successes", ylab = "Probability", main = "Beta-Binomial Distribution")
colors_bbinom <- c("red", "blue", "green")

# Loop through different alpha values and plot
for (i in 1:length(alpha_values_bbinom)) {
  # Use dbetabinom.ab function from VGAM
  probs <- dbetabinom.ab(k, N, alpha_values_bbinom[i], beta_value_bbinom)
  lines(k, probs, type = "h", col = colors_bbinom[i], lwd = 2)
}

# Add a legend
legend("topright", legend = paste("alpha =", alpha_values_bbinom), col = colors_bbinom, lwd = 2)      





# Example of qnorm
p <- 0.95  # Probability
mean_value <- 0  # Mean of the normal distribution
sd_value <- 1  # Standard deviation of the normal distribution

# Calculate the 95th percentile
quantile_value <- qnorm(p, mean = mean_value, sd = sd_value)
print(paste("The 95th percentile of the normal distribution is:", quantile_value))





# Clear the workspace
rm(list=ls())

# Install and load VGAM package (only need to install once)
if (!require(VGAM)) {
  install.packages("VGAM")
  library(VGAM)
}

# Parameters for Beta-binomial distribution
N <- 10  # Number of trials
alpha_values_bbinom <- c(1, 5, 10)  # Different alpha values
beta_values_bbinom <- c(1, 5, 10)  # Different beta values

# Create a 3x3 plot layout to show different combinations of alpha and beta
par(mfrow = c(3, 3))

# Loop through different alpha and beta values and plot the Beta-binomial distribution
for (alpha in alpha_values_bbinom) {
  for (beta in beta_values_bbinom) {
    # Plot for each alpha-beta combination
    k <- 0:N  # Possible number of successes
    probs <- dbetabinom.ab(k, N, alpha, beta)  # Calculate Beta-binomial probabilities
    plot(k, probs, type = "h", lwd = 2, col = "blue", ylim = c(0, max(probs)),
         xlab = "Number of Successes", ylab = "Probability",
         main = paste("Beta-Binomial (alpha =", alpha, ", beta =", beta, ")"))
  }
}
