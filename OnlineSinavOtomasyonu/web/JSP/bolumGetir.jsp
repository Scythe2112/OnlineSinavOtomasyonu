<%-- 
    Document   : bolumGetir
    Created on : 26.Tem.2013, 13:47:19
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
         
        String Ders_ID=request.getParameter("Ders_ID");
        String Birim_ID=request.getParameter("Birim_ID");
        
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        if(Ders_ID!=null){
            
            if(!Ders_ID.equals("0")){
            PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`bolum` WHERE Ders_ID=?;");
            pstmtDers.setInt(1,Integer.parseInt(Ders_ID));
            ResultSet resultpstmtDers = pstmtDers.executeQuery();
            out.println("<option value='0'>Bölüm Seç</option>");
            while(resultpstmtDers.next()){
            out.println("<option value='"+resultpstmtDers.getInt("Bolum_ID")+"'>"+resultpstmtDers.getString("Bolum_Ad")+"</option>");
            }
            
            }else{
            
            PreparedStatement pstmtDers1 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`Ders` WHERE Birim_ID=?;");
            pstmtDers1.setInt(1,Integer.parseInt(Birim_ID));
            ResultSet resultpstmtDers1 = pstmtDers1.executeQuery();
            out.println("<option value='0'>Bölüm Seç</option>");
            while(resultpstmtDers1.next()){
            
            int ders_ID=resultpstmtDers1.getInt("Ders_ID");
            PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`Bolum` WHERE Ders_ID=?;");
            pstmtDers.setInt(1,ders_ID);
            ResultSet resultpstmtDers = pstmtDers.executeQuery();
            
            while(resultpstmtDers.next()){
            out.println("<option value='"+resultpstmtDers.getInt("Bolum_ID")+"'>"+resultpstmtDers.getString("Bolum_Ad")+"</option>");
            }
            
            }
            
        
        
            }
        
    
    }
    }
    %>
</body>
</html>
