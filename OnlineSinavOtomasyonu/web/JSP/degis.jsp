<%-- 
    Document   : degis
    Created on : 29.Tem.2013, 13:11:34
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="Beans.*"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan2"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
   
    Personel personel=(Personel)session.getAttribute("personelInfo");
    if(personel==null){ response.sendRedirect("../index.jsp");}
    else{
                      
                baglan2 baglanti = new baglan2();
                Connection con = baglanti.VeritabaninaBaglan();
           
                String Soru_ID=request.getParameter("Soru_ID");
                String Sinav_ID=request.getParameter("Sinav_ID");
                String ID=request.getParameter("ID");
                
                int ozellik=0;
                if(Soru_ID!=null){
     PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Soru_ID=?;");
                pstmt.setInt(1,Integer.parseInt(Soru_ID));
                ResultSet result=pstmt.executeQuery();
                
                if(result.next()){ozellik=result.getInt("Ozellik_ID");}
                
          PreparedStatement pstmt4 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE Ozellik_ID=?;");
                pstmt4.setInt(1,ozellik);
                ResultSet result4=pstmt4.executeQuery(); 
                
                int AltBolum_ID=0;
                if(result4.next()){AltBolum_ID=Integer.parseInt(result4.getString("AltBolum_ID"));}
                
                
                PreparedStatement pstmt5 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
                pstmt5.setInt(1,AltBolum_ID);
                ResultSet result5=pstmt5.executeQuery();
                
                PreparedStatement pstmtSayi = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
                pstmtSayi.setInt(1,AltBolum_ID);
                ResultSet resultSayi=pstmtSayi.executeQuery();
                int boyut=0;
                if(resultSayi.next()){boyut=resultSayi.getInt(1);}
                
                int array[]=new int[boyut];
                
                Random r=new Random();
                
                int gidecekID=0;
                
                int j=0;
                while(result5.next()){
                    array[j]=result5.getInt("Ozellik_ID");
                     j++;
                    }
                gidecekID=array[r.nextInt(boyut)];
           
          PreparedStatement pstmt2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Ozellik_ID=?;");           
          //PreparedStatement pstmt3 = (PreparedStatement) con.prepareStatement("SELECT * FROM `Sinav`.`cevap` WHERE Ozellik_ID=?;");   
                
                
                    pstmt2.setInt(1,gidecekID);
                    ResultSet result2=pstmt2.executeQuery();
                
                   // pstmt3.setInt(1,gidecekID);
                   // ResultSet result3=pstmt3.executeQuery();
                   
                    int soru=0;
                    //int cevaplar[][]=new int[2][5];
                    
                if(result2.next()){soru=result2.getInt("Soru_ID");}
               //int i=0;
               // while(result3.next()){
                  //  cevaplar[0][i]=result3.getInt("Cevap_ID");
                 //   cevaplar[1][i]=result3.getInt("DogruYanlis_ID");
                 //   i++;
               // }
                
                 PreparedStatement pstmtDogru = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=? AND DogruYanlis_ID=?;");
        pstmtDogru.setInt(1,gidecekID);
        pstmtDogru.setString(2,"1");
        ResultSet resultDogru = pstmtDogru.executeQuery();
        
        PreparedStatement pstmtYanlis = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=? AND DogruYanlis_ID=?;");
        pstmtYanlis.setInt(1,gidecekID);
        pstmtYanlis.setString(2,"0");
        ResultSet resultYanlis = pstmtYanlis.executeQuery();
        
        int dogru=0;
        while(resultDogru.next()){ 
            dogru=resultDogru.getInt("Cevap_ID"); 
            
        }

                
                int yanlis[]=new int[4];
                int z=0;
               while(resultYanlis.next()){
                    
                    yanlis[z]=resultYanlis.getInt("Cevap_ID");
                    z++;
                    if(z==4){break;}
                    
                }
            
                
                int son[]=new int[5];
                son[0]=dogru;
                for (int k = 1; k < 5; k++) {
                       son[k]=yanlis[k-1]; 
                    }
                Methods.Mixing mix=new Methods.Mixing();
                son=mix.shuffle(son);
                
            
PreparedStatement pstmts=(PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE Soru_ID=? AND Sinav_ID=?;");
pstmts.setInt(1, soru);
pstmts.setInt(2, Integer.parseInt(Sinav_ID));
ResultSet results=pstmts.executeQuery();
if(!results.next()){
PreparedStatement pstmt6=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`sinav_icerik` "
                + " SET " 
                + " `Sinav_ID` = ?,"
                + " `ID` = ?,"
                + " `Soru_ID` = ?,"
                + " `Cevap1_ID` = ?,"
                + " `Cevap2_ID` = ?,"
                + " `Cevap3_ID` = ?,"
                + " `Cevap4_ID` = ?,"
                + " `Cevap5_ID` = ?,"
                + " `DogruCevap_ID` = ?"
                + " WHERE Soru_ID= ? AND Sinav_ID=? ;");

pstmt6.setInt(1,Integer.parseInt(Sinav_ID));
pstmt6.setInt(2,Integer.parseInt(ID));
pstmt6.setInt(3,soru);
pstmt6.setInt(4,son[0]);
pstmt6.setInt(5,son[1]);
pstmt6.setInt(6,son[2]);
pstmt6.setInt(7,son[3]);
pstmt6.setInt(8,son[4]);
                
                int deger=0;
                for(int l=0;l<5;l++){
                    
                    if(son[l]==dogru){
                    deger=l+1;
                    
                    }
                } 
                
pstmt6.setInt(9, deger);
pstmt6.setInt(10,Integer.parseInt(Soru_ID));
pstmt6.setInt(11,Integer.parseInt(Sinav_ID));




int sonuc6=pstmt6.executeUpdate();

}

    response.sendRedirect("soruGetir.jsp?Sinav_ID="+Integer.parseInt(Sinav_ID)+"");

         }          
                    
    }
%>
</body>
</html>
