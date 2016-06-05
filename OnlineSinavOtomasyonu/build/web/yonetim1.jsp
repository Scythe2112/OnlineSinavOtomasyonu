
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>YÖNETİM PANELİ</title>
    
    <link type="text/css" href="style.css" rel="Stylesheet" />
    <link type="text/css" href="CSS/templatemo_style.css" rel="stylesheet"  />
    <link type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    
    <script  type="text/javascript" src="jquery.js"></script>
    <script  type="text/javascript" src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" language="javascript" >
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }
    </script>

    
    <script type="text/javascript" >
            function birim_GetirHoca(){
            $.ajax({
            type: "GET",
            url: 'JSP/birimGetir.jsp',
            data: "UstBirim_ID="+$("#boxUstBirimHoca").val(),
            success: function (sonuc) {
            document.getElementById("boxBirimHoca").innerHTML=sonuc;
                                      }
            });    
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
             
            function Hoca_Ekle(id){
            
            $.ajax({
            type: "POST",
            url: 'Mesaj_Getir.jsp',
            data: "islem=2&yorum_id="+id,
            success: function (sonuc) {
                
                if(sonuc==2){
                        alert("Mesaj Silindi");
                    window.location.reload();}
                                      }
            });    
            }    
            
        $(document).ready(function() {
   
         });

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
    
    if(request.getParameter("hhs")!=null){
    if(request.getParameter("hhs").equals("DCW2F260")){
    %>
    <script  type="text/javascript" language="javascript" >
        alert("Hoca Kaydı Başarı İle Eklendi.");
        window.location.href="yonetim1.jsp";
    </script>
    
    <%
    }else if(request.getParameter("hhs").equals("N239ND25")){
    %>
         <script  type="text/javascript" language="javascript" >
        alert("Hoca Kaydı Mevcuttur !");
         window.location.href="yonetim1.jsp";
        </script>
    <%
    }else if(request.getParameter("hhs").equals("MFA")){
        
    %>
        <script  type="text/javascript" language="javascript" >
        alert("Giriş Parametrelerini kontrol edin !");
        window.location.href="yonetim1.jsp";
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
         <tr><td><a href="#"><img src="icons/png/48x48/user.png" width="48" height="48" alt="Personel Ekle"/>Personel Ekle</a></td></tr>
         <tr><td><a href="yonetim2.jsp"><img src="icons/png/48x48/add_to_folder.png" width="48" height="48" alt="Birim-Bölüm-Ders Ekle"/>Birim-Bölüm-Ders Ekle</a></td></tr>
         <tr><td><a href="yonetim3.jsp"><img src="icons/png/48x48/mail_receive.png" width="48" height="48" alt="Mesaj Gelen Kutusu"/>Mesaj Gelen Kutusu</a></td></tr>
         <tr><td><a href="yonetim4.jsp"><img src="icons/png/48x48/accept.png" width="48" height="48" alt="Soru Onayla"/>Soru Onayla</a></td></tr>
         <tr><td><a href="javascript:Ogrenme()"><img src="icons/png/48x48/chart.png" width="48" height="48" alt="Öğrenme"/>Yapay Öğrenme</a></td></tr>
                    </table>
                </div> 
                </div>

<div id="templatemo_content">
   <form name="f2" action="JSP/HocaKaydet.jsp" method="POST">        
          
          <table>                                  

            <tr>                
           <td>Ad:</td>
           <td><input type="text" name="HocaAd"  value="" /></td>
             </tr>      
               
             <tr>                
           <td>Soyad:</td>
           <td><input type="text" name="HocaSoyad"  value="" /></td>
             </tr> 
           
             <tr>                
           <td>Şifre:</td>
           <td><input type="text" name="HocaSifre"  value="" /></td>
             </tr> 
             
             <tr>                
           <td>E-Posta:</td>
           <td><input type="text" name="HocaPosta"  value="" /></td>
             </tr> 
             
             <tr>
                    <td>Resim:</td>
               <td><input type="file" name="fileHocaResim"  value="" /></td>
               </tr>
               
            
                
             
             <tr>
           <td>Birim:</td>
           <td>
           <select name="boxUstBirimHoca" id="boxUstBirimHoca" onchange="birim_GetirHoca();">
               <option value="0">Birim Seç</option>
               <%
                            
                baglan baglanti=new baglan();
                Connection con=baglanti.VeritabaninaBaglan();            
                PreparedStatement pstmtUstBirim2 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`ustbirim`;");
                ResultSet resultpstmtUstBirim2 = pstmtUstBirim2.executeQuery();
         
                while(resultpstmtUstBirim2.next()){
                out.println("<option value='"+resultpstmtUstBirim2.getInt("UstBirim_ID")+"'>"+resultpstmtUstBirim2.getString("UstBirim_Ad")+"</option>");
                }
                
               %>
               </select>
           </td>
           </tr>                                
                
           <tr>                
                <td>Bölüm:</td>
           <td>
                   <select name="HocaBirimHoca" id="boxBirimHoca">
                        <option value='0'>Bölüm Seç</option>
                   </select>
           </td>
           </tr>
           <tr><td></td><td><input type="submit" value="Ekle" name="btnHocaEkle" /></td></tr>
           
             
        </table>
      
</form>
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