
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>YÖNETİM PANELİ</title>
    
    <link type="text/css" rel="Stylesheet" href="style.css"/>
    <link href="CSS/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    
    <script  type="text/javascript" src="jquery.js"></script>
    <script  type="text/javascript" src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
        
    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }

    </script>


    
    <script type="text/javascript" >
            $(document).ready(function(){
              $("#btnOgrenme").button();
              

            });
            
             function Ogrenme(){

            $.ajax({
            type: "POST",
            url: 'JSP/Ogrenme.jsp',
            data: "",
            success: function (sonuc) {
            alert(sonuc);
                                      }
            }); 
                  
             }
             
            function Birim_Kaydet(){
            Birim_ID=$("#txtBirimID").val();
            Birim=$("#txtBirim").val();
            if(Birim_ID=="" || Birim_ID=="ID" || Birim=="" ||Birim=="AD"){
             alert("Hatalı Giriş..Parametleri Kontrol Edin !!");   
            }else{
            $.ajax({
            type: "POST",
            url: 'JSP/BirimKaydet.jsp',
            data: "txtBirimID="+Birim_ID+"&txtBirim="+Birim,
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            }    
            }
            
            function Bolum_Kaydet(){
            Birimm=$("#Bir").val();
            Bolum_ID=$("#txtBolumID").val();
            Bolum=$("#txtBolum").val();
            
            if(Bolum_ID=="" || Bolum_ID=="ID" || Bolum=="" ||Bolum=="AD" || Birimm=="0"){
             alert("Hatalı Giriş..Parametleri Kontrol Edin !!");   
            }else{
            $.ajax({
            type: "POST",
            url: 'JSP/BolumKaydet.jsp',
            data: "txtBirim="+Birimm+"&txtBolumID="+Bolum_ID+"&txtBolum="+Bolum,
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            }    
            }
            
            
            function Ders_Kaydet(){
            
            Ders_ID=$("#txtDersId").val();
            Ders=$("#txtDers").val();
            
            if(Ders_ID=="" || Ders_ID=="ID" || Ders=="" ||Ders=="AD"){
             alert("Hatalı Giriş..Parametleri Kontrol Edin !!");   
            }else{
            $.ajax({
            type: "POST",
            url: 'JSP/DersKaydet.jsp',
            data: "txtDers="+Ders+"&txtDersID="+Ders_ID,
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            }    
            }
            
            
            function Konu_Kaydet(){
            
            Derss=$("#iki").val();
            Konu=$("#txtKonu").val();
            
            if(Konu=="" ||Konu=="AD" || Derss=="0"){
             alert("Hatalı Giriş..Parametleri Kontrol Edin !!");   
            }else{
            $.ajax({
            type: "POST",
            url: 'JSP/KonuKaydet.jsp',
            data: "txtKonu="+Konu+"&txtDers="+Derss,
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            }    
            }
            
            
            function AltKonu_Kaydet(){
            
            Konuu=$("#uc").val();
            AltKonu=$("#txtAltKonu").val();
            
            if(AltKonu=="" ||AltKonu=="AD" || Konuu=="0"){
             alert("Hatalı Giriş..Parametleri Kontrol Edin !!");   
            }else{
            $.ajax({
            type: "POST",
            url: 'JSP/AltKonuKaydet.jsp',
            data: "txtAltKonu="+AltKonu+"&txtKonu="+Konuu,
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            }    
            }
            
            function Ogrenme(){

            $.ajax({
            type: "POST",
            url: 'JSP/Ogrenme.jsp',
            data: "",
            success: function (sonuc) {
            alert(sonuc);
                                      }
            }); 
                  
             }
             
            function uyeSil(id){
            
            $.ajax({
            type: "POST",
            url: 'Kayit_Getir.jsp',
            data: "islem=2&uye_id="+id,
            success: function (sonuc) {
 
                if(sonuc==2){
                        alert("Kayıt Reddedildi.");
                    window.location.reload();}
                                      }
            });    
            }    


    </script>
    
    
</head>


<body>

    <%
  Yonetici yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
    
    if(yonetici==null){
        response.sendRedirect("index.jsp");
    }else{
      String isim=yonetici.getAd().toString();
      String soyisim=yonetici.getSoyad().toString();
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
<div id="contact_form">
            <h4>Hoşgeldiniz Sayın:</h4>
            <h5><% out.print(isim+" "+soyisim); %>&nbsp;&nbsp;&nbsp;<a href="logoutYonetici.jsp">Çıkış<img src="icons/png/32x32/unlock.png" width="32" height="32" alt="Arama"/></a></h5>

</div>
</div>  

                <div class="sb_box">
                    <table>
         <tr><td><a href="yonetim1.jsp"><img src="icons/png/48x48/user.png" width="48" height="48" alt="Personel Ekle"/>Personel Ekle</a></td></tr>
         <tr><td><a href="#"><img src="icons/png/48x48/add_to_folder.png" width="48" height="48" alt="Birim-Bölüm-Ders Ekle"/>Birim-Bölüm-Ders Ekle</a></td></tr>
         <tr><td><a href="yonetim3.jsp"><img src="icons/png/48x48/mail_receive.png" width="48" height="48" alt="Mesaj Gelen Kutusu"/>Mesaj Gelen Kutusu</a></td></tr>
         <tr><td><a href="yonetim4.jsp"><img src="icons/png/48x48/accept.png" width="48" height="48" alt="Soru Onayla"/>Soru Onayla</a></td></tr>
         <tr><td><a href="javascript:Ogrenme()"><img src="icons/png/48x48/chart.png" width="48" height="48" alt="Öğrenme"/>Yapay Öğrenme</a></td></tr>

                    </table>
                </div> 
                </div>

    <div id="templatemo_content">
    <div class="sb_box">
    <div id="contact_form"> 
        <form name="f1" action="JSP/BirimKaydet.jsp" method="POST">
            <table>
                <tr>
                 
               
                    <td><input type="text" name="txtBirimID" id="txtBirimID" value="ID" size="10" /></td>
                    <td><input type="text" name="txtBirim"  id="txtBirim"  value="AD" size="30" /></td>
                    <td><input type="submit" value="Kaydet" name="btn_BirimKaydet" /></td>
                    <td></td>
                    <td>Birim</td>
                    
                </tr>
            </table>
             </form>
        
                <form name="f2" action="JSP/BolumKaydet.jsp" method="POST">

        <table>
           <tr>
           <td>
           <select name="txtBirim1"  style="width:95px;" id="txtBirim1">
               <option value="0">Birim Seç</option>
               <%
            
                baglan baglanti=new baglan();
                Connection con=baglanti.VeritabaninaBaglan();
                PreparedStatement pstmtUstBirim = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ustbirim`;");
                ResultSet resultpstmtUstBirim = pstmtUstBirim.executeQuery();
                while(resultpstmtUstBirim.next()){
                out.println("<option value='"+resultpstmtUstBirim.getInt("UstBirim_ID")+"'>"+resultpstmtUstBirim.getString("UstBirim_Ad")+"</option>");
               }
               %>
               </select>
           </td>
                    <td><input type="text" name="txtBolumID" id="txtBolumID" value="ID" size="10"  /></td>
                    <td><input type="text" name="txtBolum" id="txtBolum" value="AD" size="30"  /></td>
                    <td><input type="submit" value="Kaydet" name="btn_BolumKaydet" /></td>
                    <td>Bölüm</td>
       </tr>                                
        </table>
                </form>
               
                               <form name="f3" action="JSP/DersKaydet.jsp" method="POST">

               <table>
                <tr>
                    <td><input type="text" name="txtDersID" id="txtDersID" value="ID" size="10" /></td>
                    <td><input type="text" name="txtDers" id="txtDers" value="AD" size="30"  /></td>
                    <td><input type="submit" value="Kaydet" name="btn_DersKaydet" /></td>
                    <td></td>
                    <td></td>
                    <td>Ders</td>
                </tr>
           </table>
                </form>  
               
             <form name="f4" action="JSP/KonuKaydet.jsp" method="POST">

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
               <td>Konu</td>
       </tr> 
       </table>
             </form>
                            <form name="f4" action="JSP/AltKonuKaydet.jsp" method="POST">

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
                    <td>AltKonu</td>
       </tr>
            
           </table>
                            </form>

          </div> 
          </div>
            </div>
            <div class="cleaner"></div>
            </div>


</div> 
</div>
<script type='text/javascript' src='js2/logging.js'></script>
<%
    }
%>
</body>
</html>
