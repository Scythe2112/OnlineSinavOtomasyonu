
<%-- 
    Document   : BolumKaydet
    Created on : 28.Eyl.2013, 21:35:46
    Author     : Nuri
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Yonetici"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
      <%
    Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
    
    if(yonetici==null){
        response.sendRedirect("../index.jsp");
    }else{
        
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        PreparedStatement pstmtID = (PreparedStatement) con.prepareStatement("SELECT MAX(Hoca_ID) FROM `sinav`.`hoca` ");
        ResultSet resultID=pstmtID.executeQuery();
        
        int HocaID=0;
        if(resultID.next()){
            HocaID=resultID.getInt(1);
        }
        
        String HocaAd=request.getParameter("HocaAd");
        String HocaSoyad=request.getParameter("HocaSoyad");
        String HocaSifre=request.getParameter("HocaSifre");
        String HocaPosta=request.getParameter("HocaPosta");
        String HocaBirim=request.getParameter("HocaBirimHoca");
        
        if(HocaAd!="" &&HocaSoyad!="" &&HocaSifre!="" &&HocaPosta!="" &&HocaBirim!=""){
        HocaAd=Methods.Aktar.Degis(HocaAd);
        HocaSoyad=Methods.Aktar.Degis(HocaSoyad);
        HocaSifre=Methods.Aktar.Degis(HocaSifre);
        HocaPosta=Methods.Aktar.Degis(HocaPosta);
        HocaBirim=Methods.Aktar.Degis(HocaBirim);

        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE Hoca_Ad=? AND Hoca_Soyadi=?;");
        pstmt.setString(1,HocaAd);
        pstmt.setString(2,HocaSoyad);

        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        response.sendRedirect("../yonetim1.jsp?hhs=N239ND25");
        }
        else{
            String query2="INSERT INTO `sinav`.`hoca`"
                + " (`Hoca_ID`,`Hoca_Ad`,`Hoca_Soyadi`,`Hoca_Sifre`,`Hoca_Email`,`Birim_ID`)"
                + " VALUES(?,?,?,?,?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setInt(1,(HocaID+12));
        pstmt2.setString(2, HocaAd);
        pstmt2.setString(3, HocaSoyad);
        pstmt2.setString(4, HocaSifre);
        pstmt2.setString(5, HocaPosta);
        pstmt2.setInt(6, Integer.parseInt(HocaBirim));
        boolean sonuc=pstmt2.execute();
         
        response.sendRedirect("../yonetim1.jsp?hhs=DCW2F260");
        }
        }else{
        response.sendRedirect("../yonetim1.jsp?hhs=MFA");
        }
    }
        %>
</body>
</html>
