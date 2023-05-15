library(RPostgres)
dbConn <- source("conn.r")

# create an update book function
update_book <- function(dbConn, updateQueries) {
    
    # Loop through the update queries
    for (queries in updateQueries) {
        tryCatch({
            # Execute the update query
            dbSendQuery(dbConn, query)
            cat("Table updated successfully.\n")
        }, error = function(e) {
            cat("Error updating table:", conditionMessage(e), "\n") 
        })
    }
}

# Define update queries for each table
updateQueries <- list(
  "UPDATE Admin_Table SET %s='%s' WHERE id='%s'",
  "UPDATE user_Table SET %s='%s' WHERE id='%s'",
  "UPDATE Author_Table SET %s='%s' WHERE id='%s'",
  "UPDATE Publisher_Table SET %s='%s' WHERE id='%s'"
)

# Call the function to update the tables
updateTables(dbConnection, updateQueries)

# Close the database connection
dbDisconnect(dbConnection)