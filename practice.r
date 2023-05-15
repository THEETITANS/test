# Load the required packages
library(RPostgres)
library(DBI)
source("conn.r")

# Define a global variable for the cart
cart <- list()

# Define a function that prompts the user to enter a search term
get_search_term <- function() {
  term <- readline("Enter a search term (ISBN, author, title, or publisher): ")
  
  # Return the search term
  return(term)
}

# Define a function that takes a search term as input and searches the database
search_books <- function(search_term) {
  
  # Build the SQL query based on the search term
  query <- paste0("SELECT DISTINCT * FROM Book_Table WHERE ISBN = '", search_term, "' OR Author_name = '", search_term, "' OR Title = '", search_term, "' OR Publisher = '", search_term, "'")
  
  # Execute the query and retrieve the search results
  searched_books <- dbGetQuery(conn, query)

    # Check if any books were found
  if(nrow(searched_books) == 0) {
    message("Sorry, the book is not available at the moment.")
    return(NULL)
  }
  
  # Return the search results
  return(searched_books)
}

# Define a function that adds a book to the cart
add_to_cart <- function(book) {
  # Add the book to the cart
  cart[[length(cart) + 1]] <- book
  # Construct the SQL query to insert the book into the cart table
  query <- paste0("INSERT INTO Cart_Table (Title , isbn, quantity) VALUES ('", book$Title, "', '", book$ISBN, "', 1)")
  # Execute the query
  dbExecute(conn, query)
  # Print a confirmation message
  message(paste(book$Title, "has been added to your cart."))
}

# Prompt the user to enter a search term
search_term <- get_search_term()

# Call the search_books function with the search term and print the search results
results <- search_books(search_term)
print(results)

# If a book is found, prompt the user to add it to the cart
# ... previous code ...

# If a book is found, prompt the user to add it to the cart
if(!is.null(results)) {
  while(TRUE) {
  add_to_cart_input <- readline("Would you like to add this book to your cart? (y/n): ")
  add_to_cart_input <- trimws(add_to_cart_input) # Remove any leading/trailing whitespace
  if(add_to_cart_input == "y") {
    # Add the book to the cart
    add_to_cart(results)
      
      # Insert the book into the cart_table
      query <- paste0("INSERT INTO Cart_Table (Title , isbn, quantity) VALUES ('", "The Mummies of Urumchi", "', '", 393045218, "', 1)")
      dbExecute(conn, query)
      
      # Print a confirmation message
      message(paste(results$Title, "has been added to your cart."))
      break
    } else if(add_to_cart_input == "n") {
      break
    }
  }
}

# View the contents of the cart
cart_query <- "SELECT * FROM Cart_Table"
cart_contents <- dbGetQuery(conn, cart_query)
print(cart_contents)

