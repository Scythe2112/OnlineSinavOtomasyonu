
<%@page import="Methods.Aktar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Yonetici"%>


      <%
    Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
    
    if(yonetici==null){
        response.sendRedirect("../index.jsp");
    }else{
        
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        String Bolum_ID=request.getParameter("txtBolumID");
        String Birim=request.getParameter("txtBirim1");
        String Bolum_AD=request.getParameter("txtBolum");
        
        Bolum_AD=Aktar.Degis(Bolum_AD);
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`birim` WHERE Birim_Ad=? OR Birim_ID=?;");
        pstmt.setString(1,Bolum_AD);
        pstmt.setInt(2,Integer.parseInt(Bolum_ID));
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        response.sendRedirect("../yonetim2.jsp?giris=false");
        }
        else{
            String query2="INSERT INTO `sinav`.`birim`"
                + " (`Birim_Ad`,`Birim_ID`,`UstBirim_ID`)"
                + " VALUES(?,?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setString(1,Bolum_AD);
        pstmt2.setInt(2, Integer.parseInt(Bolum_ID));
        pstmt2.setInt(3, Integer.parseInt(Birim));
        boolean sonuc=pstmt2.execute();
        response.sendRedirect("../yonetim2.jsp?giris=true");
        }
    }
        %>
