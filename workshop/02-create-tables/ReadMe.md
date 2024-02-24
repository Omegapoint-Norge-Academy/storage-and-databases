# Part 2: Create tables and queries

## Connect to your team's database

1. Ask the course instructor for a connection string to the Azure database you are going to work with
2. Start the "Azure Data Studio" and log on to the database using the provided connections string:
   1. Select "New -> New connection"
   2. Select "Connection type": "Microsoft SQL Server"
   3. Select "Input type": "Connection String"
   4. Insert the connection string into the "Connection string" text box
   5. Leave the other fields with the default values

## Create SQL scripts to create the different entities and the relations between them

The following tables and columns should be created

Venue:

- VenueId (Integer - Primary key)
- Name (Varchar - Length: 255)

Concert:

- ConcertId (Integer - Primary key)
- Title (Varvhar - Length: 255)
- Description (Varchar - length: 4096 )
- StartTime (DateTime)
- EndTime (DateTime)
- VenueId (Integer - Foreign key)

Artist:

- ArtistId (Integer - Primary key)
- FirstName (Varchar - Length: 255)
- LastName (Varchar - Length: 255)

Song:

- SongId (Integer - Primary key)
- Title (Varchar - Length: 255)

Concert_Artist (link-table):

- ConcertArtistId (Integer - Primary key)
- ConcertId (Integer - Foreign key)
- ArtistId (Integer - Foreign key)

Concert_Song (link-table):

- ConcertSongId (Integer - Primary key)
- ConcertId (Integer - Foreign key)
- SongId (Integer - Foreign key)
- LengthInSeconds (SmallInt) - Length of the song performance in seconds in the concert

Concert_Artist_Song (link-table):

- ConcertArtistSongId (Integer - Primary key)
- ConcertArtistId (Integer - Foreign key)
- ConcertSongId (Integer - Foreign key)