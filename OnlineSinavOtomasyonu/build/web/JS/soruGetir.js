var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}

var IDs;
  function degis(Soru_ID){
           IDs=Soru_ID;
           resNesne.open('get','degis.jsp?Soru_ID='+Soru_ID,true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
           
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
        $("#"+IDs+"").remove();
       document.getElementById(""+IDs+"div").innerHTML=resNesne.responseText;
       
    } 
}