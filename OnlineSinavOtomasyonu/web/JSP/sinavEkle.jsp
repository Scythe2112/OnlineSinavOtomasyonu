<%-- 
    Document   : sinavEkle
    Created on : 26.Tem.2013, 10:53:10
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.*"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
<head>
        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FÜOSS Sınav Oluşturma</title>
    
    <link type="text/css" rel="Stylesheet" href="../CSS/personel.css"/>
    <link type="text/css" rel="Stylesheet" href="style.css"/>
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
   
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" src="../JS/sinavEkle.js"></script>
    
    <script>
        $(document).ready(function(){
            
            $("#sinavIcerik").css("display","none");
            $("#icerikKayit").css("display","none");
            $("#soruGetir").css("display","none");
            $("#soruGetir").button();
            $("#btnEkle").click(function(){
               var sira=$("#1").text().indexOf("~");
                if(parseInt($("#1").text().substring(sira+1))>=parseInt($("#txtSoruSayisi").val())
                    && parseInt($("#boxBolum").val())!=0 && parseInt($("#boxAltBolum").val())!=0&&parseInt($("#txtSoruSayisi").val())>0
                    &&parseInt($("#boxZorluk").val())!=6){
                    soruEkle();
                }else{
              alert("Giriş parametrelerini kontrol edin!!");
                    }
            });
            
            $("#btnOlustur").click(function(){
                if($("#txtTarih").val().length<8
                   ||$("#txtSaat").val().length<4
                    ||$("#txtSure").val().length<1
                     ||parseInt($("#txtSure").val())<1
                    ||parseInt($("#boxUstBirim").val())==0||parseInt($("#boxDers").val())==-1
                     //||parseInt($("#boxDers").val())==0
         ){
                       alert("Giriş Bilgilerinizi Kontrol Edin!!");     
                            
                    }else{
                        
                        sinavOlustur();
                    }
                
                
            });
        

            });
        
        
        
        
    </script>
</head>
<body>
   <%
       Personel personel=(Personel)session.getAttribute("personelInfo");
        Date date=new Date();
 
        if(personel==null){
        response.sendRedirect("../index.jsp");
                      }
        else{
            
        baglan baglanti = new baglan();
        Connection con = baglanti.VeritabaninaBaglan();
        
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT MAX(Sinav_ID) FROM `sinav`.`sinav_anahat`;");
        ResultSet result = pstmt.executeQuery();
        int maxID=0;
        Random r=new Random();
        if(result.next()){
        maxID=result.getInt(1)+r.nextInt(7)+1;
        } 
            
         PreparedStatement pstmtBirim = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`birim`;");
         ResultSet resultpstmtBirim = pstmtBirim.executeQuery();
         
         PreparedStatement pstmtUstBirim = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ustbirim`;");
         ResultSet resultpstmtUstBirim = pstmtUstBirim.executeQuery();
         
   %>

<div   id="sc" style="float: left;"><a href="personel.jsp"><img src="../IMAGE/left.png"/></a></div>

<div style="position: absolute;left:230px;top:5px;">
    
    <form name="sinavAnahat">
        <table id="rounded-corner" style="width: 700px;" >

       
       <tr>
           <td>SINAV ID:</td>
           <td colspan="3">
       <input type="text" name="txtID" value="<%=maxID%>" disabled="disabled" />
           </td>
       </tr>
       
       <tr>
           <td>BİRİM ADI:</td>
           <td colspan="3">
           <select name="boxUstBirim" id="boxUstBirim" onchange="birimGetir();">
               <option value="0">Birim Seç</option>
               <%
               while(resultpstmtUstBirim.next()){
               out.println("<option value='"+resultpstmtUstBirim.getInt("UstBirim_ID")+"'>"+resultpstmtUstBirim.getString("UstBirim_Ad")+"</option>");
               }
               %>
               </select>
           </td>
       </tr>
       
       <tr>
            <td>
               BÖLÜM ADI:
           </td>
           
           <td>
                   <select name="boxBirim" id="boxBirim" onchange="dersGetir();">
                        <option value='0'>Bölüm Seç</option>
                   </select>
           </td>      
           
           
           <td>
               Sınav Tarihi:
           </td>
           
           <td>
       <input id="txtTarih" type="text" name="txtTarih" value="<%= date.getDate()+"/"+date.getMonth()+"/"+date.getYear() %>" /> 
           </td>
       </tr>
       
       
       <tr>
              <td>
               DERS ADI:
           </td>
           
           <td>
               
               <select name="boxDers" id="boxDers" onchange="bolumGetir();">
                   <option value='0'>Tümü</option>
               </select>
               
           </td>        
           
           
           <td>
               Sınav Saati:
           </td>
           
           <td>
           <input id="txtSaat" type="text" name="txtSaat" value="<%= date.getHours()+":"+date.getMinutes() %>" /> 
           </td>
       </tr>
       
        <tr>
                  
           <td>
               Sınav Türü:
           </td>
           
           <td>
               
               <select name="boxTur" >
                   <option value="Vize1">Vize1</option>
                   <option value="Vize2">Vize2</option>
                   <option value="Final">Final</option>
                   <option value="Mazeret">Mazeret</option>
                   <option value="Butunleme">Butunleme</option>
                   <option value="Quiz1">Quiz1</option>
                   <option value="Quiz2">Quiz2</option>
                   <option value="Quiz3">Quiz3</option>
                   <option value="Quiz4">Quiz4</option>
                   <option value="Quiz5">Quiz5</option>
                   <option value="Quiz6">Quiz6</option>
               </select>
               
               
           </td>
           
           <td>
               Sınav Suresi:
           </td>
           
           <td>
           <input id="txtSure" type="text" name="txtSure" value="20" />dk. 
           </td>
       </tr>
      
       
       <tr><td colspan="4"><button id="btnOlustur" type="button">Sınavı Kaydet</button><div id="sinavSonuc" style="color:red;"></div></td></tr>
   </table>
    </form> 
       
    <form name="sinavIcerik" id="sinavIcerik">
     <table id="rounded-corner" style="width: 700px;">
                   <tr>
                       <td>Bölüm:
                           <select name="boxBolum" id="boxBolum" onchange="altBolumGetir();">
                               <option value="">Bölüm Seç</option>
                           </select>
                       </td>    
                       
                           <td>Alt Bölüm:
                               <select name="boxAltBolum" id="boxAltBolum" >
                                   <option value="">Alt Bölüm Seç</option>
                               </select></td>
                               
                        
               
                    <td>Zorluk:
                        <select name="boxZorluk" id="boxZorluk" onchange="sayiGetir();">
               <option value="6">ZORLUK SEÇ</option>
               <option value="6">SORU SAYISI</option>   
               <option value="1">ÇOK KOLAY</option>
               <option value="2">KOLAY</option>
               <option value="3">ORTA</option>
               <option value="4">ZOR</option>
               <option value="5">ÇOK ZOR</option>
              
                        </select>
                    </td>
                    
                    <td>Soru Sayısı:
                   <input type="text" id="txtSoruSayisi"  name="txtSoruSayisi" style="width: 50px;"/>
                        </td>
                    
                    <td>
                    <input type="button" value="EKLE" name="btnEkle" id="btnEkle"/>  
                    </td>
                    
                    <td id="soruSayisi" style="color:red;"><div id="1"></div></td>
                    
                   </tr> 
               </table>
     </form>
       
         
          <form action="soruGetir.jsp" method="POST" style="position: absolute;left: 800px; top: 100px;">
              <input type="hidden" name="Sinav_ID" value="<%=maxID%>" />
              <button type="submit" id="soruGetir"><img src="../IMAGE/gor.png" width="48" height="48" alt="Sınav Sorularını Gör"/>
                  SİNAV GÖR</button>
       </form>
                   
    <form name="icerikKayit" id="icerikKayit" >
     <table class="icerikKayitTablo" style="width:700px;" id="rounded-corner">
         <tr><td>Bölüm</td> <td>Alt Bölüm</td><td>Soru Sayısı</td> <td>Zorluk</td><td>Sil</td></tr>
        
        </table>
    </form>
       
       
          
       
   </div>
    <%
    }
    %>
    
</body>
</html>
