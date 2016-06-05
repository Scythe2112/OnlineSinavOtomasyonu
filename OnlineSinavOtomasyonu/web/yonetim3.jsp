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
    
        <style>
    body { font-size: 62.5%; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
  </style>
  
    <script>
  $(function () {
      
      var 
      name = $( "#txtAlici" ).val(),
      email = $( "#txtMesaj" ).val(),
      allFields = $( [] ).add( name ).add( email );
      
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Gönder": function() {
                       
        if($( "#txtAlici" ).val()=="1"){alert("Alıcı Seçin .");}
        else if($( "#txtMesaj" ).val().length<10){alert("Mesajınız en az 10 karakterden oluşmalıdır.");}
        else{
            
              $.ajax({
            type: "POST",
            url: 'JSP/MesajKaydet.jsp',
            data: "mesaj_Alan="+$( "#txtAlici" ).val()+"&mesaj_Mesaj="+$( "#txtMesaj" ).val(),
            success: function (sonuc) {
                alert(sonuc);
                $( "#dialog-form" ).dialog( "close" );
                                      }
            });    
            
        }
        },
        Kapat: function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $("#create-user")
        .button()
        .click(function() {
        $("#dialog-form" ).dialog( "open" );
        
      });
  });
  
  </script>
    
    <script>
            function mesaj_getir(id){
            
            $.ajax({
            type: "POST",
            url: 'JSP/MesajGetir.jsp',
            data: "mesaj_ID="+id,
            success: function (sonuc) {
                alert(sonuc);
                window.location.reload();
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

<div id="dialog-form" title="Mesaj Gönder">
  <p class="validateTips">Firat Üniversitesi</p>
 
  <form>
  <fieldset>
      <label for="alici">Alıcı:</label>
      <select name="txtAlici" id="txtAlici">
          <option value="1">Alıcı Seç:</option>
      
    <%
                baglan baglanti=new baglan();
                Connection con=baglanti.VeritabaninaBaglan();
                
                PreparedStatement Hoca = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`hoca`;");
                ResultSet resultHoca = Hoca.executeQuery();
                while(resultHoca.next()){
                out.println("<option value='"+resultHoca.getInt("Hoca_ID")+"'>"+resultHoca.getString("Hoca_Ad")+" "+resultHoca.getString("Hoca_Soyadi")+"</option>");
               }
    %>
    </select>
    <label for="mesaj">Mesaj:</label>
    <textarea name="txtMesaj" id="txtMesaj" rows="6" cols="60"></textarea>
  </fieldset>
  </form>
</div>

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
         <tr><td><a href="yonetim2.jsp"><img src="icons/png/48x48/add_to_folder.png" width="48" height="48" alt="Birim-Bölüm-Ders Ekle"/>Birim-Bölüm-Ders Ekle</a></td></tr>
         <tr><td><a href="#"><img src="icons/png/48x48/mail_receive.png" width="48" height="48" alt="Mesaj Gelen Kutusu"/>Mesaj Gelen Kutusu</a></td></tr>
         <tr><td><a href="yonetim4.jsp"><img src="icons/png/48x48/accept.png" width="48" height="48" alt="Soru Onayla"/>Soru Onayla</a></td></tr>
         <tr><td><a href="javascript:Ogrenme()"><img src="icons/png/48x48/chart.png" width="48" height="48" alt="Öğrenme"/>Yapay Öğrenme</a></td></tr>

                    </table>
                </div> 
                </div>

            <div id="templatemo_content">
                <center><button id="create-user">Mesaj Gönder</button></center>
<table id='rounded-corner'>

            <% 

        String durum="";
        
 PreparedStatement pstmt =
         (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`mesaj` WHERE  mesaj_Alan=?;");
            
                pstmt.setString(1,"1");
                ResultSet result = pstmt.executeQuery();
                 
 PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE  Hoca_ID=?;");
            
            int i=0;
            while(result.next()){
                
                pstmt2.setInt(1, Integer.parseInt(result.getString("mesaj_Gonderen")));
                ResultSet result2 = pstmt2.executeQuery();
                durum=result.getString("mesaj_Durum");
                
                if(result2.next()){
                 i++;   
                if(durum.equals("1")){
                out.println("<tr><td><b style='color:green;'>"+result.getString("mesaj_Gonderen")+"-"+result2.getString("Hoca_Ad")+" "+result2.getString("Hoca_Soyadi")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='JSP/mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='IMAGE/delete.png'/></a></td></tr>");
                                     }
                else {
                out.println("<tr><td><b style='color:red;'>"+result.getString("mesaj_Gonderen")+"-"+result2.getString("Hoca_Ad")+" "+result2.getString("Hoca_Soyadi")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='JSP/mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='IMAGE/delete.png'/></a></td></tr>");

                }
                
                
                }
                
            }
            if(i==0){out.print("<tr><td>MESAJINIZ YOK</td></tr>");}
            
            
            %>
        </table>
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
