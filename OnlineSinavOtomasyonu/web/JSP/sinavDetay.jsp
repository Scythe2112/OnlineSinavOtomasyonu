<%-- 
    Document   : sinavDetay
    Created on : 19.Tem.2013, 15:14:11
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
    <link type="text/css" href="../CSS/personel.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script type="text/javascript" src="../JS/sinavDetay.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<body>
    <div   id="sc" style="float: left;"><a href="personel.jsp"><img src="../IMAGE/left.png"/></a></div>
    <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        String dizi[]={"","A","B","C","D","E"};
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_sonuc` WHERE  Sinav_ID=?;");
   
        PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci` WHERE  Ogrenci_ID=?;");
        
    pstmt.setString(1, request.getParameter("Sinav_ID"));
    ResultSet result = pstmt.executeQuery();
    
    
       %>
<div class="CSSTableGenerator" style="position:absolute;top:80px;left:10px; width:850px;overflow-y: scroll; min-height:550px; max-height: 550px;">

    <table border="1" cellpadding="10" cellspacing="2">
        <thead>
            <tr>
                <td colspan="11">
                    <%
                    out.println(request.getParameter("Sinav_ID")+"-Nolu Sinav Sonuçları");
                    %>
                </td>
                
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>Numara</td>
            <td>AD</td>
            <td>Soyad</td>
            <td>Giriş Tarihi</td>
            <td>Giriş Saati</td>
            <td>Çıkış Saati</td>
            <td>Giriş IP Adresi</td>
            <td>Sınav Notu</td>
            <td>Cevaplar</td>
            
        </tr>
        
        <%

    while(result.next()){
    out.println("<tr>");
    out.println("<td>"+result.getString("Ogrenci_ID")+"</td>");
    
    pstmt2.setString(1,result.getString("Ogrenci_ID"));
    ResultSet result2 = pstmt2.executeQuery();
    
    if(result2.next()){   
    out.println("<td>"+result2.getString("Ogrenci_Ad")+"</td>");
    out.println("<td>"+result2.getString("Ogrenci_Soyad")+"</td>");}
    
    out.println("<td>"+result.getString("GirisZaman")+"</td>");
    out.println("<td>"+result.getString("GirisSaat")+"</td>");
    out.println("<td>"+result.getString("CikisSaat")+"</td>");
    out.println("<td>"+result.getString("Giris_IP")+"</td>");
    out.println("<td>"+result.getString("SinavNotu")+"</td>");
    out.println("<td><a href=\"javascript:sinavDetayGor('"+result.getString("Ogrenci_ID")+"','"+request.getParameter("Sinav_ID")+"')\"><img src=\"../IMAGE/search.png\"/></a></td>");
    out.println("</tr>");

    
        
    }
        %>
        </tbody>
    </table>
</div>
        
        <div style="position:absolute;top:80px;left:880px; width:450px;overflow-y: scroll; min-height:250px; max-height: 350px;background-color:rgb(238,238,238);">
            <table class="CSSTableGenerator"><tr><td>SINAV CEVAP ANAHTARI</td></tr></table>
            <table class="CSSTableGenerator"><tr></tr>
                <% 
                
    PreparedStatement pstmt3 = 
       (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE  Sinav_ID=?;");
        
    pstmt3.setString(1, request.getParameter("Sinav_ID"));
    ResultSet result3 = pstmt3.executeQuery();
    
        for(int i=1;result3.next();i++){
            if(i%11==0){out.println("<tr>");}
            out.println("<td>");    
            out.println(i+"-"+dizi[Integer.parseInt(result3.getString("DogruCevap_ID"))]);
            out.println("</td>");   
            if(i%11==0){out.println("</tr>");}
        }
                %>
                
            </table>
        </div>
        
<div id="OgrenciAnahtar" style="position:absolute;top:380px;left:880px; width:450px;overflow-y: scroll; min-height:250px; max-height: 350px;background-color:rgb(238,238,238);">       
        </div>
       <%
    
}
       %>
       
</body>
</html>
