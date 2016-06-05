<%-- 
    Document   : dersGetir
    Created on : 26.Tem.2013, 11:45:34
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Yonetici"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");

    if(personel==null && yonetici==null){
    response.sendRedirect("../index.jsp");
    }else{
         
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        
        PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ders` ;");
        ResultSet resultpstmtDers = pstmtDers.executeQuery();
        
        String deger=request.getParameter("deger");
        if(deger==null){deger="0";}
        out.println("<option value='-1'>Ders Seç</option>");
        if(!deger.equals("1")){
        out.println("<option value='0' id='belirtme'>Belirtme</option>");

        }
        while(resultpstmtDers.next()){
        out.println("<option value='"+resultpstmtDers.getInt("Ders_ID")+"'>"+resultpstmtDers.getString("Ders_Ad")+"</option>");
        }
    
    
    }
    %>
</body>
</html>
