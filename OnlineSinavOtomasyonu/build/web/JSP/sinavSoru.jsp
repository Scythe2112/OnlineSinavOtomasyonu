<%-- 
    Document   : sinavSoru
    Created on : 29.Eyl.2013, 19:39:45
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.OzellikArray"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Ogrenci"%>

<!DOCTYPE html>
<html>
<head>
 

</head>
<body>
    <%
 Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

 if(ogrenci==null){
     response.sendRedirect("../index.jsp");
 }
 else{
        baglan baglanti=new baglan();
        Connection connection=baglanti.VeritabaninaBaglan();
        
        int diziOzellik[];
        OzellikArray array=new OzellikArray();
        array=(OzellikArray)session.getAttribute("array");
        diziOzellik=array.getDizi();
        
        
        int sira=0;
        
        if((Integer)session.getAttribute("sira")==0){
        sira=0;
        }else{
        sira=(Integer)session.getAttribute("sira");
        }

        
    
        
        session.setAttribute("sira",sira);
        
        int Ozellik_ID=diziOzellik[sira];
        String Sinav_ID=request.getParameter("Sinav_ID");
        
        
        PreparedStatement pstmt=
             (PreparedStatement)connection.prepareStatement("Select * From `sinav`.`soru` WHERE Soru_ID=?;");
        
        
        
        PreparedStatement pstmt2=
        (PreparedStatement)connection.prepareStatement("Select * From `sinav`.`cevap` WHERE Cevap_ID=?;");
        
        PreparedStatement pstmt3=
        (PreparedStatement)connection.prepareStatement("Select * From `sinav`.`sinav_icerik` WHERE Sinav_ID=? AND Soru_ID=?;");

        PreparedStatement pstmt4 = 
            (PreparedStatement)connection.prepareStatement
            ("SELECT * FROM `sinav`.`ogrenci_cevap` WHERE  Sinav_ID=? AND Ogrenci_ID=? AND Ozellik_ID=?;");
    pstmt4.setInt(1,Integer.parseInt(Sinav_ID));
    pstmt4.setInt(2,Integer.parseInt(ogrenci.getOgrenci_ID()));
    pstmt4.setInt(3,Ozellik_ID);
    ResultSet result4=pstmt4.executeQuery();
    
    int secimInt=6;
    String secim="6";
    if(result4.next()){
    secim=result4.getString("Cevap");
    secimInt=Integer.parseInt(secim);
    }
         
        
        
        
        pstmt.setInt(1,Ozellik_ID);
        ResultSet result=pstmt.executeQuery();
        
        String Soru="";
        String resim_Ad="";
        
        while(result.next()){
             Soru=result.getString("Soru");
             resim_Ad=result.getString("resim_Ad");

        }
        

     
     
     
 %>
 
  
 
     
         <%
         if(resim_Ad!=null){
         out.println("<tr><td colspan='3'><img src='../SoruCevap/"+resim_Ad+"' width='32' height='32'/></td></tr>");
         }
         int boyut=diziOzellik.length;
         %>
         
         <tr><td colspan='2'><span><%=Soru%></span></td></tr>
     
        
     
     <%
     
     
     
     pstmt3.setInt(1, Integer.parseInt(Sinav_ID));
     pstmt3.setInt(2, Ozellik_ID);
     ResultSet result3=pstmt3.executeQuery();
     
     
     
     int dizi[]=new int[5];
     
     if(result3.next()){
     dizi[0]=result3.getInt("Cevap1_ID");
          dizi[1]=result3.getInt("Cevap2_ID");
               dizi[2]=result3.getInt("Cevap3_ID");
                    dizi[3]=result3.getInt("Cevap4_ID");
                         dizi[4]=result3.getInt("Cevap5_ID");

     
     } 
     
     String dizi2[]={"A","B","C","D","E"};
     
     

     for (int i = 0; i < 5; i++) {
             
     pstmt2.setInt(1, dizi[i]);
     ResultSet result2=pstmt2.executeQuery();
     String Cevap="";
     String resim_Ad2="";
     out.println("<tr>");
     
     if(result2.next()){
         Cevap=result2.getString("Cevap");
         resim_Ad2=result2.getString("resim_Ad");
     }
     
     if(i==secimInt-1){
              out.println("<td><input checked='checked' onClick='SoruKaydet("+(i+1)+","+Sinav_ID+","+Ozellik_ID+","+boyut+");' type = 'radio' name ='rd' id='rd"+(i+1)+"'/>"+dizi2[i]+") </td><td>"+Cevap+"</td>");
     }else{
     out.println("<td width='20%'><input  onClick='SoruKaydet("+(i+1)+","+Sinav_ID+","+Ozellik_ID+","+boyut+");' type = 'radio' name ='rd' id='rd"+(i+1)+"'/>"+dizi2[i]+")</td><td> "+Cevap+"</td>");
     }
     if(resim_Ad2!=null){
      out.println("<td><img src='../SoruCevap/"+resim_Ad2+"' width='32' height='32' /></td>");

     }
     out.println("</tr>");
     }
    

            
     
     
     
     %>
     <center><h4><b>Soru :<%=sira+1%> /<%=boyut%><b></h4></center>



 
 
 
 <%
 }
 %>
</body>
</html>
