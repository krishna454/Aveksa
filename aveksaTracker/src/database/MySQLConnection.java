package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnection {
	
	public Connection getCon()
	{
		Connection con=null;
try {
	
    Class.forName("com.mysql.jdbc.Driver");
    //System.out.println("Loaded driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Aveksa?useSSL=false&user=root&password=root");
   // System.out.println("Connected to MySQL");
	
			}
catch (Exception ex) {
    ex.printStackTrace();
}
return con;
	}

}
