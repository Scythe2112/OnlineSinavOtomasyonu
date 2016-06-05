var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}


function yolla(){
            resNesne.open('get','sinavKontrol.jsp?txtNo='+document.f1.txtNo.value
                         +'&txtSinav='+document.f1.txtSinav.value+'&buton='+'0',true);
                                           
            resNesne.onreadystatechange=handleResponse;
            resNesne.send(null);
           
}
function yolla1(){
            resNesne.open('get','sinavKontrol.jsp?txtNo='+document.f1.txtNo.value
                         +'&txtSinav='+document.f1.txtSinav.value+'&buton='+'1',true);
                                           
            resNesne.onreadystatechange=handleResponse;
            resNesne.send(null);
           
}
function yolla2(){
            resNesne.open('get','sinavKontrol2.jsp?txtSinav='+document.f2.txtSinav.value+'&buton='+'2',true);
                                           
            resNesne.onreadystatechange=handleResponse;
            resNesne.send(null);
           
}

function handleResponse(){
    
    if (resNesne.readyState == 4) {
        document.getElementById("dialog").innerHTML=resNesne.responseText;
        $( "#dialog" ).dialog();
  
    } 
}

function kayitEkle(){
            resNesne.open('get','kayitEkle.jsp?txtNumara='+document.f3.txtNumara.value+'&txtAd='+document.f3.txtAd.value+'&txtSoyad='+document.f3.txtSoyad.value+'&txtSifre='+document.f3.txtSifre.value,true);
            resNesne.onreadystatechange=handleResponse_kayitEkle;
            resNesne.send(null);
}
function handleResponse_kayitEkle(){
    if (resNesne.readyState == 4) {
                      if (resNesne.responseText == 0) {
                     alert("Girmiş olduğunuz Öğrenci Numarası Sistemde Mevcut! Farklı bir Numara Giriniz."); 
                }else if(resNesne.responseText ==1){
                    alert("Kayıt Başarı ile Eklendi.");
                }else if(resNesne.responseText ==2){
                    alert("Kayıt İşlemi Başarısız oldu Lütfen Yeniden Deneyin.");
                }else if(resNesne.responseText ==3){
                    alert("Veritabanı Bağlantı Hatası. Sistem Yönetici ile irtibata geçin.");
                }  
    }}

function sifreDegis(){
            resNesne.open('get','sifreDegis.jsp?txtSifre='+document.sifre.txtSifre.value+
                                                '&txtYeniSifre='+document.sifre.txtYeniSifre.value
                                                ,true);
                                           
            resNesne.onreadystatechange=handleResponse2;
            resNesne.send(null);
           
}

function handleResponse2(){
    
    if (resNesne.readyState == 4) {
        alert(resNesne.responseText);
    } 
}
