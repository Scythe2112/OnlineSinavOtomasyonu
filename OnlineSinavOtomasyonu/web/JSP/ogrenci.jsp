<%-- 
    Document   : ogrenci
    Created on : 16.Tem.2013, 11:21:25
    Author     : Nuri
--%>


<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Öğrenci Sayfası</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <link type="text/css" href="../CSS/ogrenci.css" rel="Stylesheet"/>
    
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" src="../JS/ogrenci.js"></script>
    
    <link   type="text/css" rel="Stylesheet" href="style.css"/>
    <link   href="../CSS/templatemo_style.css" rel="stylesheet" type="text/css" />
           
    <style>
    body { font-size: 62.5%; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
  </style>
  
    <script type="text/javascript">
    $(document).ready(function(){
        $("#btnBasla").button();
        $("#butonSinav").button();
        $("#cikis2").button();
        $( "#tabs" ).tabs();
        $( "#ogrenciMesajSonuc" ).dialog();

    });   
    

    function kontrol(){
        if(document.f.txtSinavId.value.length<1){
            document.getElementById("sonuc").innerHTML="<b style=' color:blue;'>Sinav ID Girin!<b>";
        }else{
            sinavBasla();
            
        }
    }
    
    
    
    function sinavBasla() {
    $( "#dialog-confirm" ).dialog({
      resizable: true,
      height:240,
      width:340,
      modal: true,
      buttons: {
        "Evet": function() {
          window.location.href="sinavGiris.jsp?Sinav_ID="+document.f.txtSinavId.value;
          
        },
        Hayır: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }
    
        
</script>
</head>

<body>
    
               <% 
 Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

 if(ogrenci==null){
     response.sendRedirect("../index.jsp");
 }
 else{
      baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        String durum="";
        
    PreparedStatement pstmt5 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`mesaj` WHERE  mesaj_Alan=?;");
    pstmt5.setString(1, ogrenci.getOgrenci_ID());
    ResultSet result5 = pstmt5.executeQuery();
    
    
    PreparedStatement pstmt6 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE  Hoca_ID=?;");
    
     
     
        %>

        <div id="dialog-confirm" title="Emin misin?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Sınava giriş yapmak üzeresiniz.Sınav süresince çıkış yapamaz ve tekrar sınava giremezsiniz!</p>
</div>
<%
        if(request.getParameter("ssh")!=null){
    if(request.getParameter("ssh").equals("DY12NDW")){
    %>
 <div id="ogrenciMesajSonuc">Mesaj Sınav Sorumlusuna  Gönderildi.</div>
<%
    }}
%>
    
    <div id="mesaj2"></div>
    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    <div id="templatemo_sidebar">
    
      <div class="sb_box">
      <div id="contact_form">
   
       
       <form  name="f">
       <table id="rounded-corner" border="1" cellpadding="1" cellspacing="0" style="width:220px; height: 80px;">
            
            <tr>
            <td width="40%">SINAV ID:</td>
            <td width="80">
            <input type="text" name="txtSinavId" value="" size="20" />
            </td>
            </tr>
            
            <tr>
            <td colspan="2">
                <button type="button" id="btnBasla" onclick="kontrol();"><img src="../IMAGE/Clock.png" style="width:40px;height:40px;"/>SINAVA BAŞLA</button><br>
            </td>
            </tr>
            
            <tr>
                <td colspan="2" id="sonuc">
                    <%
                    String e=request.getParameter("e");
                    if(e!=null){
                    if(e.equals("1da23fa16")){
                    out.println("<b style=' color:blue;'>Sinav Kapalı Durumda.<br>Danışman ile irtibata geçin.<b>");
                    }else if(e.equals("13wpd2n1")){
                    out.println("<b style=' color:blue;'>Bu sınava daha önce giriş yaptınız!<b>");
                    }else if(e.equals("1524dwmn41")){
                    out.println("<b style=' color:blue;'>Sistemde Kayıtlı böyle bir sınav Mevcut değil!<b>");
                    }else{
                    }}
                    %>
                </td>
            </tr>
      </table>
       </form>    
            </div>
      </div>
    
                                 <div class="sb_box">
                    <table>
         <tr><td><a href="../logoutOgrenci.jsp"><img src="../icons/png/48x48/lock.png" width="48" height="48" alt="Çıkış Yap"/>Çıkış Yap</a></td></tr>
         <tr><td><a href="mesajlarOgrenci.jsp"><img src="../icons/png/48x48/comment.png" width="48" height="48" alt="Gelen Kutusu"/>Gelen Kutusu</a></td></tr>
          
                    </table>
                </div>
                
         <div class="sb_box">
      <div id="contact_form">
          
        <table id="rounded-corner" border="1" cellpadding="1" cellspacing="0" style="width:220px; height: 80px;">
            
            <tr>
            <td>Numara :</td>
            <td>
            <%=ogrenci.getOgrenci_ID()%>
            </td>
            </tr>
            
            <tr>
                <td>TC KİMLİK NO:</td>
            <td>
                <%=ogrenci.getOgrenci_TC()%>
            </td>
            </tr>
            
            <tr>
                <td>Ad:</td>
            <td>
                <%=ogrenci.getOgrenci_Ad()%>
            </td>
            </tr>
            
            <tr>
                <td>Soyad:</td>
            <td>
                 <%=ogrenci.getOgrenci_Soyad()%>
            </td>
            </tr>
            
            <tr>
                <td>Doğum Yeri:</td>
            <td>
                 <%=ogrenci.getOgrenci_DogumYeri()%>
            </td>
            </tr>
            
            <tr>
                <td>Doğum Tarihi:</td>
            <td>
                 <%=ogrenci.getOgrenci_DogumTarih()%>
            </td>
            </tr>
            
            <tr>
                <td>Bölüm:</td>
            <td>
                 <%=ogrenci.getOgrenci_Birim_ID()%>
            </td>
            </tr>
    </table>
    </div>
      </div>

         
      <div class="cleaner"></div>
      </div> 
 
            
            <div id="templatemo_content">
<div id="tabs">
    <ul>
        <li><a href="#tabs-1"><img src="../IMAGE/Notepad.png"/>SINAV SONUÇLARI</a></li>
    </ul>
    
    <div id="tabs-1">
        <table border="1" cellpadding="1" cellspacing="2" id="rounded-corner">
        <tr>
            <td>Sinav-ID</td>
            <td>Birim</td>
            <td>Ders</td>
            <td>Tarih</td>
            <td>Sure</td>
            <td>Sınav Türü</td>
            <td>Not</td>
            <td>Sorumluya Yaz</td>
            
        </tr>
        
        <%

        int Hoca_ID=0;
        int Sinav_ID=0;
        
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_sonuc` WHERE  Ogrenci_ID=?;");
    pstmt.setString(1,ogrenci.getOgrenci_ID());
    ResultSet result = pstmt.executeQuery();
    
    
    
    
    
    while(result.next()){
        Sinav_ID=result.getInt("Sinav_ID");
        PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_anahat` WHERE  Sinav_ID=?;");
    pstmt2.setInt(1,Sinav_ID);
    ResultSet result2 = pstmt2.executeQuery();
    if(result2.next()){Hoca_ID=result2.getInt("Hoca_ID");
    
    out.println("<tr>");
    out.println("<td>"+Sinav_ID+"</td>");
    out.println("<td>"+result2.getString("Birim_ID")+"</td>");
    out.println("<td>"+result2.getString("Ders_ID")+"</td>");
    out.println("<td>"+result.getString("GirisZaman")+"</td>");
    out.println("<td>"+result2.getString("Sure")+"</td>");
    out.println("<td>"+result2.getString("SinavTur")+"</td>");
    out.println("<td>"+result.getString("SinavNotu")+"</td>");
    out.println("<td><a href='mesajlarOgrenci.jsp'><img src=\"../IMAGE/send.png\"/></a></td>");
    out.println("</tr>");

    
    }  
    }
        %>
       
    </table>
    </div>
    </div>
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
