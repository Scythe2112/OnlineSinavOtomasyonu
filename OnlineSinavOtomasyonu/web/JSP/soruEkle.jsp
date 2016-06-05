<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Methods.Mixing"%>
<%@page import="java.util.Random"%>
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.Personel"%>





  <%
  Personel personel=(Personel)session.getAttribute("personelInfo");
  if(personel==null){
  response.sendRedirect("../index.jsp");
  
  }else{
          baglan baglanti = new baglan();
          Connection con = baglanti.VeritabaninaBaglan();  
      
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT MAX(ID) FROM `sinav`.`sinav_bolum`;");
        ResultSet result = pstmt.executeQuery();
        int maxID=0;
        Random r=new Random();
        if(result.next()){
        maxID=result.getInt(1)+r.nextInt(7)+1;
        } 
  
      String Sinav_ID=request.getParameter("Sinav_ID");
            String Bolum_ID=request.getParameter("Bolum_ID");
                  String AltBolum_ID=request.getParameter("AltBolum_ID");
                        String SoruSayisi=request.getParameter("SoruSayisi");
                              String Zorluk=request.getParameter("Zorluk");

           
          PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(
         " INSERT INTO `sinav`.`sinav_bolum`"
         + " (`ID`,"
         + "`Sinav_ID`,"
         + "`Bolum_ID`,"
         + "`AltBolum_ID`,"
         + "`SoruSayisi`,"
         + "`Zorluk`)"
         + "VALUES"
         + "(?,?,?,?,?,?);");


pstmt2.setInt(1, maxID);
pstmt2.setString(2, Sinav_ID);
pstmt2.setString(3, Bolum_ID);
pstmt2.setString(4, AltBolum_ID);
pstmt2.setString(5, SoruSayisi);
pstmt2.setString(6, Zorluk);
boolean resultSet2=pstmt2.execute();

        PreparedStatement pstmt3 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`bolum` WHERE Bolum_ID=?;");
        pstmt3.setInt(1,Integer.parseInt(Bolum_ID));
        ResultSet result3 = pstmt3.executeQuery();
        
        PreparedStatement pstmt4 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`altbolum` WHERE AltBolum_ID=?;");
        pstmt4.setInt(1,Integer.parseInt(AltBolum_ID));
        ResultSet result4 = pstmt4.executeQuery();
        
        String BolumAd="";
        String AltBolumAd="";
        
        if(result3.next()){BolumAd=result3.getString("Bolum_Ad");}
        if(result4.next()){AltBolumAd=result4.getString("AltBolum_Ad");}
        String zor="";
        if(Zorluk.equals("1")){zor="ÇOK KOLAY";}
        else if(Zorluk.equals("2")){zor="KOLAY";}
                else if(Zorluk.equals("3")){zor="ORTA";}
                else if(Zorluk.equals("4")){zor="ZOR";}
                else if(Zorluk.equals("5")){zor="ÇOK ZOR";}
                 




        
if(resultSet2==false){
    %>

    
<tr id="<%=maxID%>" name="<%=maxID%>" > 
    <td><%=BolumAd%></td>
    <td><%=AltBolumAd%></td>
    <td><%=SoruSayisi%></td>
    <td><%=zor%></td>
    <td><button type='button' name='satirSil' onClick='bolumSil(<%=maxID%>);'>Sil</button></td>
</tr><br>

        <%
        int dizi[]=new int[Integer.parseInt(SoruSayisi)];
        
        PreparedStatement pstmt6 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Zorluk=? AND Durum=1 ;");
        pstmt6.setInt(1,Integer.parseInt(AltBolum_ID));
        pstmt6.setString(2,Zorluk);
        ResultSet result6 = pstmt6.executeQuery();
        
        PreparedStatement pstmtSayi = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Zorluk=? AND Durum=1;");
        pstmtSayi.setInt(1,Integer.parseInt(AltBolum_ID));
        pstmtSayi.setString(2,Zorluk);
        ResultSet resultSayi = pstmtSayi.executeQuery();
        
        int boyut=0;
        if(resultSayi.next()){ boyut=resultSayi.getInt(1); }
        int secilen[]=new int[boyut];
        
        
        
        int i=0;
        while(result6.next()){
            secilen[i]=result6.getInt("Ozellik_ID");
             i++;
                            }
        
        
        Random r2=new Random();
        
        if(boyut>Integer.parseInt(SoruSayisi)){
            
          int w=0;
          int w2=0;
                  
          while(true){
              if(r2.nextBoolean()){
              dizi[w]=secilen[w2%boyut];
              w++;
              }
              w2++;
              if(w==Integer.parseInt(SoruSayisi)){break;}
          } 
        
        }else if(i==Integer.parseInt(SoruSayisi)){
            dizi=secilen;
            }
        
        PreparedStatement pstmt8 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Ozellik_ID=?;");
        
        

        PreparedStatement pstmt5=(PreparedStatement)con.prepareStatement(
         " INSERT INTO `sinav`.`sinav_icerik`"
         + " (`Sinav_ID`,"
         + "`ID`,"
         + "`Soru_ID`,"
         + "`Cevap1_ID`,"
         + "`Cevap2_ID`,"
         + "`Cevap3_ID`,"
         + "`Cevap4_ID`,"
         + "`Cevap5_ID`,"
         + "`DogruCevap_ID`)"
         + "VALUES"
         + "(?,?,?,?,?,?,?,?,?);");


pstmt5.setInt(1, Integer.parseInt(Sinav_ID));
pstmt5.setInt(2, maxID);



        for (int k = 0; k < dizi.length; k++) {
                
                
                
                pstmt8.setInt(1,dizi[k]);
                ResultSet result8 = pstmt8.executeQuery();
        
        PreparedStatement pstmtDogru = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=? AND DogruYanlis_ID=?;");
        pstmtDogru.setInt(1,dizi[k]);
        pstmtDogru.setString(2,"1");
        ResultSet resultDogru = pstmtDogru.executeQuery();
        
        PreparedStatement pstmtYanlis = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=? AND DogruYanlis_ID=?;");
        pstmtYanlis.setInt(1,dizi[k]);
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
            
                int soru=0;
                if(result8.next()){
                soru=result8.getInt("Soru_ID");
                }
                int son[]=new int[5];
                son[0]=dogru;
                for (int j = 1; j < 5; j++) {
                       son[j]=yanlis[j-1]; 
                    }
                Methods.Mixing mix=new Methods.Mixing();
                son=mix.shuffle(son);
                
                pstmt5.setInt(3,soru);
                pstmt5.setInt(4,son[0]);
                pstmt5.setInt(5,son[1]);
                pstmt5.setInt(6,son[2]);
                pstmt5.setInt(7,son[3]);
                pstmt5.setInt(8,son[4]);
                
                int deger=0;
                for(int l=0;l<5;l++){
                    
                    if(son[l]==dogru){
                    deger=l+1;
                    
                    }
                } 
                
                pstmt5.setInt(9, deger);

                boolean resultSet5=pstmt5.execute();
                
            }

}
  
  }
  
  
  
  %>

