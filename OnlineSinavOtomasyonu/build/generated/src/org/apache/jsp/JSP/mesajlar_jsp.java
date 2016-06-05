package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Methods.baglan;
import java.sql.*;
import Beans.*;

public final class mesajlar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>GELEN KUTUSU</title>\r\n");
      out.write("    \r\n");
      out.write("    <link type=\"text/css\" rel=\"Stylesheet\" href=\"../style.css\"/>\r\n");
      out.write("    <link href=\"../CSS/templatemo_style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("    <link type=\"text/css\" href=\"../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css\" rel=\"Stylesheet\"/>\r\n");
      out.write("    \r\n");
      out.write("    <script  type=\"text/javascript\" src=\"../jquery.js\"></script>\r\n");
      out.write("    <script  type=\"text/javascript\" src=\"../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("    <script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("        function clearText(field)\r\n");
      out.write("        {\r\n");
      out.write("            if (field.defaultValue == field.value)\r\n");
      out.write("                field.value = '';\r\n");
      out.write("            else if (field.value == '')\r\n");
      out.write("                field.value = field.defaultValue;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("    \r\n");
      out.write("        <style>\r\n");
      out.write("    body { font-size: 62.5%; }\r\n");
      out.write("    label, input { display:block; }\r\n");
      out.write("    input.text { margin-bottom:12px; width:95%; padding: .4em; }\r\n");
      out.write("    fieldset { padding:0; border:0; margin-top:25px; }\r\n");
      out.write("    h1 { font-size: 1.2em; margin: .6em 0; }\r\n");
      out.write("    div#users-contain { width: 350px; margin: 20px 0; }\r\n");
      out.write("    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }\r\n");
      out.write("    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }\r\n");
      out.write("    .ui-dialog .ui-state-error { padding: .3em; }\r\n");
      out.write("    .validateTips { border: 1px solid transparent; padding: 0.3em; }\r\n");
      out.write("  </style>\r\n");
      out.write("  \r\n");
      out.write("    <script>\r\n");
      out.write("  $(function () {\r\n");
      out.write("      \r\n");
      out.write("      var \r\n");
      out.write("      name = $( \"#txtAlici\" ).val(),\r\n");
      out.write("      email = $( \"#txtMesaj\" ).val(),\r\n");
      out.write("      ogr = $( \"#txtMesaj\" ).val(),\r\n");
      out.write("      allFields = $( [] ).add( name ).add( email ).add( ogr );\r\n");
      out.write("      \r\n");
      out.write("    $( \"#dialog-form\" ).dialog({\r\n");
      out.write("      autoOpen: false,\r\n");
      out.write("      height: 400,\r\n");
      out.write("      width: 350,\r\n");
      out.write("      modal: true,\r\n");
      out.write("      buttons: {\r\n");
      out.write("        \"Gönder\": function() {\r\n");
      out.write("        if($( \"#txtMesaj\" ).val().length<10){alert(\"Mesajınız en az 10 karakterden oluşmalıdır.\");}               \r\n");
      out.write("        else if($( \"#txtAlici\" ).val()!=\"0\"){\r\n");
      out.write("            $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: 'MesajKaydet.jsp',\r\n");
      out.write("            data: \"mesaj_Alan=\"+$( \"#txtAlici\" ).val()+\"&mesaj_Mesaj=\"+$( \"#txtMesaj\" ).val(),\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("                alert(sonuc);\r\n");
      out.write("                $( \"#dialog-form\" ).dialog( \"close\" );\r\n");
      out.write("                window.location.reload();\r\n");
      out.write("                                      }\r\n");
      out.write("            });    \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        else if($(\"#txtOgrenci\").val().length==8){\r\n");
      out.write("            $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: 'MesajKaydet.jsp',\r\n");
      out.write("            data: \"mesaj_Alan=\"+$( \"#txtOgrenci\" ).val()+\"&mesaj_Mesaj=\"+$( \"#txtMesaj\" ).val(),\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("                alert(sonuc);\r\n");
      out.write("                $( \"#dialog-form\" ).dialog( \"close\" );\r\n");
      out.write("                window.location.reload();\r\n");
      out.write("                                      }\r\n");
      out.write("            });    \r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("        },\r\n");
      out.write("        Kapat: function() {\r\n");
      out.write("          $( this ).dialog( \"close\" );\r\n");
      out.write("        }\r\n");
      out.write("      },\r\n");
      out.write("      close: function() {\r\n");
      out.write("        allFields.val( \"\" ).removeClass( \"ui-state-error\" );\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write(" \r\n");
      out.write("    $(\"#create-user\")\r\n");
      out.write("        .button()\r\n");
      out.write("        .click(function() {\r\n");
      out.write("        $(\"#dialog-form\" ).dialog( \"open\" );\r\n");
      out.write("        \r\n");
      out.write("      });\r\n");
      out.write("  });\r\n");
      out.write("  \r\n");
      out.write("  </script>\r\n");
      out.write("    \r\n");
      out.write("    <script>\r\n");
      out.write("            function mesaj_getir(id){\r\n");
      out.write("            \r\n");
      out.write("            $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: 'MesajGetir.jsp',\r\n");
      out.write("            data: \"mesaj_ID=\"+id,\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("                alert(sonuc);\r\n");
      out.write("                window.location.reload();\r\n");
      out.write("                                      }\r\n");
      out.write("            });    \r\n");
      out.write("            }    \r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    ");

  Personel personel=(Personel)session.getAttribute("personelInfo");
    
    if(personel!=null){
        response.sendRedirect("../index.jsp");
    }else{
      String isim=personel.getHoca_Ad().toString();
      String soyisim=personel.getHoca_Soyadi().toString();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"dialog-form\" title=\"Mesaj Gönder\">\r\n");
      out.write("  <p class=\"validateTips\">Firat Üniversitesi</p>\r\n");
      out.write(" \r\n");
      out.write("  <form>\r\n");
      out.write("  <fieldset>\r\n");
      out.write("      <label for=\"txtAlici\">Personel:</label>\r\n");
      out.write("      <select name=\"txtAlici\" id=\"txtAlici\">\r\n");
      out.write("          <option value=\"0\">Alıcı Seç</option>\r\n");
      out.write("          <option value=\"1\">Admin</option>\r\n");
      out.write("    ");

                baglan baglanti=new baglan();
                Connection con=baglanti.VeritabaninaBaglan();
                
                PreparedStatement Hoca = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`hoca`;");
                ResultSet resultHoca = Hoca.executeQuery();
                while(resultHoca.next()){
                out.println("<option value='"+resultHoca.getInt("Hoca_ID")+"'>"+resultHoca.getString("Hoca_Ad")+" "+resultHoca.getString("Hoca_Soyadi")+"</option>");
               }
    
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("    <label for=\"txtOgrenci\">Öğrenci</label>\r\n");
      out.write("    <input type=\"text\" name=\"txtOgrenci\" id=\"txtOgrenci\" value=\"\" size=\"19\" />\r\n");
      out.write("    <label for=\"mesaj\">Mesaj:</label>\r\n");
      out.write("    <textarea name=\"txtMesaj\" id=\"txtMesaj\" rows=\"6\" cols=\"60\"></textarea>\r\n");
      out.write("  </fieldset>\r\n");
      out.write("  </form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    <div id=\"templamteo_body_wrapper\">\r\n");
      out.write("        <div id=\"templatemo_wrapper\">\r\n");
      out.write("            <div id=\"templatemo_main_top\"></div>\r\n");
      out.write("               <div id=\"templatemo_main\">\r\n");
      out.write("                  <div id=\"templatemo_sidebar\">\r\n");
      out.write("                    <div class=\"sb_box\">\r\n");
      out.write("                        <div id=\"contact_form\">\r\n");
      out.write("                            <h4>Hoşgeldiniz Sayın:</h4>\r\n");
      out.write("                            <h5>");
 out.print(isim+" "+soyisim); 
      out.write("&nbsp;&nbsp;&nbsp;<a href=\"../logoutPersonel.jsp\">Çıkış<img src=\"../icons/png/32x32/unlock.png\" width=\"32\" height=\"32\" alt=\"Arama\"/></a></h5>\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>  \r\n");
      out.write("\r\n");
      out.write("                <div class=\"sb_box\">\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <tr><td><a href=\"personel.jsp\"><img src=\"../icons/png/48x48/back.png\" width=\"48\" height=\"48\" alt=\"Personel Sayfası\"/><b>Personel Sayfası</b></a></td></tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div> \r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            <div id=\"templatemo_content\">\r\n");
      out.write("                <center><button id=\"create-user\">Mesaj Gönder</button></center>\r\n");
      out.write("<table id='rounded-corner'>\r\n");
      out.write("\r\n");
      out.write("            ");
 

        String durum="";
        
 PreparedStatement pstmt =
         (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`mesaj` WHERE  mesaj_Alan=?;");
                pstmt.setString(1,personel.getHoca_ID());
                ResultSet result = pstmt.executeQuery();
                 
 PreparedStatement pstmt2 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`hoca` WHERE  Hoca_ID=?;");
       
  PreparedStatement pstmt3 = 
            (PreparedStatement)con.prepareStatement("SELECT * FROM `sinav`.`ogrenci` WHERE  Ogrenci_ID=?;");
  

            int i=0;
            while(result.next()){
                
                pstmt2.setInt(1, Integer.parseInt(result.getString("mesaj_Gonderen")));
                ResultSet result2 = pstmt2.executeQuery();
                durum=result.getString("mesaj_Durum");
                
                
                if(result2.next()){
                 i++;   
                if(durum.equals("1")){
                out.println("<tr><td><b style='color:green;'>"+result.getString("mesaj_Gonderen")+"-"+result2.getString("Hoca_Ad")+" "+result2.getString("Hoca_Soyadi")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");
                                     }
                else {
                out.println("<tr><td><b style='color:red;'>"+result.getString("mesaj_Gonderen")+"-"+result2.getString("Hoca_Ad")+" "+result2.getString("Hoca_Soyadi")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");

                }
                }
                
                pstmt3.setInt(1, Integer.parseInt(result.getString("mesaj_Gonderen")));
                ResultSet result3 = pstmt3.executeQuery();
                    
                
                if(result3.next()){
                 i++;   
                if(durum.equals("1")){
                out.println("<tr><td><b style='color:green;'>"+result.getString("mesaj_Gonderen")+"-"+result3.getString("Ogrenci_Ad")+" "+result3.getString("Ogrenci_Soyad")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");
                                     }
                else {
                out.println("<tr><td><b style='color:red;'>"+result.getString("mesaj_Gonderen")+"-"+result3.getString("Ogrenci_Ad")+" "+result3.getString("Ogrenci_Soyad")+"</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");

                }
                
                
                }
                

                if(result.getString("mesaj_Gonderen").trim().equals("1")){
                 i++;   
                if(durum.equals("1")){
                out.println("<tr><td><b style='color:green;'>ADMİN</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");
                                     }
                else {
                out.println("<tr><td><b style='color:red;'>ADMİN</b></td>"
                        +"<td><a href='javascript:mesaj_getir("+result.getInt("mesaj_ID")+");'><img src='../icons/png/32x32/mail.png'/></a></td>"       
                        +"<td><a href='mesajSil.jsp?mesaj_ID="+result.getInt("mesaj_ID")+""+"'><img src='../IMAGE/delete.png'/></a></td></tr>");

                }
                }
                
            }
            if(i==0){out.print("<tr><td>MESAJINIZ YOK</td></tr>");}
            
            
            
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"cleaner\"></div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div> \r\n");
      out.write("</div>\r\n");
      out.write("<script type='text/javascript' src='../js2/logging.js'></script>\r\n");

    }

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
