
CREATE PROC dbo.LibraryManagementSystemProcedure dbo.LibraryDB
AS
CREATE DATABASE db_LibraryManagement

GO
	/* ======================= TABLES ========================*/
	/* Following part of the code will create various tables that exist in the to be made database*/


	CREATE TABLE table_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL,
	);

	CREATE TABLE table_book (
		book_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name1 FOREIGN KEY REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
	);

	CREATE TABLE table_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL,
	);

	SELECT * FROM table_library_branch

	CREATE TABLE table_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL,
	);

	SELECT * FROM table_borrower

	CREATE TABLE table_book_loans (
		book_loans_LoansID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_loans_BookID INT NOT NULL CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL CONSTRAINT fk_branch_id1 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL CONSTRAINT fk_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL,
	);

	SELECT * FROM table_book_loans
		/* Use GETDATE() to retrieve the date values for Date out. Use DATEADD for the DueDate*/
	 
	CREATE TABLE table_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_copies_BookID INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL,
	);

	SELECT * FROM table_book_copies

	CREATE TABLE table_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_authors_BookID INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_AuthorName VARCHAR(50) NOT NULL,
	);

	SELECT * FROM table_book_authors

/*With this I have completed creating all the tables*/
/*Next step includes filling the tables with records that shall show up in the database*/


/*==================== POPULATING TABLES ======================*/
	
	INSERT INTO table_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('Penguin books','201301 Gurugram Haryana India','+91-9876543210'),
		('S Chand Group','110055 Ravindra Nagar New Delhi','91-9876543211'),
		('Harper Collins','201307, Noida UP','91-9876543212'),
		('MacMillan Publishers','400059 Andheri','91-9876543213'),
		('Hachette Book Grouo','122009 Haryana India','91-9876543213'),
		('National Book Trust', '400025, Mumbai, India', '91-9876543215'), 		
		('Sheth publication house','LBS Marg, Mumbai, India','91-9876543214'),
		('Himalaya Publishing House,'Girgaon, Mumbai, India','91-9876543254'),
		('Invincible publishers','DaryaGanj','91-9876543221')
	;

	SELECT * FROM tabel_publisher

	INSERT INTO tabel_book
		(book_Title, book_PublisherName)
		VALUES 
		('Savarkar Echoes From A Forgottem Past', 'Penguin Books'),
		('It', 'S Chand Group'),
		('Sapiens', 'Harper Collins'),
		('Dune', 'Macmillan publications'),
		('The Hobbit', 'Hachette Books'),
		('Eragon', 'National Book Trust'),
		('A Wise Mans Fear', 'Sheth Publicatiom'),
		('Harry Potter and the Philosophers Stone', 'Himalaya Publishing House'),
		('Hard Boiled Wonderland and The End of the World', 'Invincible publishers')
		;

	SELECT * FROM tabel_book WHERE book_PublisherName = 'Penguin Books'

	INSERT INTO tabel_library_branch
		(library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		('Fort','400001, Mumbai, India'),
		('Vashi','400703, Navi Mumbai, India'),
		('Airoli','400708, Navi Mumbai, India'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');

	/*UPDATE tabel_library_branch
	SET library_branch_BranchName = 'Fort'
	WHERE library_branch_BranchID = 1;*/
	
	SELECT * FROM tabel_library_branch

	INSERT INTO tabel_borrower
		(borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		('Rohit Sharma','47, New towers, Vashi','91-9876543210'),
		('Ramesh Singh','New Bunglow, Bandra','91-9876543212'),
		('Tom John','Medows, Thane','91-9876543321'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	
	SELECT * FROM tabel_borrower

	INSERT INTO tabel_book_loans
		(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
		VALUES
		('1','1','100','1/1/18','2/2/18'),
		('2','1','100','1/1/18','2/2/18'),
		('3','1','100','1/1/18','2/2/18'),
		('4','1','100','1/1/18','2/2/18'),
		('5','1','102','1/3/18','2/3/18'),
		('6','1','102','1/3/18','2/3/18'),
		('7','1','102','1/3/18','2/3/18'),
		('8','1','102','1/3/18','2/3/18'),
		('9','1','102','1/3/18','2/3/18'),
		('11','1','102','1/3/18','2/3/18'),
		('12','2','105','12/12/17','1/12/18'),
		('10','2','105','12/12/17','1/12/17'),
		('20','2','105','2/3/18','3/3/18'),
		('18','2','105','1/5/18','2/5/18'),
		('19','2','105','1/5/18','2/5/18'),
		('19','2','100','1/3/18','2/3/18'),
		('11','2','106','1/7/18','2/7/18'),
		('1','2','106','1/7/18','2/7/18'),
		('2','2','100','1/7/18','2/7/18');

		
	SELECT * FROM tabel_book_loans

	INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5');

	SELECT * FROM tbl_book_copies
 

	INSERT INTO tabel_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','R K Narayan'),
		('2','Vikram Sampath'),
		('3','Noah Harari'),
		('4','Daniel Coyle'),
		('5','Bill Gates'),
		('6','Durjoy Datta'),
		('6','Osho'),
		('8','J.K. Rowling'),
		('9','Chetan Bhagat'),
		('10','Shashi Tharoor'),
		('11','Ram Madhav'),
		('12','RaghuRam Rajan');
	SELECT * FROM tabel_book_authors
END
	/*============================== We have populated all the tables with user input records ==============================*/

/* =================== STORED PROCEDURE QUERY QUESTIONS =================================== */

/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

CREATE PROC dbo.bookCopiesAtAllSharpstown 
(@bookTitle varchar(70) = 'The Lost Tribe', @branchName varchar(70) = 'Sharpstown')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title = @bookTitle AND branch.library_branch_BranchName = @branchName
GO
EXEC dbo.bookCopiesAtAllSharpstown 


/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

CREATE PROC dbo.bookCopiesAtAllBranches 
(@bookTitle varchar(70) = 'The Lost Tribe')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title = @bookTitle 
GO
EXEC dbo.bookCopiesAtAllBranches


/* #3- Retrieve the names of all borrowers who do not have any books checked out. */
		
CREATE PROC dbo.NoLoans
AS
SELECT borrower_BorrowerName FROM tbl_borrower
	WHERE NOT EXISTS
		(SELECT * FROM tbl_book_loans
		WHERE book_loans_CardNo = borrower_CardNo)
GO
EXEC dbo.NoLoans

/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */

CREATE PROC dbo.LoanersInfo 
(@DueDate date = NULL, @LibraryBranchName varchar(50) = 'Sharpstown')
AS
SET @DueDate = GETDATE()
SELECT Branch.library_branch_BranchName AS [Branch Name],  Book.book_Title [Book Name],
	   Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	   Loans.book_loans_DateOut AS [Date Out], Loans.book_loans_DueDate [Due Date]
	   FROM tbl_book_loans AS Loans
			INNER JOIN tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
		WHERE Loans.book_loans_DueDate = @DueDate AND Branch.library_branch_BranchName = @LibraryBranchName
GO
EXEC dbo.LoanersInfo 

/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

CREATE PROC dbo.TotalLoansPerBranch
AS
SELECT  Branch.library_branch_BranchName AS [Branch Name], COUNT (Loans.book_loans_BranchID) AS [Total Loans]
		FROM tbl_book_loans AS Loans
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
			GROUP BY library_branch_BranchName
GO
EXEC dbo.TotalLoansPerBranch

/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

CREATE PROC dbo.BooksLoanedOut
(@BooksCheckedOut INT = 5)
AS
	SELECT Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
		   COUNT(Borrower.borrower_BorrowerName) AS [Books Checked Out]
		   FROM tbl_book_loans AS Loans
		   			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
					GROUP BY Borrower.borrower_BorrowerName, Borrower.borrower_BorrowerAddress
		   HAVING COUNT(Borrower.borrower_BorrowerName) >= @BooksCheckedOut
GO
EXEC dbo.BooksLoanedOut



/* #7- For each book authored by "Vikram Sampath", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

CREATE PROC dbo.BookbyAuthorandBranch
	(@BranchName varchar(50) = 'Central', @AuthorName varchar(50) = 'Vikram Sampath')
AS
	SELECT Branch.library_branch_BranchName AS [Branch Name], Book.book_Title AS [Title], Copies.book_copies_No_Of_Copies AS [Number of Copies]
		   FROM tbl_book_authors AS Authors
				INNER JOIN tbl_book AS Book ON Authors.book_authors_BookID = Book.book_BookID
				INNER JOIN tbl_book_copies AS Copies ON Authors.book_authors_BookID = Copies.book_copies_BookID
				INNER JOIN tbl_library_branch AS Branch ON Copies.book_copies_BranchID = Branch.library_branch_BranchID
			WHERE Branch.library_branch_BranchName = @BranchName AND Authors.book_authors_AuthorName = @AuthorName
GO	
EXEC dbo.BookbyAuthorandBranch

/* ==================================== STORED PROCEDURE QUERY QUESTIONS =================================== */
