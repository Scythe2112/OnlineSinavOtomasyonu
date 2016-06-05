var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}

var IDs;
var Sinavs;
  function bolumSil(ID){
           IDs=ID;
           resNesne.open('get','bolumSil.jsp?ID='+ID,true);
           resNesne.onreadystatechange=handleResponse7;
           resNesne.send(null);
           
           $("#"+ID+"").remove();
           
}  

function sinavOlustur(){
           
           Sinavs=document.sinavAnahat.txtID.value;
           resNesne.open('get','sinavOlustur.jsp?Sinav_ID='+document.sinavAnahat.txtID.value
            +'&Birim_ID='+document.sinavAnahat.boxBirim.value
            +'&Ders_ID='+document.sinavAnahat.boxDers.value
            +'&Tarih='+document.sinavAnahat.txtTarih.value
            +'&Saat='+document.sinavAnahat.txtSaat.value
            +'&SinavTur='+document.sinavAnahat.boxTur.value
            +'&Sure='+document.sinavAnahat.txtSure.value,true);
           
           resNesne.onreadystatechange=handleResponse5;
           resNesne.send(null);
}

function soruEkle(){
           resNesne.open('get','soruEkle.jsp?Sinav_ID='+document.sinavAnahat.txtID.value
            +'&Bolum_ID='+document.sinavIcerik.boxBolum.value
            +'&AltBolum_ID='+document.sinavIcerik.boxAltBolum.value
            +'&Zorluk='+document.sinavIcerik.boxZorluk.value
            +'&SoruSayisi='+document.sinavIcerik.txtSoruSayisi.value,true);
           
           resNesne.onreadystatechange=handleResponse6;
           resNesne.send(null);
}

function birimGetir(){
    
           resNesne.open('get','birimGetir.jsp?UstBirim_ID='+document.sinavAnahat.boxUstBirim.value,true);
           resNesne.onreadystatechange=handleResponse0;
           resNesne.send(null);
}

function dersGetir(){
           resNesne.open('get','dersGetir.jsp',true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
}
function bolumGetir(){
    
           resNesne.open('get','bolumGetir.jsp?Ders_ID='+document.sinavAnahat.boxDers.value+'&Birim_ID='+document.sinavAnahat.boxBirim.value,true);
           resNesne.onreadystatechange=handleResponse2;
           resNesne.send(null);
           
}
function altBolumGetir(){
    
           resNesne.open('get','altBolumGetir.jsp?Bolum_ID='+document.sinavIcerik.boxBolum.value,true);
           resNesne.onreadystatechange=handleResponse3;
           resNesne.send(null);
           
}
function sayiGetir(){
    
           resNesne.open('get','sayiGetir.jsp?AltBolum_ID='+document.sinavIcerik.boxAltBolum.value
                                           +'&Zorluk='+document.sinavIcerik.boxZorluk.value,true);
           resNesne.onreadystatechange=handleResponse4;
           resNesne.send(null);
           
}
function handleResponse0(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxBirim").innerHTML=resNesne.responseText;
        
    } 
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxDers").innerHTML=resNesne.responseText;
        
    } 
}

function handleResponse2(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxBolum").innerHTML=resNesne.responseText;
        
    } 
}
function handleResponse3(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("boxAltBolum").innerHTML=resNesne.responseText;
        
    } 
}
function handleResponse4(){
    
    if (resNesne.readyState == 4) {
       $("#1").html(resNesne.responseText);
        
    } 
}

function handleResponse5(){
    
    if (resNesne.readyState == 4) {
       document.getElementById("sinavSonuc").innerHTML=resNesne.responseText;
        $("#sinavIcerik").css("display","inline");
        $("#icerikKayit").css("display","inline");
        $("#btnOlustur").attr({
            disabled:"disabled"
        });
        
    } 
}

function handleResponse6(){
    
    if (resNesne.readyState == 4) {
       $(".icerikKayitTablo").append(resNesne.responseText);
       $("#soruGetir").css("display","inline");
    } 
}

function handleResponse7(){
    
    if (resNesne.readyState == 4) {
        
    } 
}