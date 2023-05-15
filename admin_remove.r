library(RPostgres)
library(DBI)
source("conn.r")


get_book<- function() {
 book_ID <- readline("Enter ISBN of the book to delete: ")
  
  # Return the search term
  return(book_ID)
}


# Construct the SQL DELETE statement
sql <- paste0("DELETE FROM Book_Table WHERE ISBN = ", book_ID)

# Execute the SQL statement
dbSendQuery(conn, sql)

# Close the database connection
dbDisconnect(conn)
