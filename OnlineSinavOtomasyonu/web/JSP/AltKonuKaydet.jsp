<%@page import="Methods.Aktar"%>
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
        
        String Bolum_ID=request.getParameter("txtKonu1");
        String AltBolum_Ad=request.getParameter("txtAltKonu");
        AltBolum_Ad=Aktar.Degis(AltBolum_Ad);
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`altbolum` WHERE AltBolum_Ad=?;");
        pstmt.setString(1,AltBolum_Ad);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
            if(yonetici!=null){
            response.sendRedirect("../yonetim2.jsp?giris=false");
            }else{
            response.sendRedirect("sorular.jsp?giris=false");
            }

        }
        else{
            String query2="INSERT INTO `sinav`.`altbolum`"
                + " (`AltBolum_Ad`,`Bolum_ID`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setString(1,AltBolum_Ad);
        pstmt2.setInt(2, Integer.parseInt(Bolum_ID));
        boolean sonuc=pstmt2.execute();
         
            if(yonetici!=null){
            response.sendRedirect("../yonetim2.jsp?giris=true");
            }else{
            response.sendRedirect("sorular.jsp?giris=true");
            }

        }
    }
        %>

