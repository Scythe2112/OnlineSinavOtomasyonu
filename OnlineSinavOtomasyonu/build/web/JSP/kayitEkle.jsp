<%@page import="Methods.baglan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


      <%
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        String numara=request.getParameter("txtNumara");
        String ad=request.getParameter("txtAd");
        String soyad=request.getParameter("txtSoyad");
        String sifre=request.getParameter("txtSifre");

        numara      =Methods.Aktar.Degis(numara);
        ad         =Methods.Aktar.Degis(ad);
        soyad      =Methods.Aktar.Degis(soyad);
        sifre      =Methods.Aktar.Degis(sifre);
        
        String query="SELECT * FROM `sinav`.`ogrenci` WHERE Ogrenci_ID=?;";
        PreparedStatement pstmt = (PreparedStatement)con.prepareStatement(query);
        
        if(pstmt!=null){
            
        pstmt.setInt(1,Integer.parseInt(numara));
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        out.print(0);
        }
        else{
            
            String query2="INSERT INTO `sinav`.`ogrenci`"
                + " (`Ogrenci_Ad`,`Ogrenci_Soyad`,`Ogrenci_ID`,`Ogrenci_Sifre`)"
                + " VALUES(?,?,?,?);";
        
        PreparedStatement pstmt2 = (PreparedStatement)con.prepareStatement(query2);
        pstmt2.setString(1,ad);
        pstmt2.setString(2,soyad);
        pstmt2.setInt(3,Integer.parseInt(numara));
        pstmt2.setString(4,sifre);
        boolean sonuc=pstmt2.execute();
        
        if(sonuc==false){out.print(1);}
        else           {out.print(2);}
        
        }
        
        }else
        {
        out.print(3);
        }
        %>

