<%-- 
    Document   : sifreDegis
    Created on : 19.Tem.2013, 15:14:11
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.Personel"%>


               <% 
 Personel personel=(Personel)session.getAttribute("personelInfo");

 if(personel==null){
     response.sendRedirect("../index.jsp");
 }
 else{
     
     String sifre=request.getParameter("txtSifre");
     String yeniSifre=request.getParameter("txtYeniSifre");
     
     baglan baglanti = new baglan();
     Connection con = baglanti.VeritabaninaBaglan();
     
     PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE Hoca_ID=? AND Hoca_Sifre=?;");
     pstmt.setInt(1,Integer.parseInt(personel.getHoca_ID()));
     pstmt.setString(2,sifre);

     ResultSet result=pstmt.executeQuery();
     
     if(result.next()){
         PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`hoca` "
                + " SET " 
                + " `Hoca_Sifre` = ?"
                + " WHERE Hoca_ID= ? ;");
pstmt2.setString(1, yeniSifre);
pstmt2.setInt(2,Integer.parseInt(personel.getHoca_ID()));
int result2=pstmt2.executeUpdate();
out.println("Şifre Başarı ile Değiştirildi.");
     
     }else{
     
         out.println("Mevcut Şifre Yanlış");
     }
     
        %>
        
        
        <%
 }
        %>

