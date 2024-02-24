-- Change to correct database by replace 'TeamX' with actual database name
USE [TeamX];

-- Delete any existing data
-- ========================
-- Concert_Artist_Song
DELETE FROM [DBO].[Concert_Artist_Song];

-- Concert_Song
DELETE FROM [DBO].[Concert_song];

-- Concert_Artist
DELETE FROM [DBO].[Concert_Artist];

-- Song
DELETE FROM [DBO].[Song];

-- Artist
DELETE FROM [DBO].[Artist];

-- Concert
DELETE FROM [DBO].[Concert];

-- Venue
DELETE FROM [DBO].[Venue];
-- ========================

-- Insert test data
-- ========================

-- Venue
INSERT INTO [DBO].[Venue]
([VenueId], [Name]) VALUES
(1, 'Madison Square Garden'),
(2, 'Red Rocks Amphitheatre'),
(3, 'Hollywood Bowl'),
(4, 'Sydney Opera House'),
(5, 'The O2 Arena'),
(6, 'Wembley Stadium'),
(7, 'Tokyo Dome'),
(8, 'Berlin Philharmonie'),
(9, 'Elbphilharmonie Hamburg'),
(10, 'Royal Albert Hall');

-- Consert
INSERT INTO [DBO].[Concert]
(ConcertId, Title, Description, StartTime, EndTime, VenueId) VALUES
(1, 'The Rock Night', 'Best of Rock and Roll', '2024-03-01 19:00:00', '2024-03-01 23:00:00', 1),
(2, 'Classical Evening', 'Soothing Classical Music', '2024-03-05 18:00:00', '2024-03-05 21:00:00', 4),
(3, 'Jazz Fest', 'Smooth Jazz and Blues', '2024-04-10 20:00:00', '2024-04-10 23:30:00', 3),
(4, 'Pop Extravaganza', 'Greatest Pop Hits', '2024-05-15 20:00:00', '2024-05-15 23:00:00', 5),
(5, 'Indie Night', 'Independent Music Artists', '2024-06-20 19:00:00', '2024-06-20 22:00:00', 2),
(6, 'Metal Mayhem', 'Heavy Metal Bands', '2024-07-25 19:00:00', '2024-07-25 23:30:00', 6),
(7, 'Country Roads', 'Country Music Evening', '2024-08-30 18:00:00', '2024-08-30 21:00:00', 7),
(8, 'Electronic Waves', 'Electronic and Dance Music', '2024-09-10 20:00:00', '2024-09-10 23:45:00', 8),
(9, 'Reggae Rhythms', 'Reggae Music Night', '2024-10-05 19:30:00', '2024-10-05 22:30:00', 9),
(10, 'Hip Hop Beats', 'Hip Hop and Rap Artists', '2024-11-15 20:00:00', '2024-11-15 23:00:00', 10);

-- Artist
INSERT INTO [DBO].[Artist]
(ArtistId, FirstName, LastName, BirthDate) VALUES
(1, 'John', 'Doe', '1980-01-01'),
(2, 'Jane', 'Smith', '1985-02-02'),
(3, 'Jim', 'Brown', '1990-03-03'),
(4, 'Jill', 'Davis', '1995-04-04'),
(5, 'Jack', 'Wilson', '1975-05-05'),
(6, 'Jessica', 'Taylor', '1982-06-06'),
(7, 'Jeremy', 'Anderson', '1987-07-07'),
(8, 'Julia', 'Roberts', '1979-08-08'),
(9, 'Jake', 'Gyllenhaal', '1988-09-09'),
(10, 'Jasmine', 'Thompson', '1991-10-10');

-- Song
INSERT INTO [DBO].[Song]
(SongId, Title) VALUES
(1, 'Summer of 69'),
(2, 'Billie Jean'),
(3, 'Bohemian Rhapsody'),
(4, 'Stairway to Heaven'),
(5, 'Hotel California'),
(6, 'Sweet Child O Mine'),
(7, 'Smells Like Teen Spirit'),
(8, 'Imagine'),
(9, 'Shake It Off'),
(10, 'Shape of You');

--Concert_Artist
INSERT INTO [DBO].[Concert_Artist]
(ConcertArtistId, ConcertId, ArtistId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 10, 1);

-- Concert_Song
INSERT INTO [DBO].[Concert_Song]
(ConcertSongId, ConcertId, SongId, LengthInSeconds) VALUES
(1, 1, 1, 300),
(2, 2, 2, 250),
(3, 3, 3, 360),
(4, 4, 4, 480),
(5, 5, 5, 390),
(6, 6, 6, 320),
(7, 7, 7, 300),
(8, 8, 8, 270),
(9, 9, 9, 230),
(10, 10, 10, 263);

-- Concert_Artist_Song
INSERT INTO [DBO].[Concert_Artist_Song]
(ConcertArtistSongId, ConcertArtistId, ConcertSongId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 10);