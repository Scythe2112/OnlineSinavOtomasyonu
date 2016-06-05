var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}


function sinavDetayGor(Ogrenci_ID,Sinav_ID){
            resNesne.open('get','ogrenciAnahtar.jsp?Ogrenci_ID='+Ogrenci_ID
                         +'&Sinav_ID='+Sinav_ID,true);
                                           
            resNesne.onreadystatechange=handleResponse;
            resNesne.send(null);
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("OgrenciAnahtar").innerHTML=resNesne.responseText;
    } 
}
