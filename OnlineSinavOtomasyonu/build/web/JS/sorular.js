var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}


            
function sil(Ozellik_ID){
           resNesne.open('get','soruSil.jsp?Ozellik_ID='+Ozellik_ID,true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
           
}



function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("pencere").innerHTML=resNesne.responseText;
         $("#pencere").dialog();
  
    } 
}


function tabGetir(){
           resNesne.open('get','AltBolumSoruGor.jsp',true);
           resNesne.onreadystatechange=handleResponse72;
           resNesne.send(null);
           
}



function handleResponse72(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("komple").innerHTML=resNesne.responseText;
    } 
}

