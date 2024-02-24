-- Change to correct database by replace 'TeamX' with actual database name
USE [TeamX];

-- 1. Get all artists without the primary key column, the calculated age of of each artist,
--    sorted by last name then by first name
SELECT
    a.[LastName],
    a.[FirstName],
    a.[BirthDate],
    DATEDIFF(YEAR, a.[BirthDate], GETDATE()) Age
FROM
    [DBO].[Artist] a
ORDER BY
    a.[LastName],
    a.[FirstName];

-- 2. Get all the concerts that the artists has held/paricipated in
SELECT
    a.[LastName],
    a.[FirstName],
    c.[Title]
FROM
    [DBO].[Artist] a
    JOIN [DBO].[Concert_Artist] ca
        ON a.[ArtistId] = ca.[ArtistId]
    JOIN [DBO].[Concert] c
        ON ca.[ConcertId] = c.[ConcertId]
ORDER BY
    a.[LastName],
    a.[FirstName],
    c.[Title];

-- 3. Get a report of the 10 latest concerts for a spesific concert venue (VenueId)
--    The report should display the name of the venue, the title of the consert and
--    the date (not time) of the concert ordered by the start time of the concerts
SELECT TOP 10
    v.[Name],
    c.[Title],
    CONVERT(DATE, c.[StartTime]) [ConsertDate]
FROM
    [DBO].[Venue] v
    JOIN [DBO].[Concert] c
        ON v.[VenueId] = c.[VenueId]
WHERE
    v.[VenueId] = 1
ORDER BY
    [ConsertDate];

-- 4. Get all songs for a spesific concert (ConcertId) sorted by the length of the songs.
--    In the report we want to display:
--      1. The title of the concert
--      2. The title of the song
--      3. The lenght of the song in minutes and seconds (Ex. '04:21')
SELECT
    c.[Title] [ConcertTile],
    s.[Title] [SongTitle],
    SUBSTRING(CONVERT(varchar, DATEADD(ms, cs.[LengthInSeconds] * 1000, 0), 108), 4, 100) LengthOfSong
FROM
    [DBO].[Concert_Song] cs
    JOIN [DBO].[Song] s
        ON cs.[SongId] = s.[SongId]
    JOIN [DBO].[Concert] c
        ON cs.[ConcertId] = c.[ConcertId]
WHERE
    cs.[ConcertId] = 2;


-- 5. Get all songs for any concert that are performed by at least two artists.
--    In the report we want to display:
--      1. The title of the concert
--      2. The title of the song
--      3. The number of artists that performed the song
SELECT
    c.[Title] [ConcertTile],
    s.[Title] [SongTitle],
    Count(*) NumberOfArtists
FROM
    [DBO].[Concert] c
        JOIN [DBO].[Concert_Song] cs
            ON c.[ConcertId] = cs.[ConcertId]
        JOIN [DBO].[Concert_Artist] ca
            ON c.[ConcertId] = ca.[ConcertId]
        JOIN [DBO].[Concert_Artist_Song] cas
            ON cs.[ConcertSongId] = cas.[ConcertSongId] AND
            ca.[ConcertArtistId] = cas.[ConcertArtistId]
        JOIN [DBO].[Song] s
            ON s.[SongId] = cs.[SongId]
GROUP BY
    c.[Title],
    s.[Title]
HAVING
    COUNT(*) > 1;