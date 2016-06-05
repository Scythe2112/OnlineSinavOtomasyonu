<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        
      Yonetici  uye=(Yonetici)session.getAttribute("yoneticiInfo");
      if(uye==null)
      {
      response.sendRedirect("../index.jsp");
      }
      else
      {
       String islem=request.getParameter("islem");
       String Ozellik_ID=request.getParameter("Ozellik_ID");
       
       veritabani.baglanti database = new veritabani.baglanti();
        
       if(islem.equals("1")){
           
       String query = " UPDATE `sinav`.`soruozellik` "
                + " SET "
                + " `Durum` = ?"
                + " WHERE Ozellik_ID= ? ;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,1);
       pstmt.setInt(2,Integer.parseInt(Ozellik_ID));
       int result = pstmt.executeUpdate();
       out.print("1");
       }else if(islem.equals("2")){
           
       String query ="DELETE FROM `sinav`.`soruozellik`"
         + "WHERE Ozellik_ID=?;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,Integer.parseInt(Ozellik_ID));
       int result = pstmt.executeUpdate();
       out.print("2");
       }
       }
    %>

