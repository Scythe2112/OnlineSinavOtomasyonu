<%-- 
    Document   : AltBolumSoruGor
    Created on : 03.Eki.2013, 00:37:20
    Author     : Nuri
--%>
<%@page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Methods.baglan"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.Personel"%>

<%
    Personel personel=(Personel)session.getAttribute("personelInfo");
    if(personel==null){
    response.sendRedirect("../index.jsp");
    }else{
        
    String AltBolum_ID=(String)session.getAttribute("AltBolum");
    if(AltBolum_ID==null){
    
    }else{
    
    String  AltBolum_Ad=null;
    String  dizi[]=null;
    int     soruSayisi=0;
    int     index;
    if((Integer)(session.getAttribute("index"))==0){
            index=0;
    }else{
            index=(Integer)session.getAttribute("index");
    }
    
    
    baglan baglanti = new baglan();
    Connection con = baglanti.VeritabaninaBaglan();
    
    PreparedStatement pstmt10 = (PreparedStatement) con.prepareStatement("SELECT  * FROM `sinav`.`altbolum` WHERE AltBolum_ID=?;");
    PreparedStatement pstmt11 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
    PreparedStatement pstmt12 = (PreparedStatement) con.prepareStatement("SELECT COUNT(*) FROM `sinav`.`soruozellik` WHERE AltBolum_ID=?;");
   
       
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

    
    <ul>
        <li><a href="#tabs-1"><img src="../IMAGE/guncelle.png"/>SORU DETAY</a></li>
        <li><a href="#tabs-2"><img src="../IMAGE/soruEkle.png"/>SORU EKLE</a></li>
        <li>Alt Bölüm: <%=AltBolum_Ad%><br>Toplam Soru Sayısı:<%=soruSayisi%></li>
    </ul>
    
    <div id="tabs-1"  style="width: 800px;max-height:500px;overflow-y: scroll; ">
        
        <% 
        if(soruSayisi!=0){
        %>
         
        <form name="yon" style="float: left;">
        <table>
               <tr>
                  <td><button type="button" id="butonAzalt" onClick="herhangi(0);" > <img  width="32" height="18" src="../IMAGE/sol.png"/></button></td>
                  <td><button type="button" id="butonArttir" onClick="herhangi(1);" ><img  width="32" height="18" src="../IMAGE/sag.png"/> </button></td>
               </tr>
    
         </table></form> 
                 
                 
        <form name="kontrol" style="float: left;">
                   <table style="width:520px; height: 32px;">
                       
                   <tr>
                   <td><button id="butonSil">SORUYU SİL</button></td>
                   <td><button id="butonGuncelle" onClick="guncelle();" type="button" >SORU GÜNCELLE</button></td>
                   <td><button type="button" id="butonEkle">SORUYA ŞIK EKLE</button></td>
                   <td><input type="text" name="txtSayac" value="" /><button type="button" id="butonGit">SORUYA GİT</button></td>
                   </tr>
               
                   </table>
        </form>   
    
                 
                 
    <form name="icerik">
   <table id="duzenleTable" name="duzenleTable" style="width:750px;height:400px;">
                           <%   
                 
        PreparedStatement pstmt13 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soru` WHERE Ozellik_ID=?;");
        PreparedStatement pstmt14 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`cevap` WHERE Ozellik_ID=?;");
        PreparedStatement pstmt15 = (PreparedStatement) con.prepareStatement("SELECT * FROM `sinav`.`soruozellik` WHERE Ozellik_ID=?;");   
             
               
                int  girdisayisi=0;
                int gelen=0;
                pstmt13.setString(1,dizi[index%soruSayisi]);
                ResultSet result13=pstmt13.executeQuery();
                
                while(result13.next()){
                     pstmt15.setString(1,dizi[index%soruSayisi]);
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
                pstmt14.setString(1,dizi[index%soruSayisi]);
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
                 
                 out.println("Bu AltBölüme Ait Soru Mevcut Değildir.<br> Lütfen Soru Ekleyin..");
                 }
                %>                   
                         
                     </table>
                   
                   </form>
                   
                
    </div>

                
        <div id="tabs-2" style="width: 800px;max-height:500px;overflow-y: scroll; " >
        <form name="ekleme">
        
        <table id="soruTable" name="soruTable" style="width:750px;height:400px;">
        <tr>
            <td colspan="2"><textarea name="txtSoru" rows="4" cols="59"></textarea></td>
               <td><select name="boxSoru">
            <option value="1">ÇOK KOLAY</option>
            <option value="3">ORTA</option>
            <option value="2">KOLAY</option>
            <option value="4">ZOR</option>
            <option value="5">ÇOK ZOR</option>
        </select><input type="file" name="selectSoru" value="" width="5" /></td> 
            
        </tr>
        
        <tr>
            <td><input type="text" name="txt1" value="" size="60" /></td>
            <td>
                <select name="box1" id="box1">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                </select>
            </td>
            <td><input type="file" name="select1" value="" width="5" /></td>
        </tr>
    
        
        
        <tr>
            <td><input type="text" name="txt2" value="" size="60" /></td>
            <td>
                <select name="box2" id="box2">
           <option value="0">YANLIŞ</option>
           <option value="1">DOĞRU</option>
            
                </select>
            </td>
            <td><input type="file" name="select2" value="" width="5" /></td>
        </tr>
        
        
         <tr>
            <td><input type="text" name="txt3" value="" size="60" /></td>
            <td>
                <select name="box3" id="box3">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                 </select>
            </td>
            <td><input type="file" name="select3" value="" width="5" /></td>
        </tr>
        
        
        
        <tr>
            <td><input type="text" name="txt4" value="" size="60" /></td>
            <td>
                <select name="box4" id="box4">
            <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
                </select>
            </td>
            <td><input type="file" name="select4" value="" width="5" /></td>
        </tr>
                <tr>
            <td><input type="text" name="txt5" value="" size="60" /></td>
            <td><select name="box5" id="box5">
                    <option value="0">YANLIŞ</option>
            <option value="1">DOĞRU</option>
            
        </select></td>
            <td><input type="file" name="select5" value="" width="5" /></td>
        </tr>
    </table>
        
        <table>
            <tr>
                <td><input type="button" value="Soruyu Kaydet" id="kaydet"/></td>
            <td></td>
            <td><input type="button" value="Şık Ekle" id="ekle" /></td>
            
        </tr>
        </table>
            </form>
  </div>
 <%
    }

    }
    
        %>