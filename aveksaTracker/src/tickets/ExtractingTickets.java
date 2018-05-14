package tickets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import database.MySQLConnection;
import excel.ExcelCellArrayListHolders;

public class ExtractingTickets {
	
	 //Read an Excel File and Store in a ArrayList
	public void inserDataFromExceltotable() throws SQLException 
	{
		ExcelCellArrayListHolders excelCellArrayListHolders=new ExcelCellArrayListHolders();
		 ArrayList dataHolder=excelCellArrayListHolders.readExcelFile(); 
		 //Print the data read  
		 //printCellDataToConsole(dataHolder);  
		 
		 MySQLConnection connection=new MySQLConnection();
		 CreatingExtractTable createTable=new CreatingExtractTable();
		 createTable.createTableDynamically();
		Connection con=connection.getCon();
		 
		 String query="insert into aveksaticketextract values(?,?)";  
		 
		 PreparedStatement ps=con.prepareStatement(query);  
		 
		 try {
		 int count=0;  
		 ArrayList cellStoreArrayList=null;  
		 //For inserting into database  
		 for (int i=1;i < dataHolder.size(); i++) {  
			 
			 
		   cellStoreArrayList=(ArrayList)dataHolder.get(i);  
		   
		     ps.setString(1,(cellStoreArrayList.get(0)).toString());  
		     ps.setString(2,(cellStoreArrayList.get(1)).toString());  
		    
		    count= ps.executeUpdate();  
		    // System.out.print(((HSSFCell)cellStoreArrayList.get(2)).toString() + "t");  
		     }  
		 }
		 catch(Exception e)
		 {
			// System.out.println("got error because "+e);
		 }
		 
		 con.close();
		 ps.close();
		 createTable=null;
		 excelCellArrayListHolders=null;
	}
	
	
	
	//compare data from two table and store in the main dump
	//public static void main(String args[]) throws SQLException{
	public void extractTicket() throws SQLException  {
		// TODO Auto-generated method stub
		
	
				
		
		//differenciation of data from two tables
		
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println("current date= "+dtf.format(now));
		 //2016/11/16 12:08:43
//st.executeUpdate("update testtable set testtable_id='"+testtable_id+"', Ticket_Id='"+name+"',Name='"+name+"',Ticket_Status='"+state+"',Request_Date='"+rdate+"',+"Queued_Date='"+queDate+"'");
        
	String extract="select * from aveksaticketextract where name not in(select name from  testtable)";
	
	//String updateDataIntoTable="insert into testtable("+"testtable_id,"+"Ticket_Id,"+"Name,"+"Ticket_Status,"+"Request_Date,"+"Queued_Date,)" + "VALUES(?,?,?,?,?,?)";	
	String updateDataIntoTable="insert into testtable("+"testtable_id,"+"Ticket_Id,"+"Name,"+"Ticket_Status,"+"Request_Date,"+"Queued_Date,"+"AFX,"+"Assignee,"+"Ticket_Type)" + "VALUES(?,?,?,?,?,?,?,?,?)";	
			
			String state="UnAssigned";
			String AFX="No";
			String Assignee="NotAssigned";
			String queDate=dtf.format(now);
			
			
			//past the data into the got datas
		//	String addData="INSERT INTO testtable("+"Name," +  "Request_Date,)"+ "VALUES(?,?)";
			//System.out.println(extract);
	        
			 MySQLConnection db=new MySQLConnection();
		        
		        Connection connection=db.getCon();
		        Connection con=db.getCon();
		       //System.out.println(connection);
		        
		        Statement st = (Statement) connection.createStatement();
		      
		        ResultSet rs2 =  st.executeQuery("select * from testtable");
		       // System.out.println("executed required "+rs2);
		        int testtable_id=0;
		        while(rs2.next())
		        {
		        	testtable_id=rs2.getInt(1);
		        }
		        
		        
		       // System.out.println("last number"+testtable_id);
		       
		     //  Statement statement = con.createStatement(
		     //           ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		     //   System.out.println(statement+" chance");
			//Statement statement2 = connection.createStatement();
			 
		      PreparedStatement pstmt = connection.prepareStatement(updateDataIntoTable);
	            System.out.println(pstmt);
	             
	             ResultSet rs = st.executeQuery(extract);
	             
	           
	           
	           //  System.out.println("resultset");
	             while (rs.next()) {
	            	 testtable_id=testtable_id+1; 
	               String name = rs.getString(1);
	              String rdate = rs.getString(2);
	              
	              pstmt.setInt(1,testtable_id);     
	              if(name.contains("-"))
	              {
	              String [] arrOfStr = name.split("-", 2);
	       
	              for (String a : arrOfStr)
	                  //System.out.println(a);
	              
	              //System.out.println(name+" "+rdate);
	               
	               pstmt.setString(2, arrOfStr[1]);
	              arrOfStr=null;
	              }
	               else 
	               {
	 	               pstmt.setString(2, name);
	 	             
	               }
	              pstmt.setString(3, name);
	               pstmt.setString(4, state);
	               pstmt.setString(5, rdate);
	               pstmt.setString(6, queDate);
	               pstmt.setString(7, AFX);
	               pstmt.setString(8, Assignee);
	               
	               if(name.contains("INC")|| name.contains("TASK"))
	               {
	            	   pstmt.setString(9, "Snow"); 
	               }
	               else {
	            	   pstmt.setString(9, "Aveksa");
	               }
	               pstmt.executeUpdate();
	              // System.out.println("tickets updated successfully ");
	             
	              
	             }
	             rs.close();
	             rs2.close();
	             st.close();
	             pstmt.close();
	           
	            connection.close();
	            db=null;
	            System.gc();
	             
	           }
	         
 
}

