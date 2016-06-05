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
        
        String sinav=request.getParameter("txtSinav");
        String buton=request.getParameter("buton");
 
        int tumKayitlariSifirla=2;
        
        baglan baglanti=new baglan();
        Connection con=baglanti.VeritabaninaBaglan();
    
if(Integer.parseInt(buton)==2){
    PreparedStatement pstmtSinav = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_anahat` WHERE Sinav_ID=?;");
    pstmtSinav.setString(1, sinav);
    ResultSet resultsinav = pstmtSinav.executeQuery();
    if(resultsinav.next()){
        PreparedStatement pstmtIptal=(PreparedStatement)con.prepareStatement(
         " DELETE FROM `sinav`.`ogrenci_cevap`"
         + "WHERE Sinav_ID=?;");
        pstmtIptal.setString(1, sinav);
        int resultIptal=pstmtIptal.executeUpdate();

        PreparedStatement pstmtIptal2=(PreparedStatement)con.prepareStatement(
         " DELETE FROM `sinav`.`ogrenci_sonuc`"
         + "WHERE Sinav_ID=?;");
        pstmtIptal2.setString(1, sinav);
        int resultIptal2=pstmtIptal2.executeUpdate();
    
         out.println(sinav+"\t Numaralı sınav için ");
         out.println("Tüm Öğrencilerin Kaydı Sıfırlanmıştır.");
        }else{
          out.print(sinav+"Numaralı sınav Sistemde Mevcut değildir.");
    }}
    
        
    
       %>
       
       
       
       
       
       <% 
    }
       %>
       
</body>
</html>
