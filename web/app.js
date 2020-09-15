function requestForData(callback) {
    var request = new XMLHttpRequest()

request.open('GET', 'https://api.openbrewerydb.org/breweries', true)
request.onload = function () {
  // Begin accessing JSON data here
  //var data = JSON.parse(this.response)
  if (request.status >= 200 && request.status < 400) {
    callback(JSON.parse(this.response))
  } else {
    console.log('error')
  }
  
}

request.send()
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}


function checkBroweserComapatiblity(callback) {
  window.indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || 
window.msIndexedDB;
 
window.IDBTransaction = window.IDBTransaction || window.webkitIDBTransaction || 
window.msIDBTransaction;
window.IDBKeyRange = window.IDBKeyRange || 
window.webkitIDBKeyRange || window.msIDBKeyRange
 
if (!window.indexedDB) {
   window.alert("Your browser doesn't support a stable version of IndexedDB.")
} else {
  var db;
         var request = window.indexedDB.open("newDatabase", 1);
         request.onupgradeneeded = function(event) {
          var db = event.target.result;
          store = db.createObjectStore("breweries",{keyPath: "id"});
          console.log("created breweries")
       }
         
         request.onerror = function(event) {
            console.log("error: ");
         };
         
         request.onsuccess = function(event) {
            db = request.result;
            console.log("success: "+ db);
            var store;
         try {
          store = db.transaction("breweries").objectStore("breweries");
          readData(db,store,function(data){
            
            callback(data)
          });
          
          
        }
        catch(e) {
          console.log(e)
            callback()
        }
        
            
         }
         
             
      }

}

function readData(db,store,callback) {
 
  var brewerieData = [];
  store.openCursor().onsuccess = function(event) {
  var cursor = event.target.result;
  
  if (cursor) {
    
    brewerieData.push({"id":cursor.value.id,"name":cursor.value.name,"brewery_type":cursor.value.brewery_type,"street":cursor.value.street,"city":cursor.value.city,"state":cursor.value.state,"postal_code":cursor.value.postal_code,"country":cursor.value.country,"longitude":cursor.value.longitude,"latitude":cursor.value.latitude,"phone":cursor.value.phone,"website_url":cursor.value.website_url,"updated_at":cursor.value.updated_at})
    cursor.continue();
  }
  else {
    if (brewerieData.length > 0) {
      callback(JSON.stringify(brewerieData))
      
    } else {
      requestForData(function(data){
        callback(JSON.stringify(data))
      addData(db,data);
      });
    }
  }
  
};
}

function addData(db,brewerieData) {
  var store = db.transaction(["breweries"], "readwrite")
            .objectStore("breweries")
  for (var i in brewerieData) {
    store.add({id:brewerieData[i].id,name:brewerieData[i].name,brewery_type:brewerieData[i].brewery_type,street:brewerieData[i].street,city:brewerieData[i].city,state:brewerieData[i].state,postal_code:brewerieData[i].postal_code,country:brewerieData[i].country,longitude:brewerieData[i].longitude,latitude:brewerieData[i].latitude,phone:brewerieData[i].phone,website_url:brewerieData[i].website_url,updated_at:brewerieData[i].updated_at});
 }
 console.log("added all data")
}


