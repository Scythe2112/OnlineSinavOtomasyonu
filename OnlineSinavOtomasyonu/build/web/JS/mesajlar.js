var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}

    
            
function mesajGonder(Gonderen){
         resNesne.open('get','mesajKayit.jsp?mesaj_Alan='+document.f.txtNumara.value+"&mesaj_Gonderen="+Gonderen+"&mesaj_Mesaj="+document.f.txtMesaj.value,true);
         resNesne.onreadystatechange=handleResponse;
         resNesne.send(null);
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("mesaj").innerHTML=resNesne.responseText;
        $("#mesaj").dialog();
        document.f.txtMesaj.value="";
        document.f.txtNumara.value="";
        
    } 
}

function HocaGetir(){
           resNesne.open('get','HocaGetir.jsp',true);
           resNesne.onreadystatechange=handleResponse2;
           resNesne.send(null);
           
}

function handleResponse2(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("selectHoca").innerHTML=resNesne.responseText;
    } 
}