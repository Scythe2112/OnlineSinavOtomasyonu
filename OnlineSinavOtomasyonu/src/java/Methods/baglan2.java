package Methods;

import java.sql.Connection;
import java.sql.*;

public class baglan2 {
    
    public static Connection VeritabaninaBaglan(){
    
    String url="jdbc:mysql://localhost:3306/";
    String VeritabaniAdi ="sinav";
    String surucu="com.mysql.jdbc.Driver";
    String KullaniciAdi="root";
    String Sifre="";
    //Sne61xt!40
    try {
        Class.forName(surucu);
        Connection con =DriverManager.getConnection(url+VeritabaniAdi,KullaniciAdi, Sifre);
         return con;
    } catch (Exception e) {
        return null;
    }
    
    


}
}
