<%-- 
    Document   : mesajKayit
    Created on : 23.Tem.2013, 23:05:16
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Methods.Aktar"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
  <%
  Personel personel=(Personel)session.getAttribute("personelInfo");
  Ogrenci  ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");
  Yonetici  yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
  
  if(personel==null && ogrenci==null && yonetici==null){
      response.sendRedirect("../index.jsp");
  }else{
  
      baglan baglanti = new baglan();
      Connection con = baglanti.VeritabaninaBaglan();  
      Methods.Aktar aktar=new Methods.Aktar();
      String mesaj_Alan=request.getParameter("mesaj_Alan");
            String mesaj_Gonderen=request.getParameter("mesaj_Gonderen");
                      String mesaj_Mesaj=request.getParameter("mesaj_Mesaj");
                      
                      mesaj_Alan=aktar.Degis(mesaj_Alan);
                      mesaj_Gonderen=aktar.Degis(mesaj_Gonderen);
                      mesaj_Mesaj=aktar.Degis(mesaj_Mesaj);

                      
                      if(personel!=null){
              PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci` WHERE  Ogrenci_ID=?;");
    pstmt2.setString(1, mesaj_Alan);
    ResultSet result2 = pstmt2.executeQuery();
    
    PreparedStatement pstmt3 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE  Hoca_ID=?;");
    pstmt3.setString(1, mesaj_Alan);
    ResultSet result3 = pstmt3.executeQuery();
    
    if(!result2.next() && !mesaj_Alan.equals("1") && !result3.next()){
    response.sendRedirect("mesajlar.jsp?shh=PW2H9M");
    }
    else{
        
    String query="INSERT INTO `sinav`.`mesaj`( "
               + "`mesaj_Alan`,"
               + "`mesaj_Gonderen`,"
               + "`mesaj_Mesaj`,"
               + "`mesaj_Durum`)"
               + "VALUES(?,?,?,?);";               
       
     
       
      PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(query);
      pstmt.setString(1, mesaj_Alan);
      pstmt.setString(2, mesaj_Gonderen);
      pstmt.setString(3, mesaj_Mesaj);
      pstmt.setString(4, "0");
      
      boolean sonuc=pstmt.execute();
      response.sendRedirect("mesajlar.jsp?shh=HNA19LE");
    }
             }else if(yonetici!=null){
             
              PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE  Hoca_ID=?;");
    pstmt2.setString(1, mesaj_Alan);
    ResultSet result2 = pstmt2.executeQuery();
    if(!result2.next()){
    response.sendRedirect("yonetim.jsp?hsh=2MD9F8");
    }else{
        
    String query="INSERT INTO `sinav`.`mesaj`( "
               + "`mesaj_Alan`,"
               + "`mesaj_Gonderen`,"
               + "`mesaj_Mesaj`,"
               + "`mesaj_Durum`)"
               + "VALUES(?,?,?,?);";               
       
     
       
      PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(query);
      pstmt.setString(1, mesaj_Alan);
      pstmt.setString(2, "1");
      pstmt.setString(3, mesaj_Mesaj);
      pstmt.setString(4, "0");
      
      boolean sonuc=pstmt.execute();
      response.sendRedirect("yonetim.jsp?hsh=2JF28D1");
             
             }}
           else{           
       String query="INSERT INTO `sinav`.`mesaj`( "
               + "`mesaj_Alan`,"
               + "`mesaj_Gonderen`,"
               + "`mesaj_Mesaj`,"
               + "`mesaj_Durum`)"
               + "VALUES(?,?,?,?);";               
       
     
       
      PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(query);
      pstmt.setString(1, mesaj_Alan);
      pstmt.setString(2, mesaj_Gonderen);
      pstmt.setString(3, mesaj_Mesaj);
      pstmt.setString(4, "0");
      
      boolean sonuc=pstmt.execute();
      response.sendRedirect("ogrenci.jsp?ssh=DY12NDW");
      }
      %>
  
    
    
  <%
  }
  %>
    
</body>
</html>
