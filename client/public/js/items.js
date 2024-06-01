let itemsData = {}; // Holds items for each collection, indexed by collection name

function showItemsView(collectionName) {
  document.getElementById('view-title').innerText = "Collection: " + collectionName;
  document.getElementById('collections-view').style.display = "none";
  document.getElementById('items-view').style.display = "block";
  populateItems(collectionName);
}

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