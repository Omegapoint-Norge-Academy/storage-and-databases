-- Change to correct database by replace 'TeamX' with actual database name
USE [TeamX];

-- Delete any existing table
DROP TABLE IF EXISTS [DBO].[Concert_Artist_Song];
DROP TABLE IF EXISTS [DBO].[Concert_Song];
DROP TABLE IF EXISTS [DBO].[Concert_Artist];
DROP TABLE IF EXISTS [DBO].[Concert];
DROP TABLE IF EXISTS [DBO].[Artist];
DROP TABLE IF EXISTS [DBO].[Song];
DROP TABLE IF EXISTS [DBO].[Venue];

-- Venue table
CREATE TABLE [DBO].[Venue] (
    [VenueId] INTEGER NOT NULL,
    [Name] VARCHAR(255) NOT NULL,
    PRIMARY KEY ([VenueId])
);

-- Concert table
CREATE TABLE [DBO].[Concert] (
    [ConcertId] INTEGER NOT NULL,
    [Title] VARCHAR(255) NOT NULL,
    [Description] VARCHAR(4196) NULL,
    [StartTime] DATETIME2 NOT NULL,
    [EndTime] DATETIME2 NOT NULL,
    [VenueId] INTEGER NOT NULL,
    PRIMARY KEY ([ConcertId]),
    CONSTRAINT FK_ConcertVenue FOREIGN KEY ([VenueId]) REFERENCES [DBO].[Venue]([VenueId])
);

-- Artist table
CREATE TABLE [DBO].[Artist] (
    [ArtistId] INTEGER NOT NULL,
    [FirstName] VARCHAR(255) NOT NULL,
    [LastName] VARCHAR (255) NOT NULL,
    [BirthDate] DATE NOT NULL,
    PRIMARY KEY ([ArtistId])
);

-- Song table
CREATE TABLE [DBO].[Song] (
    [SongId] INTEGER NOT NULL,
    [Title] VARCHAR(255) NOT NULL,
    PRIMARY KEY([SongId])
);

-- Concert_Artist table: This table keeps track of
-- what artists that performs at what concert
CREATE TABLE [DBO].[Concert_Artist] (
    [ConcertArtistId] INTEGER NOT NULL,
    [ConcertId] INTEGER NOT NULL,
    [ArtistId] INTEGER NOT NULL,
    PRIMARY KEY([ConcertArtistId]),
    CONSTRAINT FK_ConcertArtist_Concert FOREIGN KEY ([ConcertId]) REFERENCES [DBO].[Concert]([ConcertId]),
    CONSTRAINT FK_ConcertArtist_Artist FOREIGN KEY ([ArtistId]) REFERENCES [DBO].[Artist]([ArtistId])
);

-- Concert_Song table: This table keeps track of
-- what songs that was performs at what concert
CREATE TABLE [DBO].[Concert_Song] (
    [ConcertSongId] INTEGER NOT NULL,
    [ConcertId] INTEGER NOT NULL,
    [SongId] INTEGER NOT NULL,
    [LengthInSeconds] SMALLINT,
    PRIMARY KEY ([ConcertSongId]),
    CONSTRAINT FK_ConcertSong_Concert FOREIGN KEY ([ConcertId]) REFERENCES [DBO].[Concert]([ConcertId]),
    CONSTRAINT FK_ConcertSong_Song FOREIGN KEY ([SongId]) REFERENCES [DBO].[Song]([SongId])
);

-- Concert_Song table: This table keeps track of
-- what songs that was performed by what artist(s)
-- at what concert
CREATE TABLE [DBO].[Concert_Artist_Song] (
    [ConcertArtistSongId] INTEGER NOT NULL,
    [ConcertArtistId] INTEGER NOT NULL,
    [ConcertSongId] INTEGER NOT NULL,
    PRIMARY KEY ([ConcertArtistSongId]),
    CONSTRAINT FK_ConcertArtistSong_ConcertArtist FOREIGN KEY([ConcertArtistId]) REFERENCES [DBO].[Concert_Artist]([ConcertArtistId]),
    CONSTRAINT FK_ConcertArtistSong_ConcertSong FOREIGN KEY ([ConcertSongId]) REFERENCES [DBO].[Concert_Song]([ConcertSongId])
);