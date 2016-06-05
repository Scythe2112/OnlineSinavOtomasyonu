<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Methods.Aktar"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>

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
      String mesaj_Mesaj=request.getParameter("mesaj_Mesaj");
                      
      mesaj_Alan=aktar.Degis(mesaj_Alan);
      mesaj_Mesaj=aktar.Degis(mesaj_Mesaj);

                      
    if(yonetici!=null){

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
      out.print("Mesajınız Gönderildi.");
    
             }
  
    
       else if(personel!=null){

    String query="INSERT INTO `sinav`.`mesaj`( "
               + "`mesaj_Alan`,"
               + "`mesaj_Gonderen`,"
               + "`mesaj_Mesaj`,"
               + "`mesaj_Durum`)"
               + "VALUES(?,?,?,?);";               
       
     
       
      PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(query);
      pstmt.setString(1, mesaj_Alan);
      pstmt.setString(2, personel.getHoca_ID());
      pstmt.setString(3, mesaj_Mesaj);
      pstmt.setString(4, "0");
      
      boolean sonuc=pstmt.execute();
      out.print("Mesajınız Gönderildi.");
    
             }
    else if(ogrenci!=null){

    String query="INSERT INTO `sinav`.`mesaj`( "
               + "`mesaj_Alan`,"
               + "`mesaj_Gonderen`,"
               + "`mesaj_Mesaj`,"
               + "`mesaj_Durum`)"
               + "VALUES(?,?,?,?);";               
       
     
       
      PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(query);
      pstmt.setString(1, mesaj_Alan);
      pstmt.setString(2, ogrenci.getOgrenci_ID());
      pstmt.setString(3, mesaj_Mesaj);
      pstmt.setString(4, "0");
      
      boolean sonuc=pstmt.execute();
      out.print("Mesajınız Gönderildi.");
    
             }
  
  
  }
      %>

