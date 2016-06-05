
<%-- 
    Document   : sinavEkran
    Created on : 27.Eyl.2013, 21:23:26
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.baglan"%>
<%@page import="Beans.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sınav Ekranı</title>
    
    <script type="text/javascript" src="../JS/jqueryFullScreen.js"></script>
    <script  type="text/javascript" src="../JS/sinavSoru.js"></script>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../JS/sinavEkran.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../JS/jquery.fullscreen-0.3.5.min.js"></script>

    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <link type="text/css" href="../CSS/personel.css" rel="Stylesheet"/>

    <link   type="text/css" rel="Stylesheet" href="style.css"/>
    <link   href="../CSS/templatemo_style.css" rel="stylesheet" type="text/css" />

    
    <script language="JavaScript">
   
   <%
       Ogrenci ogrenci=(Ogrenci)session.getAttribute("ogrenciInfo");

       if(ogrenci==null){
          response.sendRedirect("../index.jsp");
                        }
       else if((Integer)session.getAttribute("sure")==0)
             {
              response.sendRedirect("../index.jsp");
             }
       else
       {
    String Sinav_ID=request.getParameter("DF17ssh");
    int sure=(Integer)session.getAttribute("sure");
    
    baglan baglanti=new baglan();
    Connection con=baglanti.VeritabaninaBaglan();

    session.setAttribute("sira", 0);
        
    PreparedStatement pstmtSorgu = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci_sonuc` WHERE  Sinav_ID=? AND Ogrenci_ID=?;");
    pstmtSorgu.setInt(1,Integer.parseInt(Sinav_ID));
    pstmtSorgu.setInt(2,Integer.parseInt(ogrenci.getOgrenci_ID()));
    
    ResultSet resultSorgu = pstmtSorgu.executeQuery();
    
    int durum=0;
    while(resultSorgu.next()){
    durum=resultSorgu.getInt("Tekrar");
    }
    if(durum==1 || durum==0){
    response.sendRedirect("ogrenci.jsp");
    }else{
        
    PreparedStatement pstmtO=(PreparedStatement)con.prepareStatement(
                " UPDATE `sinav`.`ogrenci_sonuc` "
                + " SET " 
                + " `Tekrar` = ?"
                + " WHERE Sinav_ID=? AND Ogrenci_ID=? ;");
        
pstmtO.setInt(1,0);
pstmtO.setInt(2, Integer.parseInt(Sinav_ID));
pstmtO.setInt(3,Integer.parseInt(ogrenci.getOgrenci_ID()));
int sonucO=pstmtO.executeUpdate();
    
    PreparedStatement pstmt3 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`sinav_icerik` WHERE  Sinav_ID=?;");
    pstmt3.setInt(1,Integer.parseInt(Sinav_ID));
    ResultSet result3 = pstmt3.executeQuery();
    
    PreparedStatement pstmt4 = 
            (PreparedStatement)con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`sinav_icerik` WHERE  Sinav_ID=?;");
    pstmt4.setInt(1,Integer.parseInt(Sinav_ID));
    ResultSet result4 = pstmt4.executeQuery();
    
    int boyut=0;
    if(result4.next()){boyut=result4.getInt(1);}
        
    int dizi[]=new int[boyut];   
    
    int i=0;
    while(result3.next()){
         dizi[i]=result3.getInt("Soru_ID");
         i++;
     }
    dizi=Methods.Mixing.shuffle(dizi);
    OzellikArray array=new OzellikArray();
    array.setDizi(dizi);
    session.setAttribute("array", array);
    
    
    
        
    %>
    
    $(document).ready(function(){
        $("#bitir").button();
        
        $("body").keypress(function(e) {
if (e.which == 27) {
return false;
}
});
    });
    
    
    
    
    
    
    
     <%
    int clock=sure;
    if(clock==0){clock=10;}
     %>
    
    var timeout=<%=clock%>
    var sag=59;
    var sol=timeout-1;
    function timer(){
        
     if(sol>0 || sag>0){
         
         document.getElementById("saat").innerHTML=sol+':'+sag;
         window.setTimeout("timer()",1000);
         sag--;
         if(sag<0){
             sol--;
             sag=59;
         }
     }else{
         
         window.location.href="ogrenci.jsp";
         
     }   
    }
    
 
          
          function sinavBasla2() {
    $( "#dialog-confirmm" ).dialog({
      resizable: true,
      height:240,
      width:440,
      modal: true,
      buttons: {
        "Başla": function() {
         toggleFullScreen();
          timer();
          getir(<%=Sinav_ID%>);
          $( this ).dialog( "close" );

        }
      }
    });
  }
function sinavBitir() {
    $( "#dialog-confirmmm" ).dialog({
      resizable: true,
      height:240,
      width:440,
      modal: true,
      buttons: {
        "Evet": function() {
            toggleFullScreen();
            window.location.href="ogrenci.jsp";
                $( this ).dialog( "close" );
        },
        Hayır: function() {
             
          $( this ).dialog( "close" );
        }
      }
    });
  }
   
</script>
          
          <script type="text/javascript">
function toggleFullScreen() {
  if ((document.fullScreenElement && document.fullScreenElement !== null) ||    // alternative standard method
      (!document.mozFullScreen && !document.webkitIsFullScreen)) {               // current working methods
    if (document.documentElement.requestFullScreen) {
      document.documentElement.requestFullScreen();
    } else if (document.documentElement.mozRequestFullScreen) {
      document.documentElement.mozRequestFullScreen();
    } else if (document.documentElement.webkitRequestFullScreen) {
      document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
    }
  } else {
    if (document.cancelFullScreen) {
      document.cancelFullScreen();
    } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if (document.webkitCancelFullScreen) {
      document.webkitCancelFullScreen();
    }
  }
}
</script>
                  
</head>

<body>
<div id="dialog-confirmm" title="Sınav Başlıyor ?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Soruları görmeye hazırsanız lütfen Başla'ya tıklayın.!</p>
</div>   

<div id="dialog-confirmmm" title="Sınav Bitiyor ?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Sınavı bitirmek istediğinize emin misin?!</p>
</div> 

  <script language="JavaScript">sinavBasla2();</script>
  
    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    <div id="templatemo_sidebar">
    
      <div class="sb_box">
            <div id="soruSirasi" name="soruSirasi">
                    
            </div>
      </div>
      <div class="cleaner"></div>      
      </div> 
    
<div id="templatemo_content">
           <div>
        <table class="CSSTableGenerator" id="personelBilgi" border="1" cellpadding="1" cellspacing="0" style="width:600px; height: 40px;">
        <tr>
           
            <td width="250px">
                <%
                out.println("Öğrenci :"+ogrenci.getOgrenci_Ad()+" "+ogrenci.getOgrenci_Soyad()+"<br>");
                
             PreparedStatement pstmt5 = 
            (PreparedStatement)con.prepareStatement("SELECT birim.Birim_Ad"
                            + " FROM sinav_anahat"
                            + " INNER JOIN birim"
                            + " ON sinav_anahat.Birim_ID=birim.Birim_ID"
                            + " WHERE Sinav_ID=? ;");
            pstmt5.setInt(1,Integer.parseInt(Sinav_ID));
            ResultSet result5 = pstmt5.executeQuery();
            
            if(result5.next()){
            out.println("Birim : "+result5.getString("Birim_Ad")+"<br>");
            }
             PreparedStatement pstmt6 = 
            (PreparedStatement)con.prepareStatement("SELECT ders.Ders_Ad"
                            + " FROM sinav_anahat"
                            + " INNER JOIN ders"
                            + " ON sinav_anahat.Ders_ID=ders.Ders_ID"
                            + " WHERE Sinav_ID=? ;");
            pstmt6.setInt(1,Integer.parseInt(Sinav_ID));
            ResultSet result6 = pstmt6.executeQuery();
            
            if(result6.next()){
            out.println("Ders : "+result6.getString("Ders_Ad")+"<br>");
            }
            
            PreparedStatement pstmt7 = 
            (PreparedStatement)con.prepareStatement("SELECT hoca.Hoca_Ad,hoca.Hoca_Soyadi"
                            + " FROM sinav_anahat"
                            + " INNER JOIN hoca"
                            + " ON sinav_anahat.Hoca_ID=hoca.Hoca_ID"
                            + " WHERE Sinav_ID=? ;");
            pstmt7.setInt(1,Integer.parseInt(Sinav_ID));
            ResultSet result7 = pstmt7.executeQuery();
            
            if(result7.next()){
            out.println("Sorumlu : "+result7.getString("Hoca_Ad")+" "+result7.getString("Hoca_Soyadi"));
            }    
                %>
            </td>
        
       
            <td style="background-color:yellow;">
            <button  id="bitir" onclick="sinavBitir();"><img src="../IMAGE/Flag.png" width="64" height="64" alt="Flag"/>SINAVI BİTİR</button>

            </td>
        
        
        
            <td width="200px" style="background-color:red;">
                <form name="forma">
                    <div ><h1 id="saat" style="color: white;" ></h1> </div>
                </form>
                
            </td>
        
       </tr> 
    </table>
            </div>
            
            

            
            
            <div  name="soruSayfasi">
                
                <form name="fff">
                <table class="CSSTableGenerator" id="soruSayfasi" border="1" cellpadding="1" cellspacing="0" style="width:600px; height: 300px;">
                    
                </table>
                </form>
            </div>
  
    
</div>

<div class="cleaner"></div>
</div>
</div> 
</div>



 
 
                
 
 
 <%
 
    }
 }
 %>
    
    
</body>
</html>
