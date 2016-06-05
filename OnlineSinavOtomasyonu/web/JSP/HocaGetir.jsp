<%-- 
    Document   : HocaGetir
    Created on : 02.Eki.2013, 11:00:14
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
         
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        
        PreparedStatement pstmtHoca = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`hoca` ;");
        
        ResultSet resultpstmtHca = pstmtHoca.executeQuery();
        
        out.println("<option value=''>Hoca Seç</option>");
        out.println("<option value='1'>ADMİN</option>");
        while(resultpstmtHca.next()){
        out.println("<option value='"+resultpstmtHca.getInt("Hoca_ID")+"'>"+resultpstmtHca.getString("Hoca_Ad")+" "+resultpstmtHca.getString("Hoca_Soyadi")+"</option>");
        }
    
    
    }
    %>
</body>
</html>
