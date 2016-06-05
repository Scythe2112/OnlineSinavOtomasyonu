
<%@page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>
      <%
    Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
      Personel personel=(Personel)session.getAttribute("personelInfo");
    
    if(yonetici==null && personel==null){
        response.sendRedirect("../index.jsp");
    }else{
        
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        String Konu=request.getParameter("txtKonu");
        String Ders=request.getParameter("txtDers1");
        
        Konu=Methods.Aktar.Degis(Konu);
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`bolum` WHERE Bolum_Ad=?;");
        pstmt.setString(1,Konu);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
                    if(yonetici!=null){
            response.sendRedirect("../yonetim2.jsp?giris=false");
            }else{
            response.sendRedirect("sorular.jsp?giris=false");
            }
        }
        else{
            String query2="INSERT INTO `sinav`.`bolum`"
                + " (`Bolum_Ad`,`Ders_ID`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setString(1,Konu);
        pstmt2.setInt(2, Integer.parseInt(Ders));
        boolean sonuc=pstmt2.execute();
                    if(yonetici!=null){
            response.sendRedirect("../yonetim2.jsp?giris=true");
            }else{
            response.sendRedirect("sorular.jsp?giris=true");
            }

        }
    }
        %>

