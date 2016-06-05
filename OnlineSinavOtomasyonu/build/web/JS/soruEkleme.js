
var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}

function Azalt(soruSirasi,Ozellik_ID){
           resNesne.open('get','soruGetir.jsp?soruSirasi='+soruSirasi+'&Ozellik_ID='+Ozellik_ID+'&Durum=Azalt',true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
    
}
function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("soruGetir").innerHTML=resNesne.responseText;
        //$("#butonArttir").text("Arttı");
    } 
}