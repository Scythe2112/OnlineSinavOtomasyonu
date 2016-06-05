<%-- 
    Document   : sinavDurum
    Created on : 19.Tem.2013, 15:14:21
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
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
</head>
<body>
    <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
       %>

        <%
    
    String durum=null;
    
    
        if(Integer.parseInt(request.getParameter("AcikKapali"))==0){
        durum="1";
        }
        if(Integer.parseInt(request.getParameter("AcikKapali"))==1){
        durum="0";
        }
    
       
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
    
        PreparedStatement pstmt1 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_bolum` WHERE  Sinav_ID=?;");
    
        pstmt1.setInt(1,Integer.parseInt(request.getParameter("Sinav_ID")));
        ResultSet result1 = pstmt1.executeQuery();
    
            int toplam=0;
            while(result1.next()){
            toplam=toplam+Integer.parseInt(result1.getString("SoruSayisi"));
                    }
    if(toplam==0){        response.sendRedirect("personel.jsp?AS=FH52D");
}else{
    PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`sinav_anahat` "
                + " SET " 
                + " `AcikKapali`= ?"
                + " WHERE Sinav_ID= ? ;");
pstmt2.setString(1,durum);
pstmt2.setString(2,request.getParameter("Sinav_ID"));



int result2=pstmt2.executeUpdate();

    if(result2==1){
        response.sendRedirect("personel.jsp");
    }
}
        %>

        
       <%
    
}%>
       
</body>
</html>
