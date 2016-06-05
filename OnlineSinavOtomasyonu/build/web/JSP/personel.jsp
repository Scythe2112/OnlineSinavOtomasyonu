<%-- 
    Document   : personel
    Created on : 16.Tem.2013, 10:47:18
    Author     : Nuri
--%>
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Personel"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PERSONEL SAYFASI</title>
    
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>

    <script  type="text/javascript" src="../jquery.js"></script>
    <script type="text/javascript" src="../JS/personel.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    
    <link   type="text/css" rel="Stylesheet" href="style.css"/>
    <link   href="../CSS/templatemo_style.css" rel="stylesheet" type="text/css" />

    <script>
  $(document).ready(function() {
    $("#menu" ).menu(); 
    $("#sinavDurumSonuc").dialog();
    $("#cikis").button();
    $("#menu").css({
        float:'left',
        width:'220px',
        height:'auto'
    });
    
    $("#btnSifre").click(function(){
        if($("#txtSifre").val().length<1
         ||$("#txtYeniSifre").val().length<1
         ||$("#txtYeniSifreT").val().length<1){alert("Boş Alan Bırakamazsız.");}
        else if($("#txtYeniSifre").val()!=$("#txtYeniSifreT").val()){alert("Yeni şifreni ve Yeni Şifre Tekrarı aynı değil.");}
        else{sifreDegis();}
    });
    });
</script>
</head>

<body>

<% 
 Personel personel=(Personel)session.getAttribute("personelInfo");
 if(personel==null){
     response.sendRedirect("../index.jsp");
 }
 else{
%>
        


    <%
    if(request.getParameter("AS")!=null){
    if(request.getParameter("AS").equals("FH52D")){
    %>
    <div id="sinavDurumSonuc">Sınav Oluşturulurken Soru eklenmediği için aktifleştirilemiyor..Lütfen Mevcut sınavı silerek  yeni bir sınav düzenleyin.</div>
    <%
    }}
    %>
        
    <div id="dialog" class="dialog"></div>
    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    <div id="templatemo_sidebar">
    
      <div class="sb_box">
      <div id="contact_form">
          <h6>Ad: <%=personel.getHoca_Ad()%> <%=personel.getHoca_Soyadi()%> </h6>
          <h6>Birim: <%=personel.getHoca_Birim_ID()%></h6>
          <h6>E-Posta: <%=personel.getHoca_Email()%></h6>
      </div>
      </div>

    <div class="sb_box">
    <div id="contact_form">
              
    <ul id="menu">
    <li><a href="sorular.jsp"><img src="../IMAGE/Archive.png" style="width:36px;height:36px;"/>SORU BANKASI</a></li>
    
    <li><a href="#"><img src="../IMAGE/User_black.png" style="width:36px;height:36px;"/>ÖĞRENCİ İŞLEMLERİ</a>
    <ul style="width: 300px;">      
        <li style="height:50px;"><a href="#">Öğrenciyi Sınav için Aktif Et</a>
            <ul>
                <li>
                   <form name="f1">
                   <table><tr><td>Numara:</td><td>Sınav No:</td></tr>                       
                          <tr><td><input type="text" name="txtNo" value="" size="8" /></td>
                              <td><input type="text" name="txtSinav" value="" size="8" /></td></tr>
                          <tr><td><input type="button" value="Sıfırla" name="txtKaydet0" onclick="yolla()" style="width:82px;"/></td>
                              <td><input type="button" value="Devam" name="txtKaydet1" onclick="yolla1()" style="width:82px;"/></td></tr>
                   </table>
                   </form>                     
                                
                 </li>
            </ul>
        </li>
        
        <li style="height:50px;"><a>Bütün Öğrencileri Sınav İçin Aktif Et</a>
            <ul>
               <li>
                  <form name="f2">
                      <table>
                          <tr><td>Sınav No:</td></tr>                                   
                          <tr><td><input type="text" name="txtSinav" value="" size="8" /></td>
                              <td><input type="button" value="Kaydet" name="txtKaydet" onclick="yolla2()" style="width:82px;" /></td>
                          </tr>
                      </table>
                   </form> 
                </li>
             </ul>
         </li>
        
         <li style="height:50px;" ><a>Öğrenci Ekle</a>
             <ul style="width: 250px;" >
                 <li>
                     <form name="f3">
                           <table>
     <tr><td>Numara:</td><td><input type="text" name="txtNumara" value="" size="16" /></td></tr>
     <tr><td>Ad:</td><td><input type="text" name="txtAd" value="" size="16" /></td></tr>
     <tr><td>Soyad:</td><td><input type="text" name="txtSoyad" value="" size="16" /></td></tr>
     <tr><td>Şifre:</td><td><input type="text" name="txtSifre" value="" size="16" /></td></tr>
     <tr><td><input type="button" value="Kaydet" name="txtKaydol" onclick="kayitEkle();" style="width:82px;" /></td><td></td></tr>
                           </table> 
                     </form> 
                    </li>
                </ul>
          </li>
        


        </ul>
    </li>
    
        <li><a href="sinavEkle.jsp"><img src="../IMAGE/Sheet_of_paper.png" style="width:36px;height:36px;"/>SINAV DÜZENLE</a></li>
        <li><a href="mesajlar.jsp"><img src="../IMAGE/Chat.png" style="width:36px;height:36px;"/>GELEN KUTUSU</a> </li>
        <li><a href="#"><img src="../IMAGE/Gears.png" style="width:36px;height:36px;"/>ŞİFRE DEĞİŞTİR</a>
            <ul>
                <li style="height:50px;"><a href="#">Şifre Değiştir</a>
                    <ul style="width: 250px;">
                        <li >
                            <form name="sifre" >
                                <table>
                                    <tr>
                                        <td>Mevcut Şifre:</td>
                                        <td><input type="password" name="txtSifre" id="txtSifre" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Yeni Şifre:</td>
                                        <td><input type="password" name="txtYeniSifre" id="txtYeniSifre" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Yeni Şifre Tekrar:</td>
                                        <td><input type="password" name="txtYeniSifreT" id="txtYeniSifreT" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"> <input type="button" value="Kaydet" name="btnSifre" id="btnSifre" /></td>
                                    </tr>
    </table>
    </form>
    </li>
    </ul>
    </li>         
    </ul>
    </li>
    </ul> 
        
<div align="right"> 
 <a href="../logoutPersonel.jsp"><button id="cikis" style="width: 228px;"><img src="../IMAGE/Lock.png" style="width:36px;height:36px;"/>ÇIKIŞ</button></a>
</div>
    </div>
    </div>   

<div class="cleaner"></div>
</div> 
    
<div id="templatemo_content">
     <jsp:include page="sinavlar.jsp"></jsp:include>
</div>

<div class="cleaner"></div>
</div>
</div> 
</div>
            
<%
}
%>

</body>
</html>
