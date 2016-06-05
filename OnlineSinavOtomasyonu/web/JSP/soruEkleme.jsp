<%-- 
    Document   : soruEkleme
    Created on : 21.Tem.2013, 23:09:37
    Author     : Nuri
--%>

<%@page import="Methods.Aktar"%>
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
    
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" >
      $(document).ready(function(){
          
      });  
        
    </script>
</head>
<body>
    <%
        
    Personel personel=(Personel)session.getAttribute("personelInfo");

    if(personel==null){
    response.sendRedirect("../index.jsp");
                      }
    else{
        
        String AltBolum_ID=request.getParameter("AltBolum_ID");
        String sayac=request.getParameter("sayac");
        String Soru=request.getParameter("txtSoru");
        String Zorluk=request.getParameter("boxSoru");
        String Resim=request.getParameter("selectSoru");
        
        AltBolum_ID=Aktar.Degis(AltBolum_ID);
        sayac=Aktar.Degis(sayac);
        Soru=Aktar.Degis(Soru);
        Zorluk=Aktar.Degis(Zorluk);
        
        if(Resim!=null){
        Resim=Aktar.Degis(Resim);
        }
        
        int Ozellik_ID=0;
        String cevap=null;
        String cevapDurum=null;
        String  cevapResim=null;
        
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
    
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT MAX(Ozellik_ID) FROM `sinav`.`soruozellik` ;");
        ResultSet result = pstmt.executeQuery();
        if(result.next()){
        Ozellik_ID=result.getInt(1)+1;
        }
        String query2="INSERT INTO `sinav`.`soruozellik`"
                + " (`AltBolum_ID`,`Ozellik_ID`,`Hoca_ID`,`Zorluk`,`Durum`)"
                + " VALUES(?,?,?,?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement) con.prepareStatement(query2);
        pstmt2.setInt(1, Integer.parseInt(AltBolum_ID));
        pstmt2.setInt(2, Ozellik_ID);
        pstmt2.setInt(3, Integer.parseInt(personel.getHoca_ID()));
        pstmt2.setString(4, Zorluk);
        pstmt2.setInt(5, 0);
        boolean sonuc=pstmt2.execute();
        
        String query12="INSERT INTO `sinav`.`ogrenme`"
                + " (`ozellik_id`,`dogru_sayi`,`yanlis_sayi`)"
                + " VALUES(?,?,?);";
        
        PreparedStatement pstmt12=(PreparedStatement) con.prepareStatement(query12);
        pstmt12.setInt(1, Ozellik_ID);
        pstmt12.setInt(2, 0);
        pstmt12.setInt(3, 0);
        boolean sonuc12=pstmt12.execute();
        
        String query3="INSERT INTO `sinav`.`soru`"
                + " (`Ozellik_ID`,`Soru`,`resim_Ad`)"
                + " VALUES(?,?,?);";
        
        PreparedStatement pstmt3=(PreparedStatement) con.prepareStatement(query3);
        pstmt3.setInt(1, Ozellik_ID);
        pstmt3.setString(2, Soru);
        pstmt3.setString(3, Resim);
        boolean sonuc3=pstmt3.execute();
        
        
                String query4="INSERT INTO `sinav`.`cevap`"
                + " (`Ozellik_ID`,`Cevap`,`resim_Ad`,`DogruYanlis_ID`)"
                + " VALUES(?,?,?,?);";
        
        PreparedStatement pstmt4=(PreparedStatement) con.prepareStatement(query4);
        
        int i=1;
        while(true){
         
         
         cevapDurum=request.getParameter("box2"+i);
         if(cevapDurum==null){break;}
         cevap=request.getParameter("txt"+i);
         cevapResim=request.getParameter("select"+i);
         
         cevap=Aktar.Degis(cevap);
         cevapDurum=Aktar.Degis(cevapDurum);
         if(cevapResim!=null){
         cevapResim=Aktar.Degis(cevapResim);}
         
        
        pstmt4.setInt(1, Ozellik_ID);
        pstmt4.setString(2, cevap);
        pstmt4.setString(3, cevapResim);
        pstmt4.setString(4, cevapDurum);
        boolean sonuc4=pstmt4.execute();
        i++;    
        }
        
        response.sendRedirect("sorular.jsp?AltBolum_ID="+AltBolum_ID);
    
        }
%>
</body>
</html>
