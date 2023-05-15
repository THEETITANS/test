DROP TABLE IF EXISTS Admin_Table;
DROP TABLE IF EXISTS user_Table;
DROP TABLE IF EXISTS Book_Table CASCADE;
DROP TABLE IF EXISTS Sales_Table;
DROP TABLE IF EXISTS Cart_Table;
DROP TABLE IF EXISTS Author_Table;
DROP TABLE IF EXISTS Publisher_Table;


--CREATE TABLES FOR DATABASE

CREATE TABLE Admin_Table(
    admin_id int,
    admin_name varchar(45)
);


CREATE TABLE user_Table(
    userID int,
    user_name VARCHAR(50),
    Phone_num char(15),
    email_address varchar(45)
);

CREATE TABLE Book_Table(
    ISBN char(45),
    Title varchar(250),
    Author_name varchar(100),
    Publisher varchar(100),
    Publication_year int,
    Selling_Price float, 
    Quantity int 

);

CREATE TABLE Sales_Table(
    user_name VARCHAR(50),
    ISBN char(45),
    Quantity int, 
    Selling_Price float

);


CREATE TABLE Cart_Table(
    Title varchar(45),
    ISBN char(45),
    Quantity int
);

CREATE TABLE Author_Table(
     author_id int,
     author_name varchar(45)
);

CREATE TABLE Publisher_Table(
    publisher_id VARCHAR(45),
    publisher_name varchar(45)
);

---POPULATE USER TABLE


-- INSERT INTO user_Table( userID, Fname , Lname , Phone_num , email_address , User_password)
-- VALUES('1','John','Doe','0782345678','johndoe@gmail.com ','123'),
-- ('2','Ben','Wright','0780987651','Benwright@gmail.com',' '),
-- ('3','Jen','Kaiser','0782345456','JenKaiser@gmail.com ',' '),
-- ('4','Ann','Adams ','0780987679','Annadams@gmail.com',' '),
-- ('5','David','Morrison','0782341576','David@gmail.com ',' '),
-- ('6','Sheila','Grisham','0782234566','sheila@gmail.com',' '),
-- ('7','Jack','Onion ','0786673890','Jackonion@gmail.com',' '),
-- ('8','Rob','Brown','0782313567','RobBrown@gmail.com',' '),
-- ('9','Tony','Jackson ','0787763664','Tony@gmail.com ',' '),
--('10','Len ','Brown','0789990009','Len@gmail.com ',' ');


--POPULATE ADMIN TABLE

INSERT INTO Admin_Table( admin_id, admin_name )
VALUES('1','Jonathan');


--POPULATE BOOK TABLE

INSERT INTO Book_Table(ISBN,Title,Author_name, Publisher,Publication_year,Selling_Price,Quantity)
VALUES('195153448','Classical Mythology','Mark P. O. Morford','Oxford University Press','2002','200.00','10'),
('2005018','Clara Callan','Carlo D Este','HarperFlamingo Canada','2001','200.00','10'),
('60973129','Decision in Normandy','Gina Bari Kolata','HarperPerennial','1991','150.00','8'),
('374157065','Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It','E. J. W. Barber','Farrar Straus Giroux','1999','230.00','10'),
('393045218','The Mummies of Urumchi','Amy Tan','W. W. Norton &amp; Company','1999','225.00','15'),
('399135782','The Kitchen Gods Wife','Robert Cowley','Putnam Pub Group','1991','150.00','11'),
('425176428','What If?: The Worlds Foremost Military Historians Imagine What Might Have Been','Scott Turow','Berkley Publishing Group','1993','175.00','10'),
('671870432','PLEADING GUILTY','David Cordingly','Audioworks','2000','250.00','15'),
('679425608','Under the Black Flag: The Romance and the Reality of Life Among the Pirates','Richard Bruce Wright','Random House','1996','175.00','10'),
('074322678','Where You will Find Me: And Other Stories','Ann Beattie','Scribner','2002','200.00','12');

SELECT * from book_table;

