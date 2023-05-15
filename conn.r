
library(RPostgres)

# Connect to the database
  conn <- dbConnect(Postgres(), 
                    dbname = "postgres", 
                    host = "localhost", 
                    port = 5432, 
                    user = "postgres", 
                    password = " ")
  
