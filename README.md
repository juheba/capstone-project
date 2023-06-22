# Capstone Project

Brainstorming:
* User kann mehrere Collections verwalten
  * Collection laden, anlegen, bearbeiten, löschen
* User kann innerhalb einer Collection Items verwalten
  * Item laden, anlegen, bearbeiten, löschen
* User kann ein Item von einer Collection in eine andere verschieben
* User kann Item verleihen - Ausleihdaten verwalten
  * Ausleihe anlegen, bearbeiten, löschen
* User erhält Notification
  * wenn Item aufgenommen wird (?)
  * wenn Item verliehen wird (?)
  * wenn Item zurückgegeben wird

Collection Resource
* Title/Name: The name of the collection (e.g., "Science Fiction Books", "Marvel Movies").
* Description: A brief description of the collection.
* Items: A list of items (i.e., individual books, movies, comics, etc.) that belong to the collection.
* Type: The type of media the collection contains (e.g., book, movie, comic).
* Tags/Labels: User-defined labels or tags that can be used to categorize and filter collections.
* Visibility: Settings to control who can view the collection (public, private, shared with specific users).
* Sort/Filter Options: Options to sort and filter items within the collection based on various attributes (e.g., title, author/director, release date, rating).
* Creation Date/Last Modified: The date the collection was created and the date it was last updated.

Item Resource
* Title/Name: The title of the item (e.g., the name of the book, movie, or comic).
* Description/Summary: A brief description or summary of the item.
* Creator(s): The author(s), director(s), or other creator(s) of the item.
* Release/Publication Date: The date the item was originally released or published.
* Genre: The genre(s) of the item (e.g., fantasy, action, romance).
* Rating: The item's rating, either user-generated or from a popular rating system (e.g., IMDb for movies, Goodreads for books).
* Status: Information about whether the item has been read/watched, is currently being read/watched, or is on a to-read/to-watch list.
* Ownership Status: Information about whether the user owns the item, wishes to buy it, has borrowed it, etc.
* Location: Where the item is physically located, if applicable (e.g., on a specific bookshelf, in a storage box).
* Tags/Labels: User-defined labels or tags that can be used to categorize and filter items.
* Cover Image: An image of the item's cover or poster.
* Notes: A section where the user can write personal notes about the item.