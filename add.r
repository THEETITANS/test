library(RPostgres)
library(DBI)
source("conn.r")

# create an empty data frame to store cart items
 cart <- data.frame(  
    book_title = character(), 
    author = character(), 
    price = numeric(),  
    stringsAsFactors = FALSE
)

# add items to cart
add_to_cart <- function() {
    # prompt the user to enter the book information
    Author_name <- readline("Enter the name of the book's author: ")
    Title <- readline("Enter the title of the book: ")
    Selling_Price <- as.numeric(readline("Enter the price of the book: "))

    # check if the book is available in the database
    book_query <- sprintf("SELECT * FROM Book_Table WHERE Author_name = '%s' AND Title = '%s'",Author_name,Title)
    book_result <- dbGetQuery(conn, book_query)

    if (nrow(book_result) == 0 ){
        print("Book not found in the database")
    }else{
        #add the book to the cart
        new_item <- data.frame(  
            book_title = Title,  
            author = Author_name,  
            price = Selling_Price,   
            stringsAsFactors = FALSE 
            )  
    }

    # add items to cart 
    add_to_cart <- function(Title, Author_name, Selling_Price) { 
        new_item <- data.frame(  
            book_title = Title,  
            author = Author_name,  
            price = Selling_Price,   
            stringsAsFactors = FALSE 
        )  
    cart <<- rbind(cart, new_item) # use <<- to modify the global variable cart
        print(paste("Added",Title,"by",Author_name, "to yout cart.")) 
    }
}
# view cart 
view_cart <- function() { 
    if (nrow(cart) == 0) {   
        print("Your cart is empty.")  
    }   else {    
        print(cart)  
    }                                       
    } 
    # test the cart functions
    add_to_cart()
    add_to_cart()
    view_cart()