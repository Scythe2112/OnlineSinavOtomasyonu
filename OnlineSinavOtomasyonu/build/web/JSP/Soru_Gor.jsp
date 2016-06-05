<%@page import="Methods.baglan"%>
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
       String Ozellik_ID=request.getParameter("Ozellik_ID");
       
       baglan baglanti = new baglan();
       Connection con = baglanti.VeritabaninaBaglan();
        
       PreparedStatement pstmt2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Ozellik_ID=?;");           
       PreparedStatement pstmt3 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=?;");   
                
       ResultSet result2;
       ResultSet result3;
       
       pstmt2.setInt(1,Integer.parseInt(Ozellik_ID));
       result2=pstmt2.executeQuery();
       
        if(result2.next()){
            out.println("Soru:");
            out.println(result2.getString("Soru"));
        }
        
         pstmt3.setInt(1,Integer.parseInt(Ozellik_ID));
         result3=pstmt3.executeQuery();
         
            out.println("Cevaplar:");
            while(result3.next()){
            out.println(result3.getString("Cevap"));if(result3.getString("DogruYanlis_ID").equals("0")){out.println("Y");}else{out.println("D");}
                 
             }
         
       }
    %>

