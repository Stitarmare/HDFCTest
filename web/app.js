function alertMessage(callback) {
    var request = new XMLHttpRequest()

request.open('GET', 'https://api.openbrewerydb.org/breweries', true)
request.onload = function () {
  // Begin accessing JSON data here
  //var data = JSON.parse(this.response)
  if (request.status >= 200 && request.status < 400) {
    callback(this.responseText)
  } else {
    console.log('error')
  }
  
}

request.send()
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}