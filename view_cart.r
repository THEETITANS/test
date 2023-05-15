library(RPostgres)
library(DBI)
source("conn.r")

# Function to view the books in the cart
view_cart <- function() {
  # Connect to the database
  #conn <- dbConnect(PostgreSQL(), dbname = "your_database", host = "localhost", port = 5432, user = "your_username", password = "your_password")
  
  # Retrieve cart data from the database
  cart_data <- dbGetQuery(conn, "SELECT * FROM cart_table")
  
  # Check if the cart is empty
  if (nrow(cart_data) == 0) {
    print("Cart is empty.")
  } else {
    # Print the cart data
    print(cart_data)
  }
  
  # Close the database connection
  dbDisconnect(conn)
}
print(view_cart())
