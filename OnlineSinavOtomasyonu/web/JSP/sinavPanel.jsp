<%-- 
    Document   : sinavPanel
    Created on : 01.Eki.2013, 00:43:26
    Author     : Nuri
--%>
<%@page import="Beans.OzellikArray"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Ogrenci"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>

<!DOCTYPE html>
<html>
<head>

    <style type="text/css">
        .soruCss:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
        <%
            
  Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

 if(ogrenci==null){
     response.sendRedirect("../index.jsp");
 }
 
 else{
     
    
         String Sinav_ID=request.getParameter("Sinav_ID");
         
         int diziOzellik[];
         OzellikArray array=new OzellikArray();
         array=(OzellikArray)session.getAttribute("array");
         diziOzellik=array.getDizi();
        
         baglan baglantii=new baglan();
         Connection conn=baglantii.VeritabaninaBaglan();
        
        
     //    PreparedStatement pstmt11 = 
    //   (PreparedStatement)conn.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE  Sinav_ID=?;");
   //    pstmt11.setInt(1, Integer.parseInt(Sinav_ID));
  //  ResultSet result = pstmt11.executeQuery();
    
    PreparedStatement pstmt12 = 
        (PreparedStatement)conn.prepareStatement("SELECT * FROM `sinav`.`ogrenci_cevap` WHERE  Sinav_ID=? AND Ogrenci_ID=? AND Ozellik_ID=?;");
        pstmt12.setInt(1, Integer.parseInt(Sinav_ID));
        pstmt12.setInt(2, Integer.parseInt(ogrenci.getOgrenci_ID()));
            

    
        String resim="";
        int  Ozellik_ID=0;
    
     
     
     int sayac=0;
     out.print("<table>");
    for(int i=0;i<diziOzellik.length;i++){
        
        Ozellik_ID=diziOzellik[sayac];
        pstmt12.setInt(3,Ozellik_ID );
        ResultSet result2=pstmt12.executeQuery();   
        if(result2.next()){
          resim="../IMAGE/var.png";  
        }else{
          resim="../IMAGE/yok.png";
        }
        sayac++;
        
        
    out.println("<tr class='soruCss' onClick='tiklama("+(sayac-1)+");' ><td><img  id='"+Ozellik_ID+"'  src='"+resim+"' title='"+(sayac)+"'/>"+(sayac)+".Soru </td></tr>");
           
    
    }
    out.print("</table>");

 }
                
                %>
                
</body>
</html>
