# Define a function to checkout items from the cart
checkout <- function() {
  # Calculate the total cost of the items in the cart
  total <- sum(cart$Price * cart$Quantity)
  # Print the total cost
  cat("Total cost:", total, "\n")
  # Remove all items from the cart
  cart <- data.frame(Product = character(), Selling_Price = numeric(), Quantity = numeric(), stringsAsFactors = FALSE)
  # Print a confirmation message
  cat("Thank you for your purchase!\n")
}
checkout()