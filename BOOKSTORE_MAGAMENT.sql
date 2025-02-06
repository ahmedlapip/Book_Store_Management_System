
CREATE TABLE AUTHOR (Author_ID integer(4) PRIMARY KEY, 
	F_Name VARCHAR2(20), 
	M_Name VARCHAR2(20), 
	L_Name VARCHAR2(20), 
	Nationality VARCHAR2(20));

CREATE TABLE PUBLISHER (Pub_ID NUMBER(4) PRIMARY KEY, 
	Name VARCHAR2(20), 
	Address VARCHAR2(50), 
	Email VARCHAR2(30));

CREATE TABLE BOOK (ISBN NUMBER(13) PRIMARY KEY, 
	Title VARCHAR2(20), 
	Author_ID NUMBER(4), CONSTRAINT FK_AUTH_ID FOREIGN KEY (Author_ID) REFERENCES AUTHOR(Author_ID),
	Pub_ID NUMBER(4), CONSTRAINT FK_PUB_ID FOREIGN KEY (Pub_ID) REFERENCES PUBLISHER(Pub_ID),
	Stock NUMBER(4), 
	Price NUMBER(4));

CREATE TABLE BOOKS_GENRE (ISBN NUMBER(13), CONSTRAINT FK_ISBN FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN), 
	GENRE VARCHAR2(20), 
	PRIMARY KEY (ISBN, GENRE));

CREATE TABLE PUBLISHER_PHONE (Pub_ID NUMBER(4), CONSTRAINT FK_PUB_ID2 FOREIGN KEY (Pub_ID) REFERENCES PUBLISHER(Pub_ID), 
	Phone VARCHAR2(13), 
	PRIMARY KEY (Pub_ID, Phone));

CREATE TABLE SUPPLIER (Sup_ID NUMBER(4) NOT NULL UNIQUE, 
	Pub_ID NUMBER(4), CONSTRAINT FK_PUB_ID3 FOREIGN KEY (Pub_ID) REFERENCES PUBLISHER(Pub_ID), 
	Name VARCHAR2(20), 
	Email VARCHAR2(30),
	Phone VARCHAR2(13), 
	Address VARCHAR2(50), 
	PRIMARY KEY (Pub_ID, Sup_ID));

CREATE TABLE INVENTORY (Inv_ID NUMBER(4) PRIMARY KEY, 
	Sup_ID NUMBER(4), CONSTRAINT FK_SUP_ID FOREIGN KEY (Sup_ID) REFERENCES SUPPLIER(Sup_ID),
	ISBN NUMBER(13), CONSTRAINT FK_ISBN2 FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
	Stock_date DATE, 
	Quantity NUMBER(3));

CREATE TABLE CUSTOMER (Cus_ID NUMBER(4) PRIMARY KEY, 
  	F_Name VARCHAR2(20),
 	L_Name VARCHAR2(20),
 	Email VARCHAR2(30),
 	Phone VARCHAR2(13),
  	Address VARCHAR2(50));

CREATE TABLE ORDERS (Order_ID NUMBER(4) PRIMARY KEY, 
  	Cus_ID NUMBER(4), CONSTRAINT FK_CUS_ID FOREIGN KEY (Cus_ID) REFERENCES CUSTOMER(Cus_ID),
  	Payment_way VARCHAR2(20),
  	Order_date DATE);

CREATE TABLE ORDER_DETAILS (Order_ID NUMBER(4), CONSTRAINT FK_ORDER_ID FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID),
  	ISBN NUMBER(13), CONSTRAINT FK_ISBN3 FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
  	Sub_price NUMBER(5),
  	Quantity NUMBER(4));

CREATE TABLE DELIVERY (SSN NUMBER(14) PRIMARY KEY,
  	Name VARCHAR2(20),
  	Phone VARCHAR2(13),
  	Salary NUMBER(5),
  	Order_no NUMBER(4), 
  	Delivery_fee NUMBER(5));

CREATE TABLE DELIVERY_TRIPS (Order_ID NUMBER(4), CONSTRAINT FK_ORDER_ID2 FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID),
  	Cus_ID NUMBER(4), CONSTRAINT FK_CUS_ID2 FOREIGN KEY (Cus_ID) REFERENCES CUSTOMER(Cus_ID),
  	D_SSN NUMBER(14), CONSTRAINT FK_D_SSN FOREIGN KEY (D_SSN) REFERENCES DELIVERY(SSN));

create sequence id_seq start with 1001 increment by 1 maxvalue 1999;
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'John', 'A.', 'Smith', 'American');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Emily', 'J.', 'Clark', 'British');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Ahmed', 'H.', 'Khan', 'Pakistani');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Wei', 'N.', 'Li', 'Chinese');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Maria', 'G.', 'Garcia', 'Spanish');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Ivan', 'P.', 'Petrov', 'Russian');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Hiroshi', 'T.', 'Tanaka', 'Japanese');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Fatima', 'A.', 'Ali', 'Egyptian');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Chloe', 'Martin', 'Peterson', 'French');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Oliver', 'B.', 'Taylor', 'Canadian');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Sophia', 'C.', 'Johnson', 'Australian');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Raj', 'K.', 'Mehta', 'Indian');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Liam', 'George', 'Brown', 'Irish');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Aisha', 'N.', 'Ahmed', 'Moroccan');
INSERT INTO AUTHOR VALUES (id_seq.nextval, 'Carlos', 'E.', 'Santos', 'Brazilian');
drop sequence id_seq;

create sequence id_seq start with 2001 increment by 1 maxvalue 2999;
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Penguin House', '1234 Main St, NY', 'contact@prh.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'HarperCollins', '5678 Oak Ave, CA', 'info@harpercollins.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Macmillan Publishers', '910 Pine Blvd, TX', 'support@macmillan.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Simon & Schuster', '111 Maple Rd, IL', 'sales@simonschuster.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Hachette Livre', '222 Birch Ln, PA', 'contact@hachette.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Scholastic', '333 Cedar Ct, FL', 'info@scholastic.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Bloomsbury', '444 Elm Dr, WA', 'support@bloomsbury.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Oxford University', '555 Pine Ave, MA', 'contact@oup.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Cambridge University', '666 Walnut St, NJ', 'info@cambridge.org');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Springer', '777 Spruce Ln, OH', 'sales@springer.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Elsevier', '888 Fir Blvd, MI', 'support@elsevier.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Taylor & Francis', '999 Ash St, GA', 'info@taylorandfrancis.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Wiley', '100 Maple Grove, CO', 'contact@wiley.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Thomson Reuters', '200 Pine Crest, AZ', 'info@thomsonreuters.com');
INSERT INTO PUBLISHER VALUES (id_seq.nextval, 'Pearson', '300 Willow Rd, NV', 'support@pearson.com');
drop sequence id_seq;

create sequence author_id_seq start with 1001 increment by 1 maxvalue 1999;
create sequence pub_id_seq start with 2001 increment by 1 maxvalue 2999;
INSERT INTO BOOK VALUES (9781234567890, 'The Great Novel', author_id_seq.nextval, pub_id_seq.nextval, 50, 25);
INSERT INTO BOOK VALUES (9789876543210, 'Learning SQL', author_id_seq.nextval, pub_id_seq.nextval, 30, 20);
INSERT INTO BOOK VALUES (9781122334455, 'History of China', author_id_seq.nextval, pub_id_seq.nextval, 20, 30);
INSERT INTO BOOK VALUES (9782233445566, 'Mastering Python', author_id_seq.nextval, pub_id_seq.nextval, 40, 35);
INSERT INTO BOOK VALUES (9783344556677, 'Cooking Basics', author_id_seq.nextval, pub_id_seq.nextval, 35, 15);
INSERT INTO BOOK VALUES (9784455667788, 'World War II', author_id_seq.nextval, pub_id_seq.nextval, 25, 45);
INSERT INTO BOOK VALUES (9785566778899, 'Digital Marketing', author_id_seq.nextval, pub_id_seq.nextval, 60, 25);
INSERT INTO BOOK VALUES (9786677889900, 'Astronomy 101', author_id_seq.nextval, pub_id_seq.nextval, 10, 50);
INSERT INTO BOOK VALUES (9787788990011, 'Modern Art', author_id_seq.nextval, pub_id_seq.nextval, 20, 40);
INSERT INTO BOOK VALUES (9788899001122, 'Economics Explained', author_id_seq.nextval, pub_id_seq.nextval, 15, 30);
INSERT INTO BOOK VALUES (9789900112233, 'Shakespeare Poems', author_id_seq.nextval, pub_id_seq.nextval, 12, 20);
INSERT INTO BOOK VALUES (9780011223344, 'Medical Science', author_id_seq.nextval, pub_id_seq.nextval, 25, 60);
INSERT INTO BOOK VALUES (9781122334456, 'Philosophy Basics', author_id_seq.nextval, pub_id_seq.nextval, 30, 22);
INSERT INTO BOOK VALUES (9782233445567, 'Advanced Math', author_id_seq.nextval, pub_id_seq.nextval, 50, 40);
INSERT INTO BOOK VALUES (9783344556678, 'Space Exploration', author_id_seq.nextval, pub_id_seq.nextval, 40, 45);
drop sequence author_id_seq;
drop sequence pub_id_seq;

INSERT INTO BOOKS_GENRE VALUES (9781234567890, 'Fiction');
INSERT INTO BOOKS_GENRE VALUES (9789876543210, 'Education');
INSERT INTO BOOKS_GENRE VALUES (9781122334455, 'History');
INSERT INTO BOOKS_GENRE VALUES (9782233445566, 'Technology');
INSERT INTO BOOKS_GENRE VALUES (9783344556677, 'Cooking');
INSERT INTO BOOKS_GENRE VALUES (9784455667788, 'History');
INSERT INTO BOOKS_GENRE VALUES (9785566778899, 'Business');
INSERT INTO BOOKS_GENRE VALUES (9786677889900, 'Science');
INSERT INTO BOOKS_GENRE VALUES (9787788990011, 'Art');
INSERT INTO BOOKS_GENRE VALUES (9788899001122, 'Economics');
INSERT INTO BOOKS_GENRE VALUES (9789900112233, 'Literature');
INSERT INTO BOOKS_GENRE VALUES (9780011223344, 'Medicine');
INSERT INTO BOOKS_GENRE VALUES (9781122334456, 'Philosophy');
INSERT INTO BOOKS_GENRE VALUES (9782233445567, 'Mathematics');
INSERT INTO BOOKS_GENRE VALUES (9783344556678, 'Science');

create sequence id_seq start with 2001 increment by 1 maxvalue 2999;
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '123-456-7890');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '987-654-3210');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '456-789-1234');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '123-555-7890');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '987-555-3210');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '456-555-1234');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '123-666-7890');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '987-666-3210');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '456-666-1234');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '123-777-7890');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '987-777-3210');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '456-777-1234');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '123-888-7890');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '987-888-3210');
INSERT INTO PUBLISHER_PHONE VALUES (id_seq.nextval, '456-888-1234');
drop sequence id_seq;

create sequence pub_id_seq start with 2001 increment by 1 maxvalue 2999;
create sequence sup_id_seq start with 3001 increment by 1 maxvalue 3999;
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Global Books', 'global@books.com', '321-654-9870', '221B Baker St, London');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Edu Supplies', 'edu@supplies.com', '654-987-3210', '742 Evergreen Terrace, Springfield');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Asia Books', 'asia@books.com', '987-321-6540', '1600 Pennsylvania Ave, Washington');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Book World', 'contact@bookworld.com', '123-321-4567', '101 Fiction Ln, Dallas');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Elite Books', 'info@elitebooks.com', '789-123-4567', '202 Novel St, Seattle');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Readers Hub', 'support@readershub.com', '456-789-1234', '303 Page Rd,');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Book Haven', 'bookhaven@supplies.com', '678-890-1234', '404 Novel Way, Boston');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Knowledge Depot', 'knowledge@depot.com', '789-456-7890', '505 Learning Ave, Austin');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Infinite Pages', 'pages@infinite.com', '890-567-8901', '606 Book Blvd, Chicago');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Academic Books', 'academic@books.com', '901-678-9012', '707 Study Lane, Denver');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Novelty Supplies', 'novelty@supplies.com', '012-789-0123', '808 Fiction Drive, Miami');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Creative Minds', 'creative@minds.com', '123-890-1234', '909 Imagination St, San Francisco');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Publisher Direct', 'direct@publisher.com', '234-901-2345', '1010 Direct Way, Houston');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Reading Hub', 'reading@hub.com', '345-012-3456', '1111 Reading Road, Orlando');
INSERT INTO SUPPLIER VALUES (sup_id_seq.nextval, pub_id_seq.nextval, 'Book Sphere', 'sphere@books.com', '456-123-4567', '1212 Knowledge Circle, Phoenix');
drop sequence pub_id_seq;
drop sequence sup_id_seq;

create sequence sup_id_seq start with 3001 increment by 1 maxvalue 3999;
create sequence inv_id_seq start with 4001 increment by 1 maxvalue 4999;
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9781234567890, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 50);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9789876543210, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 30);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9781122334455, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 20);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9782233445566, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 40);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9783344556677, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 35);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9784455667788, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 25);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9785566778899, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 60);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9786677889900, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 10);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9787788990011, TO_DATE('2023-09-05', 'YYYY-MM-DD'), 20);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9788899001122, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 15);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9789900112233, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 12);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9780011223344, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 25);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9781122334456, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 30);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9782233445567, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 50);
INSERT INTO INVENTORY VALUES (inv_id_seq.nextval, sup_id_seq.nextval, 9783344556678, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 40);
drop sequence sup_id_seq;
drop sequence inv_id_seq;

create sequence id_seq start with 5001 increment by 1 maxvalue 5999;
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak Ave');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '789 Pine Blvd');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Bob', 'Brown', 'bob.brown@example.com', '555-4321', '321 Cedar Ln');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Charlie', 'Davis', 'charlie.davis@example.com', '555-6543', '654 Walnut Rd');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Daisy', 'Evans', 'daisy.evans@example.com', '555-9876', '987 Birch Ct');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Ethan', 'Garcia', 'ethan.garcia@example.com', '555-3456', '345 Spruce Dr');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Fiona', 'Harris', 'fiona.harris@example.com', '555-6789', '678 Willow Way');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'George', 'Clark', 'george.clark@example.com', '555-8760', '876 Maple St');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Hannah', 'Lopez', 'hannah.lopez@example.com', '555-4329', '432 Fir Ave');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Isla', 'Martinez', 'isla.martinez@example.com', '555-1239', '123 Cedar Grove');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Jack', 'Wilson', 'jack.wilson@example.com', '555-4567', '456 Pine Valley');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Kara', 'Taylor', 'kara.taylor@example.com', '555-7890', '789 Oak Ridge');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Leo', 'Moore', 'leo.moore@example.com', '555-6780', '678 Birch Lane');
INSERT INTO CUSTOMER VALUES (id_seq.nextval, 'Mia', 'White', 'mia.white@example.com', '555-2345', '234 Spruce Terrace');
drop sequence id_seq;

create sequence cus_id_seq start with 5001 increment by 1 maxvalue 5999;
create sequence order_id_seq start with 6001 increment by 1 maxvalue 6999;
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'PayPal', TO_DATE('2023-02-02', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Cash', TO_DATE('2023-03-03', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-04-04', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-05-05', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-06-06', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'PayPal', TO_DATE('2023-07-07', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Cash', TO_DATE('2023-08-08', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-09-09', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2023-11-11', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'PayPal', TO_DATE('2023-12-12', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Cash', TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2024-02-14', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 'Credit Card', TO_DATE('2024-03-15', 'YYYY-MM-DD'));
drop sequence cus_id_seq;
drop sequence order_id_seq;

create sequence order_id_seq start with 6001 increment by 1 maxvalue 6999;
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9781234567890, 50, 2);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9789876543210, 20, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9781122334455, 90, 3);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9782233445566, 35, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9783344556677, 75, 5);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9784455667788, 90, 2);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9785566778899, 100, 4);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9786677889900, 50, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9787788990011, 80, 2);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9788899001122, 30, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9789900112233, 60, 3);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9780011223344, 60, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9781122334456, 44, 2);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9782233445567, 40, 1);
INSERT INTO ORDER_DETAILS VALUES (order_id_seq.nextval, 9783344556678, 45, 1);
drop sequence order_id_seq;

INSERT INTO DELIVERY VALUES (46170928347295, 'Michael Scott', '259-555-1111', 5000, 1, 5);
INSERT INTO DELIVERY VALUES (35792018306457, 'Dwight Schrute', '259-555-2222', 4800, 1, 4);
INSERT INTO DELIVERY VALUES (58210394857631, 'Jim Halpert', '259-555-3333', 4700, 1, 3);
INSERT INTO DELIVERY VALUES (73485019102985, 'Pam Beesly', '259-555-4444', 4600, 1, 0);
INSERT INTO DELIVERY VALUES (28465730109123, 'Stanley Hudson', '259-555-5555', 4500, 1, 4);
INSERT INTO DELIVERY VALUES (19583642078046, 'Phyllis Vance', '259-555-6666', 4400, 1, 5);
INSERT INTO DELIVERY VALUES (80934157268350, 'Angela Martin', '259-555-7777', 4300, 1, 3);
INSERT INTO DELIVERY VALUES (67301458273691, 'Oscar Martinez', '259-555-8888', 4200, 1, 4);
INSERT INTO DELIVERY VALUES (54029173641972, 'Kevin Malone', '259-555-9999', 4100, 1, 0);
INSERT INTO DELIVERY VALUES (38195602834012, 'Creed Bratton', '259-555-1010', 4000, 1, 5);
INSERT INTO DELIVERY VALUES (92547368120514, 'Meredith Palmer', '259-555-1112', 3900, 1, 6);
INSERT INTO DELIVERY VALUES (82710963459127, 'Ryan Howard', '259-555-1213', 3800, 1, 4);
INSERT INTO DELIVERY VALUES (56093418762483, 'Kelly Kapoor', '259-555-1314', 3700, 1, 3);
INSERT INTO DELIVERY VALUES (14967230571948, 'Toby Flenderson', '259-555-1415', 3600, 1, 5);
INSERT INTO DELIVERY VALUES (76423805106892, 'Andy Bernard', '259-555-1516', 3500, 1, 4);

create sequence cus_id_seq start with 5001 increment by 1 maxvalue 5999;
create sequence order_id_seq start with 6001 increment by 1 maxvalue 6999;
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 46170928347295);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 35792018306457);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 58210394857631);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 73485019102985);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 28465730109123);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 19583642078046);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 80934157268350);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 67301458273691);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 54029173641972);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 38195602834012);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 92547368120514);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 82710963459127);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 56093418762483);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 14967230571948);
INSERT INTO DELIVERY_TRIPS VALUES (order_id_seq.nextval, cus_id_seq.nextval, 76423805106892);
drop sequence cus_id_seq;
drop sequence order_id_seq;

