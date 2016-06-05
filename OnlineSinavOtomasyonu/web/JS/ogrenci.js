var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}

    
            
function mesajGonder2(Gonderen,Alan){
    
           resNesne.open('get','mesajKayit.jsp?mesaj_Alan='+Alan+"&mesaj_Gonderen="+Gonderen+"&mesaj_Mesaj="+document.mesaj.txtMesajOgrenci.value,true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("mesaj2").innerHTML=resNesne.responseText;
        $("#txtMesajOgrenci").val(" ");
        $("#mesaj2").dialog();
        
        
        
    } 
}
