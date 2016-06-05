<%-- 
    Document   : sinavGiris
    Created on : 01.Eki.2013, 20:32:33
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
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
          Date date=new Date();

     String Sinav_ID=request.getParameter("Sinav_ID");
     
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        
    PreparedStatement pstmt = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_sonuc` WHERE  Ogrenci_ID=? AND Sinav_ID=?;");
    pstmt.setInt(1, Integer.parseInt(ogrenci.getOgrenci_ID()));
    pstmt.setInt(2, Integer.parseInt(Sinav_ID));

    ResultSet result = pstmt.executeQuery();
    
    PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_anahat` WHERE  Sinav_ID=?;");
    pstmt2.setInt(1, Integer.parseInt(Sinav_ID));

    ResultSet result2 = pstmt2.executeQuery();
    
    int tekrar=0;
    String cikis="";
    String giris="";
    String sure="20";
    String durum="0";
    boolean okuma=true;
    
    while(result2.next()){
    sure=result2.getString("Sure");
    durum=result2.getString("AcikKapali");
    okuma=false;
    }
    
    
    
    if(okuma){
      response.sendRedirect("ogrenci.jsp?e=1524dwmn41");
    }
   
    else{
    
    if(durum.equals("0")){
        response.sendRedirect("ogrenci.jsp?e=1da23fa16");

    }else
    if(result.next()){
        tekrar=result.getInt("Tekrar");
        
        //giris=result.getString("GirisSaat");
        //cikis=result.getString("CikisSaat");

        //int nokta=giris.charAt('.');
        //int nokta2=cikis.charAt('.');
        
        //giris=giris.substring(nokta+1);
        //cikis=cikis.substring(nokta+1);
        
        //int son=Integer.parseInt(giris);
        //int son2=Integer.parseInt(cikis);
        
        if(tekrar==1){
            
        session.setAttribute("sure",5);
        
        PreparedStatement pstmt1=(PreparedStatement)con.prepareStatement(
         " DELETE FROM `sinav`.`ogrenci_sonuc`"
         + "WHERE Sinav_ID=? AND Ogrenci_ID=?;");

        pstmt1.setInt(1, Integer.parseInt(Sinav_ID));
        pstmt1.setInt(2, Integer.parseInt(ogrenci.getOgrenci_ID()));
        int resultSet1=pstmt1.executeUpdate();
        
        String query="INSERT INTO `sinav`.`ogrenci_sonuc`"
                + " (`Ogrenci_ID`,`Sinav_ID`,`SinavNotu`,`Tekrar`,`GirisSaat`,`CikisSaat`,`GirisZaman`)"
                + " VALUES(?,?,?,?,?,?,?);";
        
        PreparedStatement pstmt5=(PreparedStatement) con.prepareStatement(query);
        pstmt5.setInt(1, Integer.parseInt(ogrenci.getOgrenci_ID()));
        pstmt5.setInt(2, Integer.parseInt(Sinav_ID));
        pstmt5.setInt(3, 0);
        pstmt5.setInt(4, 2);
        pstmt5.setString(5,date.getHours()+"."+date.getMinutes() );
        pstmt5.setString(6, date.getHours()+"."+date.getMinutes());
        pstmt5.setString(7, date.getDay()+"."+date.getMonth()+"."+(date.getYear()-100));
        boolean sonuc=pstmt5.execute();

        response.sendRedirect("sinavEkran.jsp?DF17ssh="+Sinav_ID+"&h=dAB56wD1aT");
            }else{
        
    response.sendRedirect("ogrenci.jsp?e=13wpd2n1");
        
        }
    }else{
        session.setAttribute("sure",Integer.parseInt(sure));
        String query="INSERT INTO `sinav`.`ogrenci_sonuc`"
                + " (`Ogrenci_ID`,`Sinav_ID`,`SinavNotu`,`Tekrar`,`GirisSaat`,`CikisSaat`,`GirisZaman`)"
                + " VALUES(?,?,?,?,?,?,?);";
        
        PreparedStatement pstmt5=(PreparedStatement) con.prepareStatement(query);
        pstmt5.setInt(1, Integer.parseInt(ogrenci.getOgrenci_ID()));
        pstmt5.setInt(2, Integer.parseInt(Sinav_ID));
        pstmt5.setInt(3, 0);
        pstmt5.setInt(4, 2);
        pstmt5.setString(5,date.getHours()+"."+date.getMinutes() );
        pstmt5.setString(6, date.getHours()+"."+date.getMinutes());
        pstmt5.setString(7, date.getDay()+"."+date.getMonth()+"."+(date.getYear()-100));
        boolean sonuc=pstmt5.execute();
        
        response.sendRedirect("sinavEkran.jsp?DF17ssh="+Sinav_ID);

        }
    }
 }
     %>
 
</body>
</html>
