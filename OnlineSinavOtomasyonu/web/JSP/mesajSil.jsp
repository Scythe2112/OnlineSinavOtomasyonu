<%-- 
    Document   : mesajSil
    Created on : 27.Tem.2013, 23:49:42
    Author     : Nuri
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Yonetici"%>
<%@page import="Beans.Ogrenci"%>
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
Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");
Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");

if(personel==null && ogrenci==null && yonetici==null)
{

response.sendRedirect("../index.jsp");

}else
{
String id=request.getParameter("mesaj_ID");
 
        baglan nesne=new baglan();
        Connection connection=(Connection)nesne.VeritabaninaBaglan();

PreparedStatement pstmt1=(PreparedStatement)connection.prepareStatement(
         " DELETE FROM `sinav`.`mesaj`"
         + "WHERE mesaj_ID=?;");

pstmt1.setString(1, id);

int resultSet1=pstmt1.executeUpdate();

if(ogrenci!=null){
response.sendRedirect("ogrenci.jsp#tabs-2");
}else if(personel!=null){
response.sendRedirect("mesajlar.jsp");
}else{
response.sendRedirect("../yonetim3.jsp");

}

}
%>
</body>
</html>
