var count=0;
    var seats=document.getElementsByClassName("seat");
    for(var i=0;i<seats.length;i++){
      var item=seats[i];
      
      item.addEventListener("click",(event)=>{
        var price= 10;

        if (!event.target.classList.contains('occupied') && !event.target.classList.contains('selected') ){
        count++;
        
        var total=count*price;
        event.target.classList.add("selected");
        document.getElementById("count").innerText=count;
        document.getElementById("total").innerText=total;

        }
      })
    }
    item.addEventListener("dblclick",(event)=>{
      if (event.target.classList.contains('selected') ){
        count--;
        var total=count*price;
        event.target.classList.remove("selected");
        document.getElementById("count").innerText=count;
        document.getElementById("total").innerText=total;
      }
    });
// Add a button to deselect all seats
var deselectButton = document.createElement("button");
deselectButton.innerText = "Deselect All";
deselectButton.addEventListener("click", () => {
  // Remove the "selected" class from all seats
  for (var i = 0; i < seats.length; i++) {
    var item = seats[i];
    if (item.classList.contains('selected')) {
      item.classList.remove("selected");
    }
  }
  // Reset the count and total variables
  count = 0;
  total = 0;
  document.getElementById("count").innerText = count;
  document.getElementById("total").innerText = total;
});

// Add the button to the DOM
document.body.appendChild(deselectButton);
    