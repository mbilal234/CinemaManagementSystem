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