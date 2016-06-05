<%-- 
    Document   : SoruKaydet
    Created on : 29.Eyl.2013, 22:44:25
    Author     : Nuri
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Ogrenci"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
</head>
<body>
       <%
 Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

 if(ogrenci==null){
     response.sendRedirect("../index.jsp");
 }
 else{
     
     
     int sira=(Integer)session.getAttribute("sira");
     String Sinav_ID=request.getParameter("Sinav_ID");
     String Ozellik_ID=request.getParameter("Ozellik_ID");
     String deger=request.getParameter("deger");
     String boyut=request.getParameter("boyut");

     
      baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement
            ("SELECT * FROM `sinav`.`ogrenci_cevap` WHERE  Sinav_ID=? AND Ogrenci_ID=? AND Ozellik_ID=?;");
    pstmt.setInt(1,Integer.parseInt(Sinav_ID));
    pstmt.setInt(2,Integer.parseInt(ogrenci.getOgrenci_ID()));
    pstmt.setInt(3,Integer.parseInt(Ozellik_ID));

    ResultSet result = pstmt.executeQuery();
    
    if(result.next()){
        PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`ogrenci_cevap` "
                + " SET " 
                + " `Cevap` = ?"
                + " WHERE Sinav_ID=? AND Ogrenci_ID=? AND Ozellik_ID=?;");
pstmt2.setInt(1,Integer.parseInt(deger));
pstmt2.setInt(2,Integer.parseInt(Sinav_ID));
pstmt2.setInt(3,Integer.parseInt(ogrenci.getOgrenci_ID()));
pstmt2.setInt(4,Integer.parseInt(Ozellik_ID));
int sonuc2=pstmt2.executeUpdate();

        
    }else{
    PreparedStatement pstmt3=(PreparedStatement)con.prepareStatement(
         " INSERT INTO `sinav`.`ogrenci_cevap`"
         + "(`Ogrenci_ID`,"
         + "`Sinav_ID`,"
         + "`Ozellik_ID`,"
         + "`Cevap`)"
         + "VALUES"
         + "(?,?,?,?);");
pstmt3.setInt(1,Integer.parseInt(ogrenci.getOgrenci_ID()));
pstmt3.setInt(2,Integer.parseInt(Sinav_ID));
pstmt3.setInt(3,Integer.parseInt(Ozellik_ID));
pstmt3.setInt(4,Integer.parseInt(deger));

boolean result3=pstmt3.execute();
    
    
    }
        Date date=new Date();
        PreparedStatement pstmt22 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_bolum` WHERE  Sinav_ID=?;");
               pstmt22.setInt(1, Integer.parseInt(Sinav_ID));
               ResultSet result22=pstmt22.executeQuery();
               
               int toplam=0;
               while(result22.next()){
                toplam=toplam+Integer.parseInt(result22.getString("SoruSayisi"));
               }
    
        PreparedStatement pstmt4 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_cevap` WHERE Sinav_ID=? AND Ogrenci_ID=? ;");
        
        PreparedStatement pstmt5 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE Sinav_ID=? AND Soru_ID=?;");
    
        pstmt4.setInt(1, Integer.parseInt(Sinav_ID));
        pstmt4.setInt(2, Integer.parseInt(ogrenci.getOgrenci_ID()));
        ResultSet result4=pstmt4.executeQuery();
                            
        PreparedStatement pstmt7 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ogrenme` where ozellik_id=? ;");
        PreparedStatement pstmt16 = (PreparedStatement) con.prepareStatement("UPDATE `sinav`.`ogrenme` SET `dogru_sayi`=? , `yanlis_sayi`=? WHERE ozellik_id=? ;");
       
                        
                        int sayac=0;
                        int dogru;
                        int yanlis;
                        int result16;
                        while(result4.next()){
                        dogru=0;
                        yanlis=0;
                        int Ozellik=result4.getInt("Ozellik_ID");
                        int cevap=result4.getInt("Cevap");
                        
                        pstmt5.setInt(1, Integer.parseInt(Sinav_ID));
                        pstmt5.setInt(2, Ozellik);
                        ResultSet result5=pstmt5.executeQuery();
                        
                        pstmt7.setInt(1, Ozellik);
                        ResultSet result7=pstmt7.executeQuery();
                        if(result7.next()){
                            dogru=result7.getInt("dogru_sayi");
                            yanlis=result7.getInt("yanlis_sayi");
                        }
                        
                        if(result5.next()){
                        int gelen=result5.getInt("DogruCevap_ID");
                        if(cevap==gelen){
                        sayac++;
                        dogru++;
                        }else{
                        yanlis++;
                        }
                        }
                        
                        pstmt16.setInt(1, 3);
                        pstmt16.setInt(2, 2);
                        pstmt16.setInt(3, Ozellik);

                        result16=pstmt16.executeUpdate();
                        
                        }
                        
                        
                        
                        
                        
                         PreparedStatement pstmt6=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`ogrenci_sonuc` "
                + " SET " 
                + " `Giris_IP` = ?,"
                + " `SinavNotu` = ?,"
                + " `CikisSaat` = ?"
                + " WHERE Sinav_ID=? AND Ogrenci_ID=?;");
pstmt6.setString(1,request.getRemoteAddr());
pstmt6.setInt(2,(100/toplam)*sayac);
pstmt6.setString(3,date.getHours()+"."+date.getMinutes());
pstmt6.setInt(4,Integer.parseInt(Sinav_ID));
pstmt6.setInt(5,Integer.parseInt(ogrenci.getOgrenci_ID()));
int sonuc6=pstmt6.executeUpdate();

                        
    
     %>
     
     <%
    
    
    if(sira==Integer.parseInt(boyut)-1){sira=Integer.parseInt(boyut)-1;}
    else{sira++;}
    
     
    session.setAttribute("sira", sira);
 }
     %>
    <jsp:include page="sinavSoru.jsp"></jsp:include>
</body>
</html>
