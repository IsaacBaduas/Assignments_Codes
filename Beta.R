# Clear the workspace
rm(list=ls())

# Load necessary library
library(ggplot2)

# Parameters for Beta distribution
alpha_values <- c(0.5, 2, 5)  # Different alpha values
beta_value <- 2  # Fixed beta value

# Create a sequence of x values
x <- seq(0, 1, length.out = 100)

# Plotting the Beta distribution for different alpha values
plot(NULL, xlim = c(0, 1), ylim = c(0, 3), xlab = "x", ylab = "Density", main = "Beta Distribution")
colors <- c("red", "blue", "green")

for (i in 1:length(alpha_values)) {
  lines(x, dbeta(x, alpha_values[i], beta_value), col = colors[i], lwd = 2)
}

legend("topright", legend = paste("alpha =", alpha_values), col = colors, lwd = 2, cex = 0.8)








# Load necessary library
library(ggplot2)

# Parameters for Beta distribution (try multiple combinations of alpha and beta)
alpha_values <- c(0.5, 2, 5)  # Different alpha values
beta_values <- c(0.5, 2, 5)   # Different beta values

# Create a sequence of x values for plotting
x <- seq(0, 1, length.out = 100)

# Set up a multi-plot layout to show different combinations of alpha and beta
par(mfrow = c(3, 3))  # Create a 3x3 grid for plots

# Loop through all combinations of alpha and beta values
for (alpha in alpha_values) {
  for (beta in beta_values) {
    # Plot the Beta distribution for the current alpha and beta
    plot(x, dbeta(x, alpha, beta), type = "l", col = "blue", lwd = 2,
         xlim = c(0, 1), ylim = c(0, 5), xlab = "x", ylab = "Density",
         main = paste("Alpha =", alpha, ", Beta =", beta))
  }
}

