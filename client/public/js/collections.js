// Sample data to mimic server data
let collectionsData = [];
let itemsData = {}; // Holds items for each collection, indexed by collection name
let collectionEditingIndex = null; // null means we're not editing, otherwise contains the index of the collection being edited
let itemEditingCollectionName = null;

function populateItems(collectionName) {
  const itemsTable = document.getElementById('items-table');
  itemsTable.innerHTML = ""; // clear the table first
  const items = itemsData[collectionName] || [];
  items.forEach((item, index) => {
      const row = itemsTable.insertRow();
      const cellTitle = row.insertCell(0);
      cellTitle.innerText = item.title;
      // Similarly, fill in other cells...

      const actionsCell = row.insertCell(-1);
      actionsCell.innerHTML = `<a href="#" onclick="editItem('${collectionName}', ${index})">Edit</a>`;
  });
}

function showNewCollectionForm() {
  // Reset editing state
  collectionEditingIndex = null;

  // Reset the form values
  document.getElementById('name').value = '';
  document.getElementById('description').value = '';
  document.getElementById('visibility').selectedIndex = 0;
  
  // Show modal
  $('#collection-modal').modal('show');
}

function showNewItemForm() {
  // Reset editing state
  itemEditingCollectionName = null;

  // Reset the form values
  document.getElementById('item-title').value = '';
  document.getElementById('description').value = '';
  
  // Show modal
  $('#item-modal').modal('show');
}


document.getElementById('collection-form').addEventListener('submit', function(e) {
  e.preventDefault();

  // Get form values
  const name = document.getElementById('name').value;
  const description = document.getElementById('description').value;
  const visibility = document.getElementById('visibility').value;

  if(collectionEditingIndex === null) {
      // Add new collection
      collectionsData.push({name, description, visibility});
  } else {
      // Update existing collection
      collectionsData[collectionEditingIndex] = {name, description, visibility};
      collectionEditingIndex = null; // reset editing state
  }

  // Close modal
  $('#collection-modal').modal('hide');

  // Refresh collections list
  populateCollections();
});

document.getElementById('item-form').addEventListener('submit', function(e) {
  e.preventDefault();

  // Get form values
  const name = document.getElementById('item-title').value;
  const description = document.getElementById('description').value;

  // Add new item or update existing item
  itemsData[itemEditingCollectionName] = {name, description};
  itemEditingCollectionName = null; // reset editing state

  // Close modal
  $('#item-modal').modal('hide');

  // Refresh items list
  populateItems(itemEditingCollectionName);
});


function populateCollections() {
    const listElement = document.getElementById('collections-list');
    listElement.innerHTML = '';

    collectionsData.forEach((collection, index) => {
        const row = `<tr>
            <td>${collection.visibility}</td>
            <td><a href="#" onclick="showItemsView('${collection.name}')">${collection.name}</a></td>
            <td>${collection.description}</td>
            <td><button class="btn btn-small btn-secondary" onclick="editCollection(${index})">Edit</button></td>
        </tr>`;
        listElement.innerHTML += row;
    });
}

function editCollection(index) {
  const collection = collectionsData[index];
  
  // Set editing state
  collectionEditingIndex = index;

  document.getElementById('name').value = collection.name;
  document.getElementById('description').value = collection.description;
  document.getElementById('visibility').value = collection.visibility;

  // Show modal
  $('#collection-modal').modal('show');
}

function editItem(collectionName, index) {
  const item = itemData[index];
  
  // Set editing state
  itemEditingCollectionName = collectionName;

  document.getElementById('item-title').value = item.title;
  document.getElementById('description').value = item.description;

  // Show modal
  $('#item-modal').modal('show');
}

function showCollectionsView() {
  //document.getElementById('view-title').innerText = "Collections";
  document.getElementById('collections-view').style.display = "block";
  document.getElementById('items-view').style.display = "none";
  populateCollections();
}

function showItemsView(collectionName) {
  document.getElementById('h2-collection-name').innerText = "Collection: " + collectionName;
  document.getElementById('collections-view').style.display = "none";
  document.getElementById('items-view').style.display = "block";
  populateItems(collectionName);
}

// Initial population
populateCollections();
