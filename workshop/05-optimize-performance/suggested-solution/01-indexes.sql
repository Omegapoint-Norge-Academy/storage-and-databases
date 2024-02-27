-- Change to correct database by replace 'TeamX' with actual database name
USE [TeamX];

-- Venue table
DROP INDEX IF EXISTS [idx_Venue_Name] ON [DBO].[Venue];
CREATE INDEX [idx_Venue_Name] ON [DBO].[Venue] ([Name]);

-- Concert table
DROP INDEX IF EXISTS [idx_Concert_Title] ON [DBO].[Concert];
CREATE INDEX [idx_Concert_Title] ON [DBO].[Concert] ([Title]);

-- Artist table
DROP INDEX IF EXISTS [idx_Artist_LastName_FirstName] ON [DBO].[Artist];
CREATE INDEX [idx_Artist_LastName_FirstName] ON [DBO].[Artist] ([LastName], [FirstName]);

-- Song table
DROP INDEX IF EXISTS [idx_Song_Title] ON [DBO].[Song];
CREATE INDEX [idx_Song_Title] ON [DBO].[Song] ([Title]);

-- Concert_Artist table
DROP INDEX IF EXISTS [idx_Concert_Artist_ConcertId_ArtistId] ON [DBO].[Concert_Artist];
CREATE INDEX [idx_Concert_Artist_ConcertId_ArtistId] ON [DBO].[Concert_Artist] ([ConcertId],[ArtistId]);

-- Concert_Song table
DROP INDEX IF EXISTS [idx_Concert_Song_ConcertId_SongId] ON [DBO].[Concert_Song];
CREATE INDEX [idx_Concert_Song_ConcertId_SongId] ON [DBO].[Concert_Song] ([ConcertId],[SongId]);