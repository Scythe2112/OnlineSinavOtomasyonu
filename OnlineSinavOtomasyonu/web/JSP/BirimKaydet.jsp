
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
        
        String Birim_ID=request.getParameter("txtBirimID");
        String Birim_AD=request.getParameter("txtBirim");
        Birim_AD=Aktar.Degis(Birim_AD);
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ustbirim` WHERE UstBirim_Ad=? OR UstBirim_ID=?;");
        pstmt.setString(1,Birim_AD);
        pstmt.setInt(2,Integer.parseInt(Birim_ID));
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        response.sendRedirect("../yonetim2.jsp?giris=false");
        }
        else{
            String query2="INSERT INTO `sinav`.`ustbirim`"
                + " (`UstBirim_Ad`,`UstBirim_ID`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setString(1,Birim_AD);
        pstmt2.setInt(2, Integer.parseInt(Birim_ID));
        boolean sonuc=pstmt2.execute();
        response.sendRedirect("../yonetim2.jsp?giris=true");

        }
    }
        %>
