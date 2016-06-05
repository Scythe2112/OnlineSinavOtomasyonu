<%-- 
    Document   : sessionDegis
    Created on : 01.Eki.2013, 19:14:46
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Ogrenci"%>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
          <%
 Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

 if(ogrenci==null){
     response.sendRedirect("../index.jsp");
 }
 else{
     String deger=request.getParameter("deger");
     session.setAttribute("sira", Integer.parseInt(deger));
 }
 %>
 
 
 
</body>
</html>
