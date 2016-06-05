<%-- 
    Document   : ogrenciAnahtar
    Created on : 19.Tem.2013, 22:33:19
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
    <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
       %>

        <%
 
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
    
    String query="SELECT * FROM `sinav`.`ogrenci_cevap` WHERE Ogrenci_ID=? AND Sinav_ID=? AND Ozellik_ID=?;";
    String query2="SELECT * FROM `sinav`.`sinav_icerik` WHERE Sinav_ID=?;";
    String dizi[]={"","A","B","C","D","E"};
    PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(query2);
    pstmt2.setString(1,request.getParameter("Sinav_ID"));
    ResultSet result2=pstmt2.executeQuery();
       
    out.println("<table class=\"CSSTableGenerator\"><tr><td colspan=\"10\">"+request.getParameter("Ogrenci_ID")+"-No'lu Öğrenci Cevapları</td></tr>");
    int i=1;
    while(result2.next()){
    
    PreparedStatement pstmt=(PreparedStatement)con.prepareStatement(query);
    pstmt.setString(1,request.getParameter("Ogrenci_ID"));
    pstmt.setString(2,request.getParameter("Sinav_ID"));
    pstmt.setInt(3,result2.getInt("Soru_ID"));

    ResultSet result=pstmt.executeQuery();
    
    
    if(result.next()){
    if(i%11==0){out.println("<tr>");}
    
    out.println("<td>");
    out.println(i+"-"+dizi[Integer.parseInt(result.getString("Cevap"))]);
    out.println("</td>");
    
    if(i%11==0){out.println("</tr>");}
    
    }
    i++;
    }
    
    out.println("</table>");
    
        %>

        
       <%
    
}%>
       
</body>
</html>
