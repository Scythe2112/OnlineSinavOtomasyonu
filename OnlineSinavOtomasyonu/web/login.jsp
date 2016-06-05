<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page  import="Beans.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

                                    <%
                                    
                                    
        String Name =request.getParameter("No");
        String Password =request.getParameter("Parola");

        Connection con=Methods.baglan.VeritabaninaBaglan();

        if(con!=null){
        try {

        PreparedStatement pstmt =con.prepareStatement("SELECT * FROM `sinav`.`ogrenci` WHERE Ogrenci_ID= ? and Ogrenci_Sifre= ?;");
        pstmt.setString(1, Name);
        pstmt.setString(2, Password);
        ResultSet result = pstmt.executeQuery();
        
        PreparedStatement pstmt2 =con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE Hoca_ID= ? and Hoca_Sifre= ?;");
        pstmt2.setString(1, Name);
        pstmt2.setString(2, Password);
        ResultSet result2 = pstmt2.executeQuery();
        
        PreparedStatement pstmt3 =con.prepareStatement("SELECT * FROM `sinav`.`yonetici` WHERE Yonetici_ID= ? and Yonetici_Sifre= ?;");
        pstmt3.setString(1, Name);
        pstmt3.setString(2, Password);
        ResultSet result3 = pstmt3.executeQuery();
        
        if(result.next()){
            Ogrenci ogrenci = new Ogrenci();
            ogrenci.setOgrenci_ID(Name);
            ogrenci.setOgrenci_Ad(result.getString("Ogrenci_Ad"));
            ogrenci.setOgrenci_Soyad(result.getString("Ogrenci_Soyad"));
            ogrenci.setOgrenci_TC(result.getString("Ogrenci_TC"));
            ogrenci.setOgrenci_Birim_ID(result.getString("Birim_ID"));
            ogrenci.setOgrenci_DogumYeri(result.getString("Ogrenci_DogumYeri"));
            ogrenci.setOgrenci_DogumTarih(result.getString("Ogrenci_DogumTarih"));

            session.setAttribute("ogrenciInfo", ogrenci);
            result.close();
            pstmt.close();
            con.close();
            response.sendRedirect("JSP/ogrenci.jsp");

         }else if(result2.next()){
            Personel personel = new Personel();
            personel.setHoca_ID(Name);
            personel.setHoca_Ad(result2.getString("Hoca_Ad"));
            personel.setHoca_Soyadi(result2.getString("Hoca_Soyadi"));
            personel.setHoca_Email(result2.getString("Hoca_Email"));
            personel.setHoca_Birim_ID(result2.getString("Birim_ID"));
            session.setAttribute("personelInfo", personel);
            result2.close();
            pstmt2.close();
            con.close();
            response.sendRedirect("JSP/personel.jsp");
                            

         }else if(result3.next()){
            Yonetici yonetici=new Yonetici();
            yonetici.setYonetici_ID(Name);
            yonetici.setAd(result3.getString("Yonetici_Ad"));
            yonetici.setSoyad(result3.getString("Yonetici_Soyad"));
            session.setAttribute("yoneticiInfo",yonetici);
            result3.close();
            pstmt3.close();
            con.close();
            response.sendRedirect("yonetim1.jsp");    
                                     

         }else{
                           result.close();
                           pstmt.close();
                           con.close();        
                           response.sendRedirect("index.jsp?giris=false");
                              }
                           
                        } catch (Exception e) {}
                        
                        }        
                                    
                                    else{
                            response.sendRedirect("index.jsp?giris=falseConnect");
                            
                                    }
                                    %>

</body>
</html>
