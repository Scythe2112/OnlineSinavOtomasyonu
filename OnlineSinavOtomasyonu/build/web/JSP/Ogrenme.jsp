

<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <%    
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
        
        PreparedStatement pstmt4 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik`;");
        PreparedStatement pstmt5 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` where Soru_ID=? ;");
        PreparedStatement pstmt6 = (PreparedStatement) con.prepareStatement("UPDATE `sinav`.`soruozellik` SET Zorluk=? where Ozellik_ID=? ;");
        PreparedStatement pstmt7 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` where Ozellik_ID=? ;");
        PreparedStatement pstmt8 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_cevap` WHERE Sinav_ID=? AND Ozellik_ID=? ;");

                        

        double fark=0.0;
        int zorluk=0;
        int sayac=0;
        
        int Ozellik=0;
        int cevap=0;
        int dogru=0;
        int yanlis=0;
        int Sinav_ID=0;
        int Soru_ID=0;
        int gelen=0;
        
        ResultSet result4=pstmt4.executeQuery();
        while(result4.next()){
        Ozellik=result4.getInt("Ozellik_ID");

        pstmt7.setInt(1, Ozellik);
        ResultSet result7=pstmt7.executeQuery();
        if(result7.next()){Soru_ID=result7.getInt("Soru_ID");}
        
        pstmt5.setInt(1, Soru_ID);
        ResultSet result5=pstmt5.executeQuery();
        
        dogru=0;
        yanlis=0;
        
        while(result5.next()){
        Sinav_ID=result5.getInt("Sinav_ID");
        gelen=result5.getInt("DogruCevap_ID");
        
        
        pstmt8.setInt(1, Sinav_ID);
        pstmt8.setInt(2, Soru_ID);
        ResultSet result8=pstmt8.executeQuery();
        while(result8.next()){
            cevap=result8.getInt("Cevap");
            
            if(cevap==gelen){
                    dogru++;
                    }else{
                    yanlis++;
                    }
        }
        
                    
                    
        }
        
        if(dogru==0){
                dogru=1;
                fark=(yanlis/dogru)*100;

        }else{
        fark=(yanlis/dogru)*100;
        }
        zorluk=0;
        
        if(fark<100 && fark>50){zorluk=3;}
        else if(fark>100){zorluk=4;}
        else if(fark>200){zorluk=5;}
        else if(fark<50){zorluk=2;}
        else if(fark<20){zorluk=1;}

        if(zorluk!=0){
        pstmt6.setString(1, zorluk+"");
        pstmt6.setInt(2, Ozellik);
        int result6=pstmt6.executeUpdate();
        sayac++;

        }
        }
        if(sayac!=0){out.print(sayac +" Adet Kayıt Güncellendi.");}
        else{out.print("Kayıtlar Optimum durumda");}

  %>
