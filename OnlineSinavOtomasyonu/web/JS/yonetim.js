var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}
function birimGetir(){
    
           resNesne.open('get','birimGetir.jsp?UstBirim_ID='+document.f1.boxUstBirim.value,true);
           resNesne.onreadystatechange=handleResponse0;
           resNesne.send(null);
}
function birimGetir2(){
    
           resNesne.open('get','birimGetir.jsp?UstBirim_ID='+document.f2.boxUstBirim2.value,true);
           resNesne.onreadystatechange=handleResponse00;
           resNesne.send(null);
}

function dersGetir(){
    
           resNesne.open('get','dersGetir.jsp?Birim_ID='+document.f1.boxBirim1.value+'&deger=1',true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
}
function bolumGetir(){
    
           resNesne.open('get','bolumGetir.jsp?Ders_ID='+document.f1.boxDers1.value+'&Birim_ID='+document.f1.boxBirim1.value,true);
           resNesne.onreadystatechange=handleResponse2;
           resNesne.send(null);
           
}
function AltBolumKaydet(){
    
           resNesne.open('get','AltBolumKaydet.jsp?Bolum_ID='+document.f1.boxBolum1.value+'&AltBolum_Ad='+document.f1.txtAltBolum.value,true);
           resNesne.onreadystatechange=handleResponse3;
           resNesne.send(null);
           
}



function handleResponse0(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxBirim1").innerHTML=resNesne.responseText;
        
    } 
}
function handleResponse00(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxBirim2").innerHTML=resNesne.responseText;
        
    } 
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxDers1").innerHTML=resNesne.responseText;
        
    } 
}
function handleResponse2(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxBolum1").innerHTML=resNesne.responseText;
        
    } 
}
function handleResponse3(){
    
    if (resNesne.readyState == 4) {
       $("#konsol").append(resNesne.responseText+'<br>');
        
    } 
}



