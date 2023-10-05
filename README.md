# Capstone Project

Brainstorming:
* User kann mehrere Collections verwalten
  * Collection laden, anlegen, bearbeiten, löschen
* User kann innerhalb einer Collection Items verwalten
  * Item laden, anlegen, bearbeiten, löschen
* User kann ein Item von einer Collection in eine andere verschieben
* Sort/Filter Options - Options to sort and filter items within the collection based on various attributes (e.g., title, author/director, release date, rating).
* User kann Item verleihen * Ausleihdaten verwalten
  * Ausleihe anlegen, bearbeiten, löschen
* User erhält Notification
  * wenn Item aufgenommen wird (?)
  * wenn Item verliehen wird (?)
  * wenn Item zurückgegeben wird



## Quickstart

### Backend

Requirements: 
* Node version > 18 - check via `node -v`
* Typescript version > 5 - check via `tsc -v`
* Serverless version > 3 - check via `sls -v`

```sh
npm i                 # classic install
sls dynamodb install  # installs dynamodb local
```

🟢 ONLINE
```sh
sls deploy  # deploy serverless template to aws
sls remove  # remove infrastructure and cloudformation template from aws
```

🔴 OFFLINE
```sh
# Execute both commands in seperate terminals:
sls offline         # local deployment hosted on http://localhost:3003
sls dynamodb start  # start dynamodb hosted on http://localhost:8000
```

### Frontend

Requirements: 
* Node version > 18 - check via `node -v`

```sh
npm install
npm run dev  # hosts on http://localhost:3000/
```

### How to interact with dynamodb without dynamodbs shell
```sh
aws dynamodb help  # Help
aws dynamodb list-tables --endpoint-url http://localhost:8000  # List all tables
aws dynamodb describe-table --endpoint-url http://localhost:8000 --table-name todos-dev  # Describe a table by name (with item count)
```



# Ressources

**User:** Stores information about each user.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|             | UserID      | A unique identifier of a user provided by oauth0. |
|             | Username    | The name of the user.
|             | Email       | The email adress of the user.

**Collection:** Stores information about the items in each user's collection.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|     ✅     | CollectionID | A unique identifier for each collection. |
|     ✅     | UserID      | A unique identifier of a user provided by oauth0 |
|     ✅     | Name        | The name of the collection (e.g., "Science Fiction Books", "Marvel Movies").|
|     ✅     | Description | A brief description of the collection.|
|     ✅     | Visibility  | Settings to control who can view the collection (public, private, shared with specific users).|
|     ✅     | Creation Date/Last Modified | The date the collection was created and the date it was last updated.|
|             | Tags/Labels | User-defined labels or tags that can be used to categorize and filter items.|

**Item:** Stores information about each item that can be part of a user's collection.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|     ✅     | ItemID      | A unique identifier for each item. |
|     ✅     | ItemType    | e.g., book, movie, game, comic |
|     ✅     | Title  | The title of the item (e.g., the name of the book, movie, or comic). |
|     ✅     | Description/Summary | A brief description or summary of the item. |
|             | Genre       | The genre(s) of the item (e.g., fantasy, action, romance). |
|             | Creator(s)  | The author(s), director(s), or other creator(s) of the item. |
|             | Release/Publication Date | The date the item was originally released or published. |
|             | Cover/Image | An image of the item's cover or poster. |
|             | Review/Notes | A section where the user can write personal notes about the item. |
|             | Rating      | The item's rating, either user-generated or from a popular rating system (e.g., IMDb for movies, Goodreads for books). |
|     ✅     | isLendable (boolean)| Information about whether the user (owner) would lend the item. |
|     ✅     | Ownership | Information about whether the user owns the item, wishes to buy it, has borrowed it, etc. |
|     ✅     | Status      | Information about whether the item has been read/watched, is currently being read/watched, or is on a to-read/to-watch list. |
|             | LocationID  | A unique identifier for each location. |
|     ✅     | Creation Date/Last Modified | The date the collection was created and the date it was last updated.|
|             | Tags/Labels | User-defined labels or tags that can be used to categorize and filter items. |

**CollectionItem:** A list of items (i.e., individual books, movies, comics, etc.) that belong to one or many the collections.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|     ✅     | ItemID      | A unique identifier for each item. |
|     ✅     | CollectionID | A unique identifier for each collection. |

**Location:** Represents the physical locations where collection items can be stored.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|             | LocationID  | A unique identifier for each location. |
|             | Title/Name  | The name of the location (e.g., "Living Room Bookshelf", "Storage Box 1"). Allows users to identify and search for locations. |
|             | Description | A description of the location. Provides users with more information about each location, such as its physical characteristics or where it is located in the user's home. |
|             | ImageURL    | An image of the location for easier recognation. |

**Lending:** Stores information about each lending transaction.
| implemented | name        | description |
|:-----------:|-------------|-------------|
|             | LendingID   | A unique identifier for each lending transaction. |
|             | LenderUserID | The identifier of the user who is lending the item. |
|             | LenderUsername | The name of the user who is lending the item. |
|             | BorrowerUserID | The identifier of the user who is borrowing the item. |
|             | BorrowerUsername | The name of the user who is borrowing the item. |
|             | ItemID      | The identifier of the item being lent. |
|             | DateLent    | The date when the item was lent. |
|             | DateReturned| The date when the item was returned. |
|             | Status      | e.g., lending, returned |
