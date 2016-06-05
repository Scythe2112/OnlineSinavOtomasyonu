<%-- 
    Document   : bolumSil
    Created on : 27.Tem.2013, 20:24:50
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
   <%
     Personel personel=(Personel)session.getAttribute("personelInfo");

        if(personel==null){
        response.sendRedirect("../index.jsp");
                      }
        else{
            
    String ID=request.getParameter("ID");
   
    baglan nesne=new baglan();
    Connection connection=(Connection)nesne.VeritabaninaBaglan();

PreparedStatement pstmt1=(PreparedStatement)connection.prepareStatement(
         " DELETE FROM `sinav`.`sinav_bolum`"
         + "WHERE ID=?;");

pstmt1.setInt(1, Integer.parseInt(ID));

int resultSet1=pstmt1.executeUpdate();

   %>
   
   
   <%
        }
   %>
</body>
</html>
