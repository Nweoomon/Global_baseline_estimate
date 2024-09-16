-- Create Critics Table
CREATE TABLE Critics (
    CriticID INT AUTO_INCREMENT PRIMARY KEY,
    CriticName VARCHAR(100) NOT NULL
);

-- Create Movies Table
CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL
);

-- Create Ratings Table
CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    CriticID INT,
    MovieID INT,
    Rating INT,
    FOREIGN KEY (CriticID) REFERENCES Critics(CriticID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Insert unique critics
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Critics.csv'
INTO TABLE critics 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CriticName);

-- Insert unique movies
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Movies.csv'
INTO TABLE movies 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(MovieName);

-- Insert data into Ratings table
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\movie_ratings.csv'
INTO TABLE Ratings
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CriticID, MovieID, Rating);

-- Select all ratings with critic and movie names
SELECT Critics.CriticName, Movies.MovieName, Ratings.Rating
FROM Ratings
JOIN Critics ON Ratings.CriticID = Critics.CriticID
JOIN Movies ON Ratings.MovieID = Movies.MovieID;

