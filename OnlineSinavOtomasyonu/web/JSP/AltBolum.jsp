<%-- 
    Document   : AltBolum
    Created on : 20.Tem.2013, 10:27:32
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.Personel"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link type="text/css" href="../CSS/sorular.css" rel="Stylesheet"/>
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../JS/AltBolum.js"></script>
    <script type="text/javascript" src="../JS/soruEkleme.js"></script>
    <script type="text/javascript">
         $(document).ready(function(){
             $("#button1").button();
             $("#button2").button();
             $("#button3").button();
             $("#buttonAzalt").button();
             $("#buttonArttir").button();
             
             $("#button3").click(function(){
                   $( "#dialog-confirm" ).dialog({
      resizable: false,
      height:240,
      modal: true,
      buttons: {
        "Evet": function() {
          $( this ).dialog( "close" );
          alert("Evet");
        },
        Hayır: function() {
          $( this ).dialog( "close" );
          alert("Hayır");

        }
      }
    });
    $( "#dialog-confirm" ).text("Soru Kayıttan Silinecek! Emin misiniz ?")
             });
             
            
           
         });    
             
             
    </script>
</head>
<body>
    
                  <% 
Personel personel=(Personel)session.getAttribute("personelInfo");

if(personel==null){
    response.sendRedirect("../index.jsp");
}
else{
    

    String  AltBolum_ID=(String)session.getAttribute("AltBolum_ID");
    Object  soruSirasiGelen=(Object)session.getAttribute("soruSirasiGelen");
    String  ozellikSirasiGelen=(String)session.getAttribute("ozellikSirasiGelen");
    
    String  Ozellik_ID=null;
    String  Soru_ID=null;
    String  Cevap_ID=null;
    String  AltBolum_Ad=null;
    String  dizi[]=null;
    
    int     soruSayisi=0;
    int     soruSirasi;
    int     OzellikSirasi;
       
    if(soruSirasiGelen==null){soruSirasi=0;}
    else{soruSirasi=Integer.parseInt(soruSirasiGelen.toString());}
    
    if(AltBolum_ID!=null){
       
   
    baglan baglanti = new baglan();
    Connection con = baglanti.VeritabaninaBaglan();
    
    PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT  * FROM `sinav`.`altbolum` WHERE AltBolum_ID=?;");
    PreparedStatement pstmt2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
    PreparedStatement pstmt5 = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
   
       
    pstmt.setString(1, AltBolum_ID);
    ResultSet result = pstmt.executeQuery();
    if(result.next()){AltBolum_Ad=result.getString("AltBolum_Ad");}
        
    
    pstmt5.setString(1, AltBolum_ID);
    ResultSet result5=pstmt5.executeQuery();
    if(result5.next()){soruSayisi=result5.getInt(1);}
            
    
    pstmt2.setString(1, AltBolum_ID);
    ResultSet result2=pstmt2.executeQuery();
    dizi=new String[soruSayisi];
    for(int i=0;result2.next();i++){
         dizi[i]=result2.getString("Ozellik_ID");
    }
    
                    
    
    %>
       
<div id="AltBolumPencere" class="CSSTableGenerator"  style="position: absolute; left: 250px;top: 120px; width: 1070px; height: 520px;">
    <table border="1">
        
            <tr>
            <td colspan="2" height="40px"><%=AltBolum_Ad%>-----ALT BÖLÜM SORULARI:Toplam Soru Sayısı:<%=soruSayisi%></td>
            </tr>
        
            <tr>
            <td rowspan="4" width="70%">
            <div id="soruGetir">
                
 
              </div>  
            </td>
            <td><button onClick="soruEkleForm();" id="button1" style="width:200px;"><img src="../IMAGE/soruEkle.png"/>SORU EKLE</button></td>
            </tr>  
              
            <tr>
            <td><button id="button2" style="width:200px;"><img src="../IMAGE/guncelle.png"/>SORU GÜNCELLE</button></td>
            </tr>
                
            <tr>
            <td><button id="button3" style="width:200px;"><img  src="../IMAGE/soruSil.png"/>SORU SİL</button></td>
            </tr>
            
            <tr>
                 <td>   
                     <table>
                         <tr>
                             <td><button id="butonAzalt" onClick="Azalt(<%=(soruSirasi)%>,<%=dizi[0]%>);"><img  width="48" height="48" src="../IMAGE/sol.png"/></button></td>
                             <td><button id="butonArttir" onClick="Arttir(<%=(soruSirasi)%>,<%=dizi[0]%>);" ><img  width="48" height="48" src="../IMAGE/sag.png"/></button></td>

                         </tr>
                     </table>
                 </td>
            </tr>

        
    </table>


</div>
<div id="dialog-confirm"></div>
       <% 

    
}else{}    //////////////////////////AltBolum_ID null ise 
    
  
session.setAttribute("AltBolum_ID",null);
session.setAttribute("soruSirasiGelen",null);
session.setAttribute("ozellikSirasiGelen",null);
}
       %>
</body>
</html>
