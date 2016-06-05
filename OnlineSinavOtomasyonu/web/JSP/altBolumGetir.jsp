<%-- 
    Document   : altBolumGetir
    Created on : 26.Tem.2013, 13:48:52
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    if(personel==null){
    response.sendRedirect("../index.jsp");
    }else{
         
        String Bolum_ID=request.getParameter("Bolum_ID");
        
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        if(Bolum_ID!=null){
        PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`altbolum` WHERE Bolum_ID=?;");
        pstmtDers.setInt(1,Integer.parseInt(Bolum_ID));
        ResultSet resultpstmtDers = pstmtDers.executeQuery();
        
        out.println("<option value='0'>Alt Bölüm Seç</option>");
        while(resultpstmtDers.next()){
        out.println("<option value='"+resultpstmtDers.getInt("AltBolum_ID")+"'>"+resultpstmtDers.getString("AltBolum_Ad")+"</option>");
        }
    
    }
    }
    %>
</body>
</html>
