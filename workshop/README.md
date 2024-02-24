# Workshop information

- [Workshop information](#workshop-information)
  - [Prerequisite](#prerequisite)
  - [Intro](#intro)
  - [Workshop parts](#workshop-parts)
  - [For the course instructor](#for-the-course-instructor)
    - [Workshop setup](#workshop-setup)
    - [Slack](#slack)

## Prerequisite

- Azure Data Studio: https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?tabs=win-install%2Cwin-user-install%2Credhat-install%2Cwindows-uninstall%2Credhat-uninstall
- Access to the OmegaPoint Azure subscription: https://portal.azure.com/#@itverket.no/resource/subscriptions/d6d57ee0-64af-4adc-b5cc-44e24edcdb53/resourceGroups
- Visual Studio Code: https://code.visualstudio.com/ with the following extensions:
- Mermaid Preview Markdown Support

An example of an Entity-Relation (ER) diagram can be found [here](
https://mermaid.live/edit#pako:eNp10d1qwyAUB_BXkXPd9AFyV6KMwLoMkxYK3jg9W2VJLM4URsy7zyyRrR3zzsPv_I8fIyirEXJAR418c7ITPYmrONRNtWecTGG7DSOh7LE8Mn7KdpRyVtckJ2f5cWdDyDI7korTuMnJpZUK_zHl07EqCxaVgNbIlxbJq3UCFv1n2l2yQ4XmmrJT1ozCD1L2im4lS-03yMqG7aMyvWoHnaKeeUUPRZMVu4Y9VPyUWtb6d2rvpelv_c35UrIA6zQ61HGGANhAh66TRsfHHuduAf6MHQqYqZbufb79FJ0cvK0_ewW5dwNuYLho6XH9nqU4fQEQvIY9)

## Intro

In this workshop, we are going to create a database that keeps track of concerts, artists and songs.
We will first model the database using Entity-Relation (ER) diagrams in Mermaid. Based on our ER model we are going to implement the required database tables and columns. The next step in the workshop is to
use AI to create scripts to populate our database tables with test data. When we have populated the tables
with test data we will make different reports using SQL queries. The next and last part of the workshop
is to optimize our tables for read performance by implementing indexes to our database tables.

## Workshop parts

The workshop consists of the following parts:

- Part 1: [Model a concert database model using ER diagrams](https://github.com/Omegapoint-Norge-Academy/storage-and-databases/tree/main/workshop/01-database-modelling)
- Part 2: [Create a database & tables needed for the concert system](https://github.com/Omegapoint-Norge-Academy/storage-and-databases/tree/main/workshop/02-create-tables)
- Part 3: [Insert test data into the database tables](https://github.com/Omegapoint-Norge-Academy/storage-and-databases/tree/main/workshop/03-insert-testdata)
- Part 4: [Create database queries](https://github.com/Omegapoint-Norge-Academy/storage-and-databases/tree/main/workshop/04-queries)
- Part 5: [Optimize the tables with indexes](https://github.com/Omegapoint-Norge-Academy/storage-and-databases/tree/main/workshop/05-optimize-performance)

Tip! If you get stuck or want to check if you are "on the right track", you can check the files in the "suggested-solution" subfolder in each part of the workshop.

## For the course instructor

### Workshop setup

To prepare for the workshop create the following in Azure:

- Resource group named `APP-Databases` in the region `(Europe) Norway East`
- Logical SQL Server
  - in the resource group `APP-Databases`
  - Named `appsqldbserver`
  - in the location `(Europe) Norway East`
  - Authentication method: `Use SQL authentication`
  - Server admin login: `App-Databases`
  - Password: `ConcertsAreGreat!`
  - Confirm password: `ConcertsAreGreat!`
- Go to the newly created SQL Server Azure resource and enable IP4 access to the SQL Server:
  - NB! This step requires knowing the IP address for the location of the course venue
  - Select the `appsqldbserver` SQL Server in the `APP-Databases` resource group
  - Scroll down to the `Networking` option in the `Security` option group on the left pane
    - Public network access: `Selected networks`
    - Firewall rules: `Add your client IPv4 address ([Your IPv4 address])`
    - Save
- Go to the newly created SQL Server Azure resource and create a database for each team:
  - Database name: `Team[Number]`
  - Workload environment: `Development`
  - Compute + Storage: `Configure`
    - Service tier: `General Purpose (Most budget-friendly)`
    - Compute tier: `Serverless`
    - Data max size (GB): `1`
  - Leave all other fields with default values
  - Click `Review and create`
  - The teams need the connection string to their database:
    - Select the newly created database resource
    - Select the `Connection strings` option under the `Settings` option group in the left pane
    - Copy the `ADO.NET (SQL authentication)` connection string. NB! They need to replace the `{your password}` with the actual password `ConcertsAreGreat!` into the copied connection string

### Slack

The following Slack channel "#app-storage-and-databases" has been created for communicating with the course members.
Ask the course members to join this channel for easier access to information related to the course.
In this channel, we have pinned the relevant information about this course.