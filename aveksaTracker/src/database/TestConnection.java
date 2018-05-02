package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



public class TestConnection {
    public static void main(String[] args) {
         try {
               Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loaded driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Aveksa?user=root&password=root");
                System.out.println("Connected to MySQL");
                
               Statement st = (Statement) con.createStatement();
                System.out.println("creating statement");
                ResultSet rs =  st.executeQuery("select * from userdetails");
                
               while(rs.next())
               {
            	   System.out.println(rs.getString("userName"));
               }

                System.out.println("Connected to MySQ2L");
               
               st.close();
               rs.close();
                con.close();
                
         } 
         catch (Exception ex) {
                ex.printStackTrace();
         }
    }
}