
<%-- 
    Document   : bolumGetir
    Created on : 26.Tem.2013, 13:47:19
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
         
        String AltBolum_ID=request.getParameter("AltBolum_ID");
        String Zorluk=request.getParameter("Zorluk");
        
        if(Integer.parseInt(AltBolum_ID)!=0){
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        if(AltBolum_ID!=null){
            if(!Zorluk.equals("6")){
        PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Zorluk=? AND Durum=1;");
        pstmtDers.setInt(1,Integer.parseInt(AltBolum_ID));
        pstmtDers.setString(2,Zorluk);

        ResultSet resultpstmtDers = pstmtDers.executeQuery();
        
        if(resultpstmtDers.next()){
        out.println("Mevcut Soru Sayısı:~"+resultpstmtDers.getInt(1));
        
        }
            }else{
            
            PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Durum=1;");
        pstmtDers.setInt(1,Integer.parseInt(AltBolum_ID));
        ResultSet resultpstmtDers = pstmtDers.executeQuery();
        
        if(resultpstmtDers.next()){
        out.println("Alt Bölüm Toplam Soru Sayısı:~"+resultpstmtDers.getInt(1));
        
        }
            
            }
    }
    }}
    %>
</body>
</html>
