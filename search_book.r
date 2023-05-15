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

# Prompt the user to enter a search term
search_term <- get_search_term()

# Call the search_books function with the search term and print the search results
results <- search_books(search_term)
print(results)

