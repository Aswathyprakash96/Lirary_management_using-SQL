create database library;
use library;
create table branch(
 Branch_no int PRIMARY KEY,  
 Manager_Id  int,
 Branch_address  varchar(20),
 Contact_no int);
 create table employee(
 Emp_Id int PRIMARY KEY,  
 Emp_name  varchar(20),
 Position  varchar(20),
 Salary int,
 Branch_no int,foreign key(Branch_no) REFERENCES branch(Branch_no));
 create table books(
  ISBN int primary key,
 Book_title  varchar(20),
 Category  varchar(20),
 Rental_Price  int,
 status varchar(4) check (status in("yes","no")),
 Author  varchar(20),
Publisher varchar(20));
create table customer(
customer_id int primary key,
Customer_name  varchar(20),
Customer_address  varchar(20),
 Reg_date date);
 create table issue_status(
 Issue_Id int primary key,
 Issued_cust int,foreign key(Issued_cust) references customer(customer_id),
 Issue_date date,
 Isbn_book int,foreign key(Isbn_book) references books(ISBN));
 create table return_status(
 return_id int primary key,
 return_cust varchar(20),
 return_book_name varchar(20),
 return_date date,
 Isbn_book2 int,foreign key( Isbn_book2)references  books(ISBN));
 # performing insert commands for the above tables
 
 insert into branch values(1,101,"mg road,mannuthy",233457761);
 insert into branch values(2,102,"west road,thrissur",233457762);
 insert into branch values(3,103,"bypass road,korati",233457763);
 insert into branch values(4,104,"eastfort,ayathloe",233457761);
 insert into branch values(5,105,"west_side tcr",233457769);
 
insert into employee values(201,"akansha mathew","head_librarian",50000,1);
insert into employee values(202,"john henery","clerk",40000,2);
insert into employee values(203,"tomy mathew","assistant",30000,3);
insert into employee values(204,"tony guchi","manager",60000,4);
insert into employee values(205,"rahvul ravendra","assistant",25000,5);
   
insert into books values(978-0061120084,"herethere&everywhere","romance",25,"yes","sudha murthy","penguin_india");
insert into books values(978-0061120085,"books of life","fiction",15,"yes","krishnamurthi","penguin_india");
insert into books values(978-0061120083,"3 Mistake of life","fiction",10,"no","chetan","rupa publication");
insert into books values(978-0061120022,"discovry of india","historic",15,"yes","jawaharlal nehru","penguin_india");
insert into books values(978-0061120088,"book of woman","fiction",45,"no","osho","penguin_india");

insert into customer values(401,'John Smith', '123 Main St', '2024-01-15');
insert into customer values(402,'monica james', '356 st 124', '2024-03-15');
insert into customer values(403,'rachel mary', '425 main rd', '2024-06-05');
insert into customer values(404,'pheobe philip', 'rose st 234', '2024-07-01');
insert into customer values(405,'ross groover', '123 Main jn', '2024-01-25');

insert into issue_status values(501,401,"2024-07-03",978-0061120084);
insert into issue_status values(502,402,"2024-07-03",978-0061120085);
insert into issue_status values(503,403,"2024-07-03",978-0061120083);
insert into issue_status values(504,404,"2024-07-02",978-0061120022);
insert into issue_status values(505,405,"2024-07-01",978-0061120088);
insert into issue_status values(506,404,"2023-06-01",978-0061120088);
select * from issue_status;
# 1)  Retrieve the book title, category, and rental price of all available books. 
select  Book_title, Rental_Price, Category from books;

# 2) List the employee names and their respective salaries in descending order of salary. 
select Emp_name,Salary from employee order by Salary desc;

#3) Retrieve the book titles and the corresponding customers who have issued those books. 
select b.Book_title,c.Customer_name from  customer c join issue_status i ON c.Customer_Id = i.Issued_cust JOIN books b ON i.Isbn_book = b.ISBN;

#4). Display the total count of books in each category. 
select  Category, count(*) as Totl_Count_Books from books group by Category;

# 5)Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.  
select Emp_name,Position from employee where Salary>=50000;

#6)List the customer names who registered before 2022-01-01 and have not issued any books yet.
select c.Customer_name,c.Reg_date from customer c join  issue_status i ON c.Customer_Id = i.Issued_cust where reg_date="2022-01-01" and Issued_cust is null;

#7)Display the branch numbers and the total count of employees in each branch. 
select Branch_no,count(*) as total_employees from employee group by Branch_no;

# 8)Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name from customer WHERE Customer_Id IN ( SELECT Issued_cust from issue_status  WHERE YEAR(Issue_date) = 2023 AND MONTH(Issue_date))= 6;

# 9)9. Retrieve book_title from book table containing history.
select Book_title from books where Category="historic";

#10)10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_no, count(*) from employee group by branch_no having count(*)>5;

#11)1. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name ,b.Branch_address FROM employee e JOIN Branch b ON e.Branch_no = b.Branch_no WHERE e.Position = 'Manager';

#12)  Display the names of customers who have issued books with a rental price higher than Rs. 25.
select c.Customer_name from customer c inner join issue_status i on c.Customer_id =i.Issued_cust inner join books b on i.Isbn_book=b.Isbn
where  b.Rental_Price >25;



 




    

   

 





 
 