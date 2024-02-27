-- Change to correct database by replace 'TeamX' with actual database name
USE [TeamX];

ALTER INDEX [idx_Venue_Name] ON [DBO].[Venue] DISABLE;
ALTER INDEX [idx_Concert_Title] ON [DBO].[Concert] DISABLE;
ALTER INDEX [idx_Artist_LastName_FirstName] ON [DBO].[Artist] DISABLE;
ALTER INDEX [idx_Song_Title] ON [DBO].[Song] DISABLE;
ALTER INDEX [idx_Concert_Artist_ConcertId_ArtistId] ON [DBO].[Concert_Artist] DISABLE;
ALTER INDEX [idx_Concert_Song_ConcertId_SongId] ON [DBO].[Concert_Song] DISABLE;

SELECT
    v.[Name] AS [VenueName],
    c.[Title] AS [ConcertTitle],
    a.[LastName] AS [ArtistLastName],
    a.[FirstName] AS [ArtistFirstName],
    s.[Title] AS [SongTitle]
FROM
    [DBO].[Venue] v
    JOIN [DBO].[Concert] c
        ON v.[VenueId] = c.[VenueId]
    JOIN [DBO].[Concert_Artist] ca
        ON c.[ConcertId] = ca.[ConcertId]
    JOIN [DBO].[Artist] a
        ON ca.[ArtistId] = a.[ArtistId]
    JOIN [DBO].[Concert_Song] cs
        ON c.[ConcertId] = cs.[ConcertId]
    JOIN [DBO].[Song] s
        ON cs .[SongId] = s.[SongId]
WHERE
    c.Title LIKE 'M%'
ORDER BY
    c.Title;


ALTER INDEX [idx_Venue_Name] ON [DBO].[Venue] REBUILD;
ALTER INDEX [idx_Concert_Title] ON [DBO].[Concert] REBUILD;
ALTER INDEX [idx_Artist_LastName_FirstName] ON [DBO].[Artist] REBUILD;
ALTER INDEX [idx_Song_Title] ON [DBO].[Song] REBUILD;
ALTER INDEX [idx_Concert_Artist_ConcertId_ArtistId] ON [DBO].[Concert_Artist] REBUILD;
ALTER INDEX [idx_Concert_Song_ConcertId_SongId] ON [DBO].[Concert_Song] REBUILD;


SELECT
    v.[Name] AS [VenueName],
    c.[Title] AS [ConcertTitle],
    a.[LastName] AS [ArtistLastName],
    a.[FirstName] AS [ArtistFirstName],
    s.[Title] AS [SongTitle]
FROM
    [DBO].[Venue] v
    JOIN [DBO].[Concert] c
        ON v.[VenueId] = c.[VenueId]
    JOIN [DBO].[Concert_Artist] ca
        ON c.[ConcertId] = ca.[ConcertId]
    JOIN [DBO].[Artist] a
        ON ca.[ArtistId] = a.[ArtistId]
    JOIN [DBO].[Concert_Song] cs
        ON c.[ConcertId] = cs.[ConcertId]
    JOIN [DBO].[Song] s
        ON cs .[SongId] = s.[SongId]
WHERE
    c.Title LIKE 'M%'
ORDER BY
    c.Title;