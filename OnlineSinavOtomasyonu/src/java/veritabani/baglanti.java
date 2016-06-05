package veritabani;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class baglanti {

    private Connection baglanti = null;
    private String host = "localhost";
    private String port = "3306";
    private String kuladi = "root";
    private String sifre = "";
    private String veritabani = "sinav";
    private PreparedStatement cmd = null;
    private ResultSet sonuc = null;

    public baglanti() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            baglanti = (Connection) DriverManager.getConnection("jdbc:mysql://"
                    + host +":"+port+ "/" + veritabani
                    + "?useUnicode=true&characterEncoding=utf8", kuladi, sifre);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(baglanti.class.getName()).log(Level.SEVERE, null,
                    ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(baglanti.class.getName()).log(Level.SEVERE, null,
                    ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(baglanti.class.getName()).log(Level.SEVERE, null,
                    ex);
        } catch (SQLException ex) {
            Logger.getLogger(baglanti.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    public PreparedStatement sorgu(String sorgucumle) {
        try {
            cmd = baglanti.prepareStatement(sorgucumle);
        } catch (SQLException ex) {
            return cmd;
        }
        return cmd;
    }

   /*  public int update(String sorgucumle) {
        int sonuc1 = 0;
        try {
            cmd = baglanti.createStatement();
            sonuc1 = cmd.executeUpdate(sorgucumle);

        } catch (SQLException ex) {
            return sonuc1;
        }
        return sonuc1;
    }*/

    /*public int getCount(String sorgucumle) {
        int sonuc1 = 0;
        try {
            cmd = baglanti.createStatement();
            ResultSet sonuc = cmd.executeQuery(sorgucumle);
            while (sonuc.next()) {
                sonuc1++;
            }
        } catch (SQLException ex) {
            return sonuc1;
        }
        return sonuc1;
    }*/

    /*public int last(String table, String column) {
        int id = 0;
        try {
            cmd = baglanti.createStatement();
            ResultSet rs = cmd.executeQuery("select * from " + table);
            if (rs.last()) {
                id = rs.getInt(column);
            }
        } catch (SQLException ex) {
            return id;
        }
        return id;
    }*/
    
}
