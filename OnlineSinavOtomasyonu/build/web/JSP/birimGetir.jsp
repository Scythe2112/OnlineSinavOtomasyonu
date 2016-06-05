<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Yonetici"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

     <%
    Personel personel=(Personel)session.getAttribute("personelInfo");
     Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");

    if(personel==null && yonetici==null){
    response.sendRedirect("../index.jsp");
    }else{
         
        String UstBirim_ID=request.getParameter("UstBirim_ID");
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        if(UstBirim_ID!=null){
        PreparedStatement pstmtDers = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`birim` WHERE UstBirim_ID=?;");
        pstmtDers.setInt(1,Integer.parseInt(UstBirim_ID));
        ResultSet resultpstmtDers = pstmtDers.executeQuery();
        
        out.println("<option value='0'>Bölüm Seç</option>");
        while(resultpstmtDers.next()){
        out.println("<option value='"+resultpstmtDers.getInt("Birim_ID")+"'>"+resultpstmtDers.getString("Birim_Ad")+"</option>");
        }
    
    }
    }
    %>

