<%-- 
    Created on : 18.Tem.2013, 10:45:39
    Author     : Nuri
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.*"%>
<%@page import="Beans.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
 <%
 Personel personel=(Personel)session.getAttribute("personelInfo");
 if(personel==null){ response.sendRedirect("../index.jsp");}
 else{
 
baglan baglanti = new baglan();
Connection con = baglanti.VeritabaninaBaglan();
                
 String AltBolum_ID=request.getParameter("AltBolum_ID");
 String Ozellik_ID=request.getParameter("Ozellik_ID");
  String sayac=request.getParameter("sayac");


PreparedStatement pstmtO=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`soruozellik` "
                + " SET " 
                + " `Zorluk` = ?"
                + " WHERE Ozellik_ID= ? ;");
pstmtO.setString(1, Aktar.Degis(request.getParameter("boxSoru")));
pstmtO.setInt(2,Integer.parseInt(Ozellik_ID));
int sonucO=pstmtO.executeUpdate();


PreparedStatement pstmt=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`soru` "
                + " SET " 
                + " `Soru` = ?"
                + " WHERE Ozellik_ID= ? ;");
pstmt.setString(1, Aktar.Degis(request.getParameter("txtSoru")));
pstmt.setInt(2,Integer.parseInt(Ozellik_ID));
int sonuc=pstmt.executeUpdate();

PreparedStatement pstmt2=(PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=?;");
pstmt2.setInt(1,Integer.parseInt(Ozellik_ID));
ResultSet result2=pstmt2.executeQuery();

PreparedStatement pstmt3=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`cevap` "
                + " SET "
                + " `Cevap` = ?,"
                + " `DogruYanlis_ID` = ?"
                + " WHERE Cevap_ID= ? ;");
int i=1;
while(result2.next()){
                pstmt3.setString(1, Aktar.Degis(request.getParameter("txt"+i)));
                pstmt3.setString(2, Aktar.Degis(request.getParameter("box"+i)));
                pstmt3.setInt(3, result2.getInt("Cevap_ID"));
                int sonuc3=pstmt3.executeUpdate();
              i++;  
                    }
        
PreparedStatement pstmt4=(PreparedStatement)con.prepareStatement(
         " INSERT INTO `sinav`.`cevap`"
         + "(`Ozellik_ID`,"
         + "`Cevap`,"
         + "`resim_Ad`,"
         + "`DogruYanlis_ID`)"
         + "VALUES"
         + "(?,?,?,?);");

int j=i;
while(request.getParameter("box"+j)!=null){
            pstmt4.setInt(1,Integer.parseInt(Ozellik_ID));
            pstmt4.setString(2,Aktar.Degis(request.getParameter("txt"+j)));
            pstmt4.setString(3,request.getParameter("select"+j));
            pstmt4.setString(4,Aktar.Degis(request.getParameter("box"+j)));
            boolean sonuc4=pstmt4.execute();
        j++;
    
}


response.sendRedirect("sorular.jsp?AltBolum_ID="+AltBolum_ID+"&sayac="+sayac);

}
 
 
 
 
 
 
 
 
 
 %>
    
    
</body>
</html>
