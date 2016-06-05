var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}


var Sinav_Id;
function getir(Sinav_ID){
      Sinav_Id=Sinav_ID;
            resNesne.open('get','sinavSoru.jsp?Sinav_ID='+Sinav_ID,true);
            resNesne.onreadystatechange=handleResponse;
            resNesne.send(null);
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("soruSayfasi").innerHTML=resNesne.responseText;
        getirSira(Sinav_Id);       
                
    } 
}

function getirSira(Sinav_ID){
            
            resNesne.open('get','sinavPanel.jsp?Sinav_ID='+Sinav_ID,true);
            resNesne.onreadystatechange=handleResponse11;
            resNesne.send(null);
           
}

function handleResponse11(){
    
    if (resNesne.readyState == 4) {
       
        document.getElementById("soruSirasi").innerHTML=resNesne.responseText;
    } 
}

function tiklama(deger){
            
            resNesne.open('get','sessionDegis.jsp?deger='+deger,true);
            resNesne.onreadystatechange=handleResponse123;
            resNesne.send(null);
           
}

function handleResponse123(){
    
    if (resNesne.readyState == 4) {
        
        getir(Sinav_Id);
        
    } 
}


function SoruKaydet(deger,Sinav_IDD,Ozellik_ID,boyut){
           
            resNesne.open('get','SoruKaydet.jsp?Sinav_ID='+Sinav_IDD
                         +'&deger='+deger
                         +'&boyut='+boyut
                         +'&Ozellik_ID='+Ozellik_ID,true);
                                           
            resNesne.onreadystatechange=handleResponse13;
            resNesne.send(null);
           
}

function handleResponse13(){
    
    if (resNesne.readyState == 4) {
            document.getElementById("soruSayfasi").innerHTML=resNesne.responseText;
            getirSira(Sinav_Id);
    } 
}