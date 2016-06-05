<%-- 
    Document   : sinavOlustur
    Created on : 26.Tem.2013, 17:24:14
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script  type="text/javascript" src="../jquery.js"></script>
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<body>
    <%
      Personel personel=(Personel)session.getAttribute("personelInfo");

        if(personel==null){
        response.sendRedirect("../index.jsp");
                      }
        else{
            
        baglan baglanti = new baglan();
        Connection connection = baglanti.VeritabaninaBaglan();
        
        PreparedStatement pstmt2=(PreparedStatement)connection.prepareStatement(
         " INSERT INTO `sinav`.`sinav_anahat` "
         + " (`Sinav_ID`,"
         + "`Birim_ID`,"
         + "`Ders_ID`,"
         + "`Tarih`,"
         + "`Saat`,"
         + "`Sure`,"
         + "`AcikKapali`,"
         + "`Hoca_ID`,"
         + "`SinavTur` )"
         + "VALUES"
         + "(?,?,?,?,?,?,?,?,?);");

pstmt2.setInt(1, Integer.parseInt(request.getParameter("Sinav_ID")));
pstmt2.setInt(2, Integer.parseInt(request.getParameter("Birim_ID")));
pstmt2.setInt(3, Integer.parseInt(request.getParameter("Ders_ID")));
pstmt2.setString(4, request.getParameter("Tarih"));
pstmt2.setString(5, request.getParameter("Saat"));
pstmt2.setString(6, request.getParameter("Sure"));
pstmt2.setString(7, "0");
pstmt2.setInt(8, Integer.parseInt(personel.getHoca_ID()));
pstmt2.setString(9, request.getParameter("SinavTur"));


boolean resultSet2=pstmt2.execute();
  if(resultSet2==false){  
out.println("Sınav oluşturuldu.Lütfen soru ekleyin.");
  }else{
  
  }  
    %>
    
    
    
    <%
    }
    %>
</body>
</html>
