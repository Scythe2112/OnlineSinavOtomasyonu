<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.Yonetici"%>
<%@page import="Beans.Ogrenci"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

                        <%

Personel personel=(Personel)session.getAttribute("personelInfo");
Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");
Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");

if(personel==null && ogrenci==null && yonetici==null)
{

response.sendRedirect("../index.jsp");

}else
{
        baglan nesne=new baglan();
        Connection connection=(Connection)nesne.VeritabaninaBaglan();
        String id=request.getParameter("mesaj_ID");
        
                PreparedStatement pstmt4=(PreparedStatement)connection.prepareStatement(
                " UPDATE `sinav`.`mesaj` "
                + " SET " 
                + " `mesaj_Durum`=?"
                + " WHERE mesaj_ID= ? ;");
                
                pstmt4.setString(1,"1");
                pstmt4.setInt(2,Integer.parseInt(id));
                int sonuc4=pstmt4.executeUpdate();

PreparedStatement pstmt1=(PreparedStatement)connection.prepareStatement(
                "Select * from sinav.mesaj where mesaj_ID=?");

                pstmt1.setString(1, id);
                ResultSet resultSet1=pstmt1.executeQuery();
                   
if(resultSet1.next()){
out.print(resultSet1.getString("mesaj_Mesaj"));
}
}
%>
