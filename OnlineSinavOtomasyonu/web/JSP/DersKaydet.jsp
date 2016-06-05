
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
        
        String Ders_ID=request.getParameter("txtDersID");
        String Ders_AD=request.getParameter("txtDers");
        Ders_AD=Aktar.Degis(Ders_AD);
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ders` WHERE Ders_Ad=? OR Ders_ID=?;");
        pstmt.setString(1,Ders_AD);
        pstmt.setInt(2,Integer.parseInt(Ders_ID));
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
           response.sendRedirect("../yonetim2.jsp?giris=false");
        }
        else{
            String query2="INSERT INTO `sinav`.`ders`"
                + " (`Ders_Ad`,`Ders_ID`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setString(1,Ders_AD);
        pstmt2.setInt(2, Integer.parseInt(Ders_ID));
        boolean sonuc=pstmt2.execute();
        response.sendRedirect("../yonetim2.jsp?giris=true");
        }
    }
        %>
