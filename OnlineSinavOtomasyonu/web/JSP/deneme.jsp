<%-- 
    Document   : deneme
    Created on : 11.Oca.2014, 16:53:22
    Author     : Lenowo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
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
      ad,id,
      name = $( "#txtAlici" ),
      email = $( "#txtMesaj" ),
      allFields = $( [] ).add( name ).add( email );
      
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Gönder": function() {
                /////////////////////// İşlem Yap
        },
        Kapat: function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $( "#create-user" )
      .button()
      .click(function() {
        ad=$("#txtAd").val();
        id=$("#txtId").val();
        $("#txtAlici").val(ad);
        $("#dialog-form" ).dialog( "open" );
      });
  });
  </script>
</head>
<body>
   
<div id="dialog-form" title="Mesaj Gönder">
  <p class="validateTips">Firat Üniversitesi</p>
 
  <form>
  <fieldset>
    <label for="alici">Alıcı:</label>
    <input type="text" name="txtAlici" id="txtAlici" value="dawd" class="text ui-widget-content ui-corner-all" disabled="disabled" />
    <label for="mesaj">Mesaj:</label>
    <textarea name="txtMesaj" id="txtMesaj" rows="6" cols="60"></textarea>
  </fieldset>
  </form>
</div>

<table>
    <tr>
        <td><input type="text" name="txtId" id="txtId"  /></td>
        <td><input type="text" name="txtAd" id="txtAd"  /></td>
        <td><button id="create-user">Gönder</button></td>
    </tr>
</table>

    
</body>
</html>
