package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.TestTablePojo;

public class TestTableData {

	
	public ArrayList<TestTablePojo> getTestTableData() {
	
	ArrayList<TestTablePojo> TestTablelist=new ArrayList<TestTablePojo>();
	
	
	MySQLConnection mySQLConnection=new MySQLConnection();
			
		//	int i=0;
			try {
		
				Connection con=mySQLConnection.getCon();
		    Statement st = (Statement) con.createStatement();
	       // System.out.println("creating statement for TestTable");
	        ResultSet rs =  st.executeQuery("select * from testtable");
	        while(rs.next()){
	        	//i++;
	        	TestTablePojo TestTablePojo=new TestTablePojo();
	        	TestTablePojo.setTesttable_id(rs.getInt("testtable_id"));
	        	TestTablePojo.setTicket_Id(rs.getString("Ticket_Id"));
	        	TestTablePojo.setName(rs.getString("Name"));
	        	TestTablePojo.setForm_Type(rs.getString("Form_Type"));
	        	TestTablePojo.setRequest_Date(rs.getString("Request_Date"));
	        	TestTablePojo.setQueued_Date(rs.getString("Queued_Date"));
	        	TestTablePojo.setNo_of_Users(rs.getInt("No_of_Users"));
	        	TestTablePojo.setNo_of_Targets(rs.getInt("No_of_Targets"));
	        	TestTablePojo.setProvisioning_Events(rs.getInt("Provisioning_Events"));
	        	TestTablePojo.setTicket_Type(rs.getString("Ticket_Type"));
	        	TestTablePojo.setTicket_Category(rs.getString("Ticket_Category"));
	        	TestTablePojo.setDepartment(rs.getString("Department"));
	        	TestTablePojo.setLocation(rs.getString("Location"));
	        	TestTablePojo.setCompany_Name(rs.getString("Company_Name"));
	        	TestTablePojo.setAFX(rs.getString("AFX"));
	        	TestTablePojo.setAssignee(rs.getString("Assignee"));
	        	TestTablePojo.setCompleted_Date(rs.getString("Completed_Date"));
	        	TestTablePojo.setTicket_Status(rs.getString("Ticket_Status"));
	        	TestTablePojo.setComments(rs.getString("Comments"));
	        	TestTablePojo.setTicketsUpdatedBy(rs.getString("TicketsUpdatedBy"));
	        	TestTablePojo.setTicketsExtractedBy(rs.getString("TicketsExtractedBy"));
	        	TestTablelist.add(TestTablePojo);
	        	
	        	        }
	        
	        con.close();
	       // System.out.println("count of the records we are getting is "+i);
	        }
	        catch(Exception e) {
	        	
	        System.out.println(e);
	        	
	        }
		
	        
			 //looping arraylist
	       // java.util.Iterator<TestTablePojo> itr=TestTablelist.iterator();
			//while(itr.hasNext())
			//{
			//	System.out.println(itr.next());
			//}
			mySQLConnection=null;
		return TestTablelist;
		
}}
