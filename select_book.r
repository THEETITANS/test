# Load the required packages
library(RPostgres)
library(DBI)
source("conn.r")  

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



# Define a function that adds a book to the cart table
add_to_cart <- function(book_id) {
  # Build the SQL query to insert the book into the cart table
  query <- paste0("INSERT INTO Cart_Table (book_id) VALUES (", book_id, ")")
  
  # Execute the query
  dbExecute(conn, query)
  
  # Print a confirmation message
  message("Book with ID ", book_id, " has been added to your cart.")
}

# Define a function that displays the contents of the cart table
view_cart <- function() {
  # Build the SQL query to retrieve the books in the cart table
  query <- "SELECT Book_Table.* FROM Book_Table JOIN Cart_Table ON Book_Table.id = Cart_Table.book_id"
  
  # Execute the query and retrieve the cart items
  cart_items <- dbGetQuery(conn, query)
  
  if(nrow(cart_items) == 0) {
    message("Your cart is empty.")
  } else {
    # Print the cart items
    for(i in 1:nrow(cart_items)) {
      print(cart_items[i, ])
    }
  }
}

# Prompt the user to enter a search term
search_term <- get_search_term()

# Call the search_books function with the search term and print the search results
results <- search_books(search_term)
print(results)

# If a book is found, prompt the user to add it to the cart
if(!is.null(results)) {
  book_id <- results$id
  add_to_cart(book_id)
}

# View the contents of the cart table
view_cart()
