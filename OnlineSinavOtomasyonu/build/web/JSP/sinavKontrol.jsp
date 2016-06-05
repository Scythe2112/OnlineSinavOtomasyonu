<%-- 
    Document   : sinavKontrol
    Created on : 19.Tem.2013, 10:04:23
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
              <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
        String Numara=request.getParameter("txtNo");
        String sinav=request.getParameter("txtSinav");
        String buton=request.getParameter("buton");
        String iptal=request.getParameter("txtSinavIptal");
        
        int kayitSifirla=0;
        int kayitGuncelle=1;
        
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
    
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_sonuc` WHERE Ogrenci_ID=? AND Sinav_ID=?;");
    pstmt.setString(1, Numara);
    pstmt.setString(2, sinav);
    ResultSet result = pstmt.executeQuery();
    
    if(result.next()){
          
        if(Integer.parseInt(buton)== kayitGuncelle){
                
            PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`ogrenci_sonuc` "
                + " SET " 
                + " `Tekrar`= ?"
                + " WHERE Sinav_ID= ? AND Ogrenci_ID=? ;");
pstmt2.setString(1,"1");
pstmt2.setString(2,sinav);
pstmt2.setString(3,Numara);


int result2=pstmt2.executeUpdate();

    if(result2==1){
    out.println(Numara+"-Numaralı Öğrenciye");
    out.println(sinav+"-Numaralı sınav için");
    out.println("Kaldığı yerden devam hakkı verildi.");
    
    }
        
        }if(Integer.parseInt(buton)==kayitSifirla){
            
        PreparedStatement pstmtSilme1=(PreparedStatement)con.prepareStatement(
         " DELETE FROM `sinav`.`ogrenci_sonuc`"
         + "WHERE Sinav_ID=? AND Ogrenci_ID=?;");
        pstmtSilme1.setString(1, sinav);
        pstmtSilme1.setString(2, Numara);
        int resultSilme1=pstmtSilme1.executeUpdate();
        
        PreparedStatement pstmtSilme2=(PreparedStatement)con.prepareStatement(
         " DELETE FROM `sinav`.`ogrenci_cevap`"
         + "WHERE Sinav_ID=? AND Ogrenci_ID=?;");
        pstmtSilme2.setString(1, sinav);
        pstmtSilme2.setString(2, Numara);
        int resultSilme2=pstmtSilme2.executeUpdate();

        out.println(Numara+"-Numaralı Öğrencinin");
        out.println(sinav+":Numaralı sınav için ");
        out.println("Kaydı Sıfırlanmıştır.");


        }
          }else{
    out.println(Numara+"-Numaralı Öğrencinin");
    out.println(sinav+"-Numaralı sınav için");
    out.println("Kaydı Mevcut Değil.");
    }


    
    
    
       %>
       
       
       
       
       
       <% 
    
    }
       %>
       
</body>
</html>
