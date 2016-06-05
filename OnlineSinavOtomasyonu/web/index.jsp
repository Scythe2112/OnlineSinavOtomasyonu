<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <%
        Personel  personel=(Personel)session.getAttribute("personelInfo");
        Ogrenci   ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");
        Yonetici  yonetici=(Yonetici)session.getAttribute("yoneticiInfo");
        
        if(personel==null && ogrenci==null && yonetici==null){
                }else if(ogrenci!=null){
                    response.sendRedirect("JSP/ogrenci.jsp");
                }else if(personel!=null){
                    response.sendRedirect("JSP/personel.jsp");
                }else{
                    response.sendRedirect("JSP/yonetim.jsp");
                }

    %>  
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FÜOSS</title>
    <link   href="CSS/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link   href="CSS/nivo-slider.css" type="text/css" rel="stylesheet" media="screen" />
    <script src="js2/jquery.min.js" type="text/javascript"></script>
    <script src="js2/jquery.nivo.slider.js" type="text/javascript"></script>

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
    
    function slid(){
        
             $("#slider").nivoSlider({
                effect: 'random',
                slices: 15,
                animSpeed: 700,
                pauseTime: 2500,
                startSlide: 0, //Set starting Slide (0 index)
                directionNav: false,
                directionNavHide: false, //Only show on hover
                controlNav: false, //1,2,3...
                controlNavThumbs: false, //Use thumbnails for Control Nav
                pauseOnHover: true, //Stop animation while hovering
                manualAdvance: false, //Force manual transitions
                captionOpacity: 0.6, //Universal caption opacity
                beforeChange: function() {
                },
                afterChange: function() {
                },
                slideshowEnd: function() {
                } //Triggers after all slides have been shown
            });   
        
        
    }
    $(document).ready(function(){
        //$("#GirisPaneli").accordion();         
    });
    
</script>

</head>
<body onload="slid();">
    
  <%
  String giris=request.getParameter("giris");
  if(giris!=null){
  if(giris.equals("false")){
  %>
      <script language="javascript" type="text/javascript">
          alert("HATALI GİRİŞ YAPTINIZ");
          document.location.href="index.jsp";
      </script>
 
  <%
  }}
  %>
  
    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top"><h3 style="text-align: center;">FIRAT ÜNİVERSİTESİ ONLİNE SINAV SİSTEMİ</h3></div>
    <div id="templatemo_main">
    <div id="templatemo_sidebar">
    
      <div class="sb_box">
      <div id="contact_form">
      <h4><img src="icons/png/48x48/user.png" width="48" height="48" alt="Üye Girişi"/>GİRİŞ</h4>
      
      <form  action="login.jsp" method="post">
      <label for="No">Öğrenci No/Personel Sicil No :</label>
      <input type="text" id="No" name="No" class="validate-email required input_field" />
      <label for="Parola">Parola:</label> 
      <input type="password" id="Parola1" name="Parola" class="input_field" />
      <input type="submit" name="girisbutton" value="GİRİŞ" id="girisbutton" title="GİRİŞ" />
      </form> 
      
    </div>
    </div>   

<div class="cleaner"></div>
</div>
            <div id="templatemo_content">
    
    <div id="slider">
        <a href="https://yeni.firat.edu.tr/" target="_blank"><img src="img/slideshow/01.jpg" alt="FIRAT ÜNİVERSİTESİ WEB ANASAYFASI" title="FIRAT ÜNİVERSİTESİ WEB ANASAYFASI" /></a>
        <a href="https://yeni.firat.edu.tr/galeri/" target="_blank"><img src="img/slideshow/02.jpg" alt="FIRAT ÜNİVERSİTESİ MEDYA GALERİSİ" title="FIRAT ÜNİVERSİTESİ MEDYA GALERİSİ" /></a>
        <a href="https://obs.firat.edu.tr/" target="_blank" ><img src="img/slideshow/03.jpg" alt="FIRAT ÜNİVERSİTESİ ÖĞRENCİ İŞLERİ OTOMASYONU" title="FIRAT ÜNİVERSİTESİ ÖĞRENCİ İŞLERİ OTOMASYONU" /></a>
       
    </div>
</div>
<div class="cleaner"></div>
</div>
</div> 
</div>

</body>
<%
    
%>
</html>