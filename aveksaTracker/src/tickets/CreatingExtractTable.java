package tickets;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import database.MySQLConnection;

public class CreatingExtractTable {
public void createTableDynamically() throws SQLException 
{
		
		
		
		String sql_stmt = "DROP TABLE IF EXISTS aveksaticketextract ";
		
		//System.out.println(sql_stmt);
        
		 MySQLConnection db=new MySQLConnection();
	        
	        Connection connection=db.getCon();
	      //  System.out.println(connection);
			Statement statement = connection.createStatement();
          //   System.out.println(statement);
	        statement.executeUpdate(sql_stmt);
	      //  System.out.println("aveksaticketextract table has successfully droped");
	        
	/*     String sql_stmt1 = "CREATE TABLE IF NOT EXISTS  aveksa.'student'(\n"
        		+ " 'Name'  VARCHAR(45)  NOT NULL ,\n"
        		+" 'date' VARCHAR(45)  NOT NULL ,\n"
        		+ " 'requested' VARCHAR(45)  NOT NULL ,\n"        		    		
        		+");";
        */
	        String sql_stmt1="CREATE TABLE IF NOT EXISTS aveksaticketextract " +
	                   "(Name VARCHAR(255), " + 
	                   " Requested_on VARCHAR(255), " + 
	                   " PRIMARY KEY ( Name ))";
       // System.out.println(sql_stmt1);
        statement.executeUpdate(sql_stmt1);
        
       connection.close();
       statement.close();
       db=null;
  System.gc();
       // System.out.println("student has successfully been created");
                
    }
		
}
