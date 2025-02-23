drop table if exists Items;
drop table if exists EbayUsers;
drop table if exists Bids;
drop table if exists Categories;

    ItemID INTEGER NOT NULL PRIMARY KEY,
    UserID CHAR(300) NOT NULL,
    Name CHAR(300) NOT NULL,
    Description TEXT NOT NULL,
    Started TIMESTAMP NOT NULL,
    Ends TIMESTAMP NOT NULL,
    Currently DECIMAL NOT NULL,
    Number_of_Bids INTEGER NOT NULL,
    First_Bid DECIMAL NOT NULL,
    Buy_Price DECIMAL,
    FOREIGN KEY (UserID) REFERENCES Person(UserID)
    );
create table Person(
    UserID CHAR(300) PRIMARY KEY,
    Rating INTEGER NOT NULL,
    Location CHAR(300),
    Country CHAR(300)
    );
create table Category(
    ItemID INTEGER NOT NULL,
    Category_Name CHAR(300) NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    PRIMARY KEY(ItemID, Category_Name)
    );
create table Bids(
    ItemID INTEGER NOT NULL,
    UserID CHAR(300) NOT NULL,
    Time TIMESTAMP NOT NULL,
    Amount DECIMAL NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (UserID) REFERENCES Person(UserID),
    PRIMARY KEY(ItemID, UserID, Amount)
    );

