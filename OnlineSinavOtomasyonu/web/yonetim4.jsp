
<%-- 
    Document   : Kayit_Getir
    Created on : 28.Ara.2013, 18:06:41
    Author     : Lenowo
--%>

<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>YÖNETİM PANELİ</title>
    
    <link type="text/css" rel="Stylesheet" href="style.css"/>
    <link href="CSS/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    
    <script  type="text/javascript" src="jquery.js"></script>
    <script  type="text/javascript" src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    
    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }

    </script>


    
    <script type="text/javascript" >
            function soruAktif(id){
            
            $.ajax({
            type: "POST",
            url: 'JSP/Soru_Getir.jsp',
            data: "islem=1&Ozellik_ID="+id,
            success: function (sonuc) {

                if(sonuc==1){
                    alert("Soru Onaylandı.");
                    window.location.reload();}
                                      }
            });    
            } 
            
            function Ogrenme(){

            $.ajax({
            type: "POST",
            url: 'JSP/Ogrenme.jsp',
            data: "",
            success: function (sonuc) {
            alert(sonuc);
                                      }
            }); 
                  
             }
             
            
            function soruSil(id){
            
            $.ajax({
            type: "POST",
            url: 'JSP/Soru_Getir.jsp',
            data: "islem=2&Ozellik_ID="+id,
            success: function (sonuc) {
 
                if(sonuc==2){
                    alert("Soru Silindi.");
                    window.location.reload();}
                                      }
            });    
            } 
            
            
            function soruGor(id){
            $.ajax({
            type: "POST",
            url: 'JSP/Soru_Gor.jsp',
            data: "Ozellik_ID="+id,
            success: function (sonuc) {
                alert(sonuc);
                                      }
            });    
            }
            
    $(document).ready(function() {
       
        });

    </script>
    
    
</head>


<body>

    <%
  Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
    
    if(yonetici==null){
        response.sendRedirect("index.jsp");
    }else{
      String isim=yonetici.getAd().toString();
      String soyisim=yonetici.getSoyad().toString();
      
    %>

    <div id="templamteo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_main_top"></div>
               <div id="templatemo_main">
                  <div id="templatemo_sidebar">

                    <div class="sb_box">
                        <div id="contact_form">
                            <h4>Hoşgeldiniz Sayın:</h4>
                            <h5><% out.print(isim+" "+soyisim); %>&nbsp;&nbsp;&nbsp;<a href="logoutYonetici.jsp">Çıkış<img src="icons/png/32x32/unlock.png" width="32" height="32" alt="Arama"/></a></h5>
                        </div>
                    </div>  

                <div class="sb_box">
                    <table>
          <tr><td><a href="yonetim1.jsp"><img src="icons/png/48x48/user.png" width="48" height="48" alt="Personel Ekle"/>Personel Ekle</a></td></tr>
          <tr><td><a href="yonetim2.jsp"><img src="icons/png/48x48/add_to_folder.png" width="48" height="48" alt="Birim-Bölüm-Ders Ekle"/>Birim-Bölüm-Ders Ekle</a></td></tr>
          <tr><td><a href="yonetim3.jsp"><img src="icons/png/48x48/mail_receive.png" width="48" height="48" alt="Mesaj Gelen Kutusu"/>Mesaj Gelen Kutusu</a></td></tr>
          <tr><td><a href="#"><img src="icons/png/48x48/accept.png" width="48" height="48" alt="Soru Onayla"/>Soru Onayla</a></td></tr>
          <tr><td><a href="javascript:Ogrenme()"><img src="icons/png/48x48/chart.png" width="48" height="48" alt="Öğrenme"/>Yapay Öğrenme</a></td></tr>
        
                    </table>
                </div> 
                </div>

            <div id="templatemo_content">
                <%
       veritabani.baglanti database = new veritabani.baglanti();
                    
       String query = "SELECT * FROM sinav.soruozellik where Durum=?;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,0);
       ResultSet result = pstmt.executeQuery();
       
       out.println("<table id='rounded-corner'>");
       out.println("<tr><td>Hoca ID</td><td>Zorluk</td><td>Onay</td><td>Red</td><td>Soruyu Gör</td></tr>");
       int i=0;
       while(result.next()){
       i++; 
       out.println("<tr>");
       out.println("<td>"+result.getString("Hoca_ID")+"</td>");
       out.println("<td>"+result.getString("Zorluk")+"</td>");
       out.println("<td><a href='javascript:soruAktif("+result.getString("Ozellik_ID")+")'><img src='icons/png/32x32/accept.png' width='32' height='32'/></a></td>");
       out.println("<td><a href='javascript:soruSil("+result.getString("Ozellik_ID")+")'><img src='icons/png/32x32/block.png' width='32' height='32'/></a></td>");
       out.println("<td><a href='javascript:soruGor("+result.getString("Ozellik_ID")+")'><img src='img/gor.png' width='32' height='32'/></a></td>");
       out.println("</tr>");
       }
       if(i==0){out.println("<tr><td colspan='7'>Yeni Soru Mevcut Değil</td></tr>");}
       out.println("</table>");
       
                
                
                
                %>

            </div>
            <div class="cleaner"></div>
            </div>


</div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>
</body>
<%
}
%>
</html>
