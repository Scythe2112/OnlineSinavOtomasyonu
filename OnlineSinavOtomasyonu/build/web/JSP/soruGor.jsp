<%-- 
    Document   : soruGetir
    Created on : 21.Tem.2013, 17:09:07
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="Stylesheet" href="style.css"/>

</head>
<body>
    <div   id="sc" style="float: left; width: 15px;"><a href="personel.jsp"><img src="../IMAGE/left.png"/></a></div>
<%
   
    Personel personel=(Personel)session.getAttribute("personelInfo");
    if(personel==null){ response.sendRedirect("../index.jsp");}
    else{
                      
                baglan baglanti = new baglan();
                Connection con = baglanti.VeritabaninaBaglan();
           
                String Sinav_ID=request.getParameter("Sinav_ID");
                
                if(Sinav_ID!=null){
     PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE Sinav_ID=?;");
     pstmt.setInt(1,Integer.parseInt(Sinav_ID));
     ResultSet result=pstmt.executeQuery();
           
          PreparedStatement pstmt2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Soru_ID=?;");           
          PreparedStatement pstmt3 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Cevap_ID=?;");   
                
                ResultSet result2;
                ResultSet result3;
                int i=1;
               while(result.next()){
                   out.println("<div style=' float:left; margin:30px;' id='"+result.getInt("Soru_ID")+"div'>"
                           + "<table style=' width:550px; height:80px;' id='rounded-corner'>");
                   
                pstmt2.setInt(1,result.getInt("Soru_ID"));
                result2=pstmt2.executeQuery();
                if(result2.next()){
                    out.println("<tr><td>Soru:"+i+"<br>");
                    out.println(result2.getString("Soru"));
                    out.println("</td></tr>");
                }
                
                 pstmt3.setInt(1,result.getInt("Cevap1_ID"));
                 result3=pstmt3.executeQuery();
                 
                 if(result3.next()){
                    out.println("<tr><td>A)");
                    out.println(result3.getString("Cevap"));
                    out.println("</td></tr>");
                 }
                 
                 pstmt3.setInt(1,result.getInt("Cevap2_ID"));
                 result3=pstmt3.executeQuery();
                 
                 if(result3.next()){
                    out.println("<tr><td>B)");
                    out.println(result3.getString("Cevap"));
                    out.println("</td></tr>");
                 }
                 pstmt3.setInt(1,result.getInt("Cevap3_ID"));
                 result3=pstmt3.executeQuery();
                 
                 if(result3.next()){
                    out.println("<tr><td>C)");
                    out.println(result3.getString("Cevap"));
                    out.println("</td></tr>");
                 }
                 pstmt3.setInt(1,result.getInt("Cevap4_ID"));
                 result3=pstmt3.executeQuery();
                 
                 if(result3.next()){
                    out.println("<tr><td>D)");
                    out.println(result3.getString("Cevap"));
                    out.println("</td></tr>");
                 }
                 pstmt3.setInt(1,result.getInt("Cevap5_ID"));
                 result3=pstmt3.executeQuery();
                 
                 if(result3.next()){
                    out.println("<tr><td>E)");
                    out.println(result3.getString("Cevap"));
                    out.println("</td></tr>");
                 }
                
                out.println("</table></div>");
               i++; 
               }

                
         }           
                    
    }
%>
</body>
</html>

