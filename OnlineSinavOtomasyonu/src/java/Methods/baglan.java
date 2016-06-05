package Methods;

import java.sql.Connection;
import java.sql.*;

public class baglan {
    
    public static Connection VeritabaninaBaglan(){
    
    String url="jdbc:mysql://localhost:3306/sinav?useUnicode=yes&characterEncoding=UTF-8";
    //String VeritabaniAdi ="sinav";
    String surucu="com.mysql.jdbc.Driver";
    String KullaniciAdi="root";
    String Sifre="";
    
    try {
        Class.forName(surucu);
        Connection con =DriverManager.getConnection(url, KullaniciAdi, Sifre);
        return con;
    } catch (Exception e) {
        return null;
    }
    
    


}
}
