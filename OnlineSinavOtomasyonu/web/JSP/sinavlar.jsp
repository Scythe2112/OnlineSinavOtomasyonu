    <%-- 
    Document   : sinavlar
    Created on : 19.Tem.2013, 14:02:03
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script type="text/javascript" src="../JS/personel.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<script language="JavaScript">
    function sil(id) {
    $( "#dialog-confirm" ).dialog({
      resizable: true,
      height:200,
      width:240,
      modal: true,
      buttons: {
        "Evet": function() {
          window.location.href="sinavSil.jsp?Sinav_ID="+id;
          
        },
        Hayır: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }
</script>
<body>
    <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
       %>

       <div id="dialog-confirm" title="Sınav Siliniyor !" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Sınavı Silmek İstediğinize Emin misiniz?</p>
</div>

    <table border="1" cellpadding="1" cellspacing="1" id="rounded-corner">
        <thead>
            <tr>
                <td colspan="11">MEVCUT SINAVLAR</td>
                
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>Id</td>
            <td>Tarih</td>
            <td>Saat</td>
            <td>Sure</td>
            <td>Zorluk</td>
            <td>Soru</td>
            <td>Tür</td>
            <td>Durum</td>
            <td>Sil</td>
            <td>Sorular</td>
            <td>Detay</td>
            
        </tr>
        
        <%
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
    
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_anahat` WHERE  Hoca_ID=?;");
    pstmt.setString(1, personel.getHoca_ID());
    ResultSet result = pstmt.executeQuery();
    
    PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_bolum` WHERE  Sinav_ID=?;");
    
    
   
    
    String resim=null;
  
    
    while(result.next()){
    int    sayac=0;
    int    toplam=0;
    double    zorluk=0; 
    double  ortalama=0.0;
    pstmt2.setInt(1, result.getInt("Sinav_ID"));
    ResultSet result2 = pstmt2.executeQuery();
    while(result2.next()){
        sayac++;
        toplam=toplam+Integer.parseInt(result2.getString("SoruSayisi"));
        if(result2.getString("Zorluk").equals("6")){
        zorluk=zorluk+(5/2);
        }
        else{
        zorluk=zorluk+Integer.parseInt(result2.getString("Zorluk"));
        }
    }
        if(sayac==0){sayac=1;}
        
        if(Integer.parseInt(result.getString("Acikkapali"))==0){
        resim="../IMAGE/minus.png";
        }if(Integer.parseInt(result.getString("Acikkapali"))==1){
        resim="../IMAGE/play.png";
        }
   
        ortalama=(float)zorluk/sayac;
        
    out.println("<tr>");
    out.println("<td>"+result.getString("Sinav_ID")+"</td>");
    out.println("<td>"+result.getString("Tarih")+"</td>");
    out.println("<td>"+result.getString("Saat")+"</td>");
    out.println("<td>"+result.getString("Sure")+"</td>");
    out.println("<td>%"+(float)(ortalama*20)+"</td>");
    out.println("<td>"+toplam+"</td>");
    out.println("<td>"+result.getString("SinavTur")+"</td>");
    out.println("<td><a href=\"sinavDurum.jsp?AcikKapali="
            +result.getString("Acikkapali")+"&Sinav_ID="+result.getString("Sinav_ID")+" \"><img src=\""+resim+"\"/></a></td>");
    
    out.println("<td><a href=\"javascript:sil("
            +result.getString("Sinav_ID")+")\"><img src=\"../IMAGE/close.png\"/></a></td>");
    
    out.println("<td><a href=\"soruGor.jsp?Sinav_ID="
            +result.getString("Sinav_ID")+"\"><img src=\"../IMAGE/duzenle.png\"/></a></td>");
    
    out.println("<td><a href=\"sinavDetay.jsp?Sinav_ID="
            +result.getString("Sinav_ID")+"\"><img src=\"../IMAGE/forward.png\"/></a></td>");
    out.println("</tr>");

    
        
    }
        %>
        </tbody>
    </table>

       <%
    
}%>
       
</body>
</html>
