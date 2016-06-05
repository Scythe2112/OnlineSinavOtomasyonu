<%-- 
    Document   : logoutYonetici
    Created on : 30.Tem.2013, 13:45:07
    Author     : Nuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
session.setAttribute("yoneticiInfo", null);
response.sendRedirect("index.jsp");
%>
