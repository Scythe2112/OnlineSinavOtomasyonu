
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="Beans.*" %>
<%@page  import="java.sql.*" %>
<%@page  import="Methods.*" %>
<%@page  import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
<head>
    <title>SORU BANKASI</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link    type="text/css"       href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" src="../JS/sorular.js"></script>
    
    <link   type="text/css" rel="Stylesheet" href="style.css"/>
    <link   type="text/css" rel="stylesheet" href="../CSS/templatemo_style.css"  />
    
    <script type="text/javascript" >
      
    $(document).ready(function(){
         $("#menu").menu(); 
         $("#tabs").tabs();
         $("#kakg").button(); 
         $("#cikis").button(); 
         $("#butonGit").button();
         $("#butonSil").button();
         $("#butonEkle").button();
         $("#butonAzalt").button();
         $("#butonArttir").button();
         $("#butonGuncelle").button();
         $("#soruSonuc").dialog();
                     
        $("#f4").css("display","none");
        $("#f5").css("display","none");
        
        $("#kakg").click(function(){
            
        $("#f4").css("display","inline"); 
        $("#f5").css("display","inline"); 

        });    
               sira=5;
               sayi=$("#girdiSayisi").val();
                      
              $("#kaydet").click(function(){
                             dogru=0;
                             yanlis=0;
                             i=1;
                             while(i<=sira){
                                 if($("#box2"+i+"").val()=="1"){dogru++;}
                                 else{ yanlis++;}
                                 i++;
                             }
                             if(yanlis>=4 && dogru>=1){
                                document.ekleme.submit(); 
                             }else{
                                 alert("En az 4 Yanlış ve 1 Doğru Cevap Şıkkı Olmalıdır.");
                             }
                             
                         });
                         
              $("#butonGuncelle").click(function(){
                             dogru1=0;
                             yanlis1=0;
                             j=1;
                             while(j<=sayi){
                                 if($("#box"+j+"").val()=="1"){dogru1++;}
                                 else{ yanlis1++;}
                                 j++;
                             }
                             if(yanlis1>=4 && dogru1>=1){
                                document.icerik.submit(); 
                             }else{
                                 alert("En az 4 Yanlış ve 1 Doğru Cevap Şıkkı Olmalıdır.");
                             }
                             
                         });
                         
              $("#ekle").click(function(){
                  sira++;
              $("#soruTable").append("<tr><td><input type=\"text\" name=\"txt"+sira+"\" id=\"txt"+sira+"\"value=\"\""+ 
              "size=\"40\"/></td><td><select name=\"box2"+sira+"\" id=\"box2"+sira+"\"><option value=\"0\">YANLIŞ</option><option value=\"1\">DOĞRU</option>"+
                "</select></td><td><input type=\"file\" name=\"select"+sira+"\" value=\"\" width=\"4\" /></td></tr>");
                   
                                    });
                                    
              $("#butonEkle").click(function(){
                 sayi++;
              $("#duzenleTable").append("<tr><td></td><td><input type=\"text\" name=\"txt"+sayi+"\" value=\"\""+ 
              "size=\"37\"/></td><td><select name=\"box"+sayi+"\" id=\"box"+sayi+"\" ><option value=\"0\">YANLIŞ</option><option value=\"1\">DOĞRU</option>"+
                "</select></td><td ><input type=\"file\" name=\"select"+sayi+"\" value=\"\" /></td></tr>");
                  document.duzenle.girdiSayisi.value(sayi);
                                    });
          
              $("#butonGit").click(function(){
          var deger=$("#txtSayac").val();
          if(deger.length<1){alert("Soru numarasını giriniz!!")}
          else{
              $("#sayac").val(deger-1);
              document.yon.submit();
          }
          
      });



});  
      
              function herhangi(deger){
                  
                  if(deger===0){
                      $("#sayac").val(($("#sayac").val())-1);
                      document.yon.submit();
                      }
                  else{
                      $("#sayac").val(parseInt(($("#sayac").val()))+1);
                      document.yon.submit();
                    }
              }; 
  
    
    </script>
    <style>
        .ui-menu { width: 200px; }
    </style>
</head>
<body>

 <%
        Personel personel = (Personel) session.getAttribute("personelInfo");

        if (personel == null) {
            response.sendRedirect("../index.jsp");
        } else {
            
            
    %>

                 <%
  String giris=request.getParameter("giris");
  if(giris!=null){
  if(giris.equals("false")){
  %>
    <script language="javascript" type="text/javascript">
          alert("Bu kayıt Veritabanımızda mevcuttur. Lütfen girdileri kontrol edin.");
    </script>
    <%
  
  }else{
  
    %>
    <script language="javascript" type="text/javascript">
          alert("Kayıt Başarı ile Eklenmiştir.");
    </script>
    <%
  
  }
  }
  
  %>

    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    <div id="templatemo_sidebar">
    
                        <div class="sb_box">
                    <table>
         <tr><td><a href="personel.jsp"><img src="../icons/png/48x48/back.png" width="48" height="48" alt="Personel Sayfası"/>Personel Sayfası</a></td></tr>
         <tr><td><a href="../logoutPersonel.jsp"><img src="../icons/png/48x48/lock.png" width="48" height="48" alt="Çıkış Yap"/>Çıkış Yap</a></td></tr>
                    </table>
                </div> 
        
    <div class="sb_box">
    <div id="contact_form">

<%
    baglan baglanti = new baglan();
    Connection con = baglanti.VeritabaninaBaglan();
    
    PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ders`;");
    ResultSet result = pstmt.executeQuery();
    
    PreparedStatement pstmt1 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`bolum` WHERE Ders_ID=?;");
    PreparedStatement pstmt2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`altbolum` WHERE Bolum_ID=?;");
 
    PreparedStatement pstmtPersonel = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE Hoca_ID=? AND Durum=1 ;");
    pstmtPersonel.setInt(1, Integer.parseInt(personel.getHoca_ID()));
    ResultSet resultPersonel=pstmtPersonel.executeQuery();
    int sahipSoruSayisi=0;
    if(resultPersonel.next()){
    sahipSoruSayisi=resultPersonel.getInt(1);
    }
    
    PreparedStatement pstmtPersonel2 = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE Hoca_ID=? AND Durum=0 ;");
    pstmtPersonel2.setInt(1, Integer.parseInt(personel.getHoca_ID()));
    ResultSet resultPersonel2=pstmtPersonel2.executeQuery();
    int sahipSoruSayisi2=0;
    if(resultPersonel2.next()){
    sahipSoruSayisi2=resultPersonel2.getInt(1);
    }
    
%>

<div><b>Size ait <b style="color: red;"><%=sahipSoruSayisi%></b> Soru Mevcuttur</b></div>
<div><b>Onay Bekleyen <b style="color: red;"><%=sahipSoruSayisi2%></b> Soru Mevcuttur</b></div>
<div><input type="button" id="kakg" value="Konu&AltKonu Ekle" name="kakg" /></div>


<ul id="menu">
    <%
        while (result.next()) {
            out.println("<li><a href=\"#\">");
            out.println(result.getString("Ders_Ad"));
            out.println("</a>");
            pstmt1.setString(1, result.getString("Ders_ID"));
            ResultSet result1 = pstmt1.executeQuery();

            int deger01 = 0;
            while (result1.next()) {
                if (deger01 == 0) {
                    out.println("<ul style=\"z-index: 100\">");
                    deger01++;
                }
                out.println("<li><a href=\"#\">");
                out.println(result1.getString("Bolum_Ad"));
                out.println("</a>");
                pstmt2.setString(1, result1.getString("Bolum_ID"));
                ResultSet result2 = pstmt2.executeQuery();
                
            int deger0 = 0;
            while (result2.next()) {
                if (deger0 == 0) {
                    out.println("<ul style=\"z-index: 100\">");
                    deger0++;
                }
                        out.println("<li><a href=\"sorular.jsp?AltBolum_ID="+result2.getString("AltBolum_ID")+"\">");
                        out.println(result2.getString("AltBolum_Ad"));
                        out.println("</a>");
                        out.println("</li><hr>");
                
                int deger1 = 0;

                if (deger1 == 1) {
                    out.println("</ul>");
                }
                out.println("</li><hr>");
            }
            if (deger0 == 1) {
                out.println("</ul>");
            }
            out.println("</li><hr>");
            }
            if (deger01 == 1) {
                out.println("</ul>");
            }
            out.println("</li><hr>");
        }

        



    %>
</ul>

    </div>
    </div>
    <div class="cleaner"></div>
</div> 
    
<div id="templatemo_content">  
    <form name="f4" id="f4" action="KonuKaydet.jsp" method="POST">
               <table>
               <tr>
            <td>
           <select name="txtDers1" id="txtDers1"   style="width:95px;">
               <option value="0">Ders Seç</option>
               <%

                PreparedStatement pstmtUstBirim2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ders`;");
                ResultSet resultpstmtUstBirim2 = pstmtUstBirim2.executeQuery();
                while(resultpstmtUstBirim2.next()){
                out.println("<option value='"+resultpstmtUstBirim2.getInt("Ders_ID")+"'>"+resultpstmtUstBirim2.getString("Ders_Ad")+"</option>");
               }
               %>
               </select>
           </td>
                    
                    <td><input type="text" name="txtKonu" id="txtKonu" value="AD" size="30"  /></td>
                    <td><input type="submit" value="Kaydet" name="btn_KonuKaydet"  /></td>
               <td></td>
               <td>Konu Ekle</td>
       </tr> 
       </table>
             </form>
                            <form name="f5" id="f5" action="AltKonuKaydet.jsp" method="POST">

               <table>
                       <tr>
           <td>
           <select name="txtKonu1" id="txtKonu1" style="width:95px;">
               <option value="0">Konu Seç</option>
               <%
            

                PreparedStatement pstmtUstBirim3 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`bolum`;");
                ResultSet resultpstmtUstBirim3 = pstmtUstBirim3.executeQuery();
                while(resultpstmtUstBirim3.next()){
                out.println("<option value='"+resultpstmtUstBirim3.getInt("Bolum_ID")+"'>"+resultpstmtUstBirim3.getString("Bolum_Ad")+"</option>");
               }
               %>
               </select>
           </td>
           
                    <td><input type="text" name="txtAltKonu" id="txtAltKonu" value="AD" size="30"  /></td>
                    <td><input type="submit" value="Kaydet" name="btn_AltKonuKaydet" /></td>
                    <td></td>
                    <td>AltKonu Ekle</td>
       </tr>
            
           </table>
                            </form>
<%
        String  AltBolum_ID=request.getParameter("AltBolum_ID");
        
            if(AltBolum_ID==null){
                out.print("<h4>Açılır menüden Ders ismi seçin</h4>");
            }else{
    
    String  AltBolum_Ad=null;
    String  dizi[]=null;
    int     soruSayisi=0;
    
    
    
  
    PreparedStatement pstmt10 = (PreparedStatement) con.prepareStatement("SELECT  * FROM `sinav`.`altbolum` WHERE AltBolum_ID=?;");
    PreparedStatement pstmt11 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Durum=1 ;");
    PreparedStatement pstmt12 = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=? AND Durum=1 ;");
   
       
    pstmt10.setString(1, AltBolum_ID);
    ResultSet result10 = pstmt10.executeQuery();
    if(result10.next()){AltBolum_Ad=result10.getString("AltBolum_Ad");}
        
    
    pstmt12.setString(1, AltBolum_ID);
    ResultSet result12=pstmt12.executeQuery();
    if(result12.next()){soruSayisi=result12.getInt(1);}
            
    
    pstmt11.setString(1, AltBolum_ID);
    ResultSet result11=pstmt11.executeQuery();
    
    dizi=new String[soruSayisi];
    
    for(int i=0;result11.next();i++){
         dizi[i]=result11.getString("Ozellik_ID");
    }

    
    %>

<div id="tabs" >
    <ul>
        <li><a href="#tabs-1"><img src="../IMAGE/guncelle.png"/>SORU DETAY</a></li>
        <li><a href="#tabs-2"><img src="../IMAGE/soruEkle.png"/>SORU EKLE</a></li>
        <li>Alt Bölüm: <%=AltBolum_Ad%><br><p>Toplam Soru Sayısı:<%=soruSayisi%></li>
    </ul>
    
    <div id="tabs-1"  >
        
        <% 
        if(soruSayisi!=0){
        %>
         
        <form action="sorular.jsp?AltBolum_ID=<%=AltBolum_ID%>" name="yon" method="POST" style="float: left;">
            
            <%
            String sayac=request.getParameter("sayac");
            int sayacInt=0;
            int a=0;
            
            if(sayac!=null){
                sayacInt=Integer.parseInt(sayac);
                
                if(sayacInt<0){sayacInt=0;}
                else if(sayacInt>soruSayisi-1){sayacInt=soruSayisi-1;}
                else{}
            %>
            <input type="hidden" name="sayac" id="sayac" value="<%=sayacInt%>" />
            <%
            }else{
            %>
            <input type="hidden" name="sayac" id="sayac" value="<%=a%>" />
            <%
            
            }

            %>
            
            
        <table>
            <%
            
            %>
            
               <tr>
                  <td>Soru:<%=sayacInt+1%><button type="button" id="butonAzalt" name="butonAzalt" onClick="herhangi(0);" > <img  width="32" height="18" src="../IMAGE/sol.png"/></button></td>
                  <td><button type="button" id="butonArttir" name="butonArttir" onClick="herhangi(1);" ><img  width="32" height="18" src="../IMAGE/sag.png"/> </button></td>
               </tr>
    
         </table></form> 
                 
                 
                   
                   <table style="width:600px; height: 32px; float: left;">
                       
                   <tr>
                   <td><button id="butonGuncelle" onClick="guncelle(<%=sayac%>);" type="button" >SORU GÜNCELLE</button></td>
                   <td><a href="soruSil.jsp?Ozellik_ID=<%=dizi[sayacInt%soruSayisi]%>&AltBolum_ID=<%=AltBolum_ID%>&sayac=<%=sayacInt%>"> <button name="butonSil" id="butonSil">SORUYU SİL</button></a></td>
                   <td><button type="button" id="butonEkle">SORUYA ŞIK EKLE</button></td>
                   <td><input type="text" name="txtSayac" id="txtSayac" value="" size="5" /><button type="button" name="butonGit" id="butonGit" >GİT</button></td>
                   </tr>
               
                   </table>
                    
    
                 
                 
    <form name="icerik" action="soruduzenle.jsp?Ozellik_ID=<%=dizi[sayacInt%soruSayisi]%>&AltBolum_ID=<%=AltBolum_ID%>&sayac=<%=sayacInt+""%>" method="POST">
   <table id="duzenleTable" name="duzenleTable" style="width:750px;height:400px;">
                           <%   
                 
        PreparedStatement pstmt13 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Ozellik_ID=?;");
        PreparedStatement pstmt14 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=?;");
        PreparedStatement pstmt15 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE Ozellik_ID=?;");   
             
               
                int  girdisayisi=0;
                int gelen=0;
                pstmt13.setString(1,dizi[sayacInt%soruSayisi]);
                ResultSet result13=pstmt13.executeQuery();
                
                while(result13.next()){
                     pstmt15.setString(1,dizi[sayacInt%soruSayisi]);
                        ResultSet result15=pstmt15.executeQuery();
                        if(result15.next()){
                                gelen=Integer.parseInt(result15.getString("Zorluk"));    
                        }
                                        
                     
                     String dizi2[]={"","ÇOK KOLAY","KOLAY","ORTA","ZOR","ÇOK ZOR"};
  
                    out.println("<tr>");
                if(result13.getString("resim_Ad")!=null){
                 out.println("<td><img  name=\"selectSoru\" width=\"120\" height=\"120\" src=\"../SoruCevap/"+result13.getString("resim_Ad")+"\"/></td>");
                }else{
                out.println("<td></td>");
                }
                out.print("<td><textarea name=\"txtSoru\" style=\"width:300px;height:120px;\">"+result13.getString("Soru")+"</textarea></td>");
                out.print("<td>"
                + "<select style=\"width:85px;\" name=\"boxSoru\">"
                + " <option style=\"background-color:green;\" value=\""+gelen+"\">"+dizi2[gelen]+" </option>"
                + " <option value=\""+1+"\">"+dizi2[1]+" </option>"
                + " <option value=\""+2+"\">"+dizi2[2]+" </option> "
                + " <option value=\""+3+"\">"+dizi2[3]+" </option> "
                + " <option value=\""+4+"\">"+dizi2[4]+" </option>"
                + " <option value=\""+5+"\">"+dizi2[5]+" </option>"
                + " </select> </td>");
                    out.println("</tr>");
                }
                pstmt14.setString(1,dizi[sayacInt%soruSayisi]);
                ResultSet result14=pstmt14.executeQuery();
                
                while(result14.next()){
                    String gelenC=result14.getString("DogruYanlis_ID");
                    String bir=null;
                    String iki=null;
                    int bir1=0;
                    int iki2=0;
                    if(gelenC.equals("0")){
                        bir="YANLIŞ";
                        bir1=0;
                        iki="DOĞRU";
                        iki2=1;
                                          }
                    else{
                    
                        bir="DOĞRU";
                        bir1=1;
                        iki="YANLIŞ";
                        iki2=0;
                        }
                girdisayisi++;     
                out.println("<tr>");
                if(result14.getString("resim_Ad")!=null){
                 out.println("<td><img name=\"select"+girdisayisi+" \" width=\"32\" height=\"32\" src=\"../SoruCevap/"+result14.getString("resim_Ad")+"\"/></td>");
                }else{
                out.println("<td></td>");
                }
                
                out.println("<td width=\"30%\"><input type=\"text\" name=\"txt"+girdisayisi+"\" value=\""+result14.getString("Cevap")+"\" size=\"37\"/></td>"
                        + " <td><select name=\"box"+girdisayisi+"\" id=\"box"+girdisayisi+"\" ><option value=\""+bir1+"\">"+bir+"</option><option  value=\""+iki2+"\">"+iki+"</option></select></td>");
                    
                  out.println("</tr>");
                }      
                %>
                
                <input type="hidden" name="girdiSayisi" id="girdiSayisi" value="<%=girdisayisi%>"/>
               
                <%
                 }else{
                 
                 out.println("Bu Alt Bölüme Ait Soru Mevcut Değildir.<br> Lütfen Soru Ekleyin..");
                 }
                %>                   
                         
                     </table>
                   
                   </form>
                   
                
    </div>

                
        <div id="tabs-2" >
        <form name="ekleme" action="soruEkleme.jsp?AltBolum_ID=<%=AltBolum_ID%>&sayac=<%=soruSayisi+""%>" method="POST">
        
        <table id="soruTable" name="soruTable" >
        <tr>
            <td><textarea name="txtSoru" rows="6" cols="40"></textarea></td>
               <td><select name="boxSoru">
            <option value="1">ÇOK KOLAY</option>
            <option value="3">ORTA</option>
            <option value="2">KOLAY</option>
            <option value="4">ZOR</option>
            <option value="5">ÇOK ZOR</option>
        </select></td><td><input type="file" name="selectSoru" value="" width="4" /></td> 
            
        </tr>
        
        <tr>
            <td><input type="text" name="txt1" value="" size="40" /></td>
            <td>
                <select name="box21" id="box21">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                </select>
            </td>
            <td><input type="file" name="select1" value="" width="4" /></td>
        </tr>
    
        
        
        <tr>
            <td><input type="text" name="txt2" value="" size="40" /></td>
            <td>
                <select name="box22" id="box22">
           <option value="0">YANLIŞ</option>
           <option value="1">DOĞRU</option>
            
                </select>
            </td>
            <td><input type="file" name="select2" value="" width="4" /></td>
        </tr>
        
        
         <tr>
            <td><input type="text" name="txt3" value="" size="40" /></td>
            <td>
                <select name="box23" id="box23">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                 </select>
            </td>
            <td><input type="file" name="select3" value="" width="4" /></td>
        </tr>
        
        
        
        <tr>
            <td><input type="text" name="txt4" value="" size="40" /></td>
            <td>
                <select name="box24" id="box24">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                </select>
            </td>
            
            <td><input type="file" name="select4" value="" width="4" /></td>
                
            </tr>
                <tr>
            <td><input type="text" name="txt5" value="" size="40" /></td>
            <td><select name="box25" id="box25">
                    <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                </select></td>
                
            <td><input type="file" name="select5" value="" width="4" /></td>
                </tr>
    </table>
        
        <table>
            <tr>
                <td><input type="button" value="Soruyu Kaydet" id="kaydet" name="kaydet"/></td>
            <td></td>
            <td><input type="button" value="Şık Ekle" id="ekle" name="ekle"/></td>
            
        </tr>
        </table>
            </form>
</div>
</div>
    <%
    }
    %>
 </div> 
 <div class="cleaner"></div>
 </div>
 </div> 
 </div>  
 
    <%
    }
    %>
    
</body>
</html>