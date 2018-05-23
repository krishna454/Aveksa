package tickets;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.MySQLConnection;
import database.TestTableData;
import pojo.TestTablePojo;

public class EditingTickets {

	public ArrayList editTicket(int id) throws SQLException
	{
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		TestTableData testTableData=new TestTableData();
		ArrayList<TestTablePojo> TestTablelist = new ArrayList();
		//System.out.println("id is "+id);
		String query = "select * from testtable where testtable_id='"+id+"'";
		//System.out.println(query);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		TestTablePojo TestTablePojo=new TestTablePojo();
		while(rs.next()){
			
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
        	
			
		}
		TestTablelist.add(TestTablePojo);
		st.close();
		rs.close();
		conn.close();
		DBConnection=null;
		System.gc();
		return TestTablelist;
		
	}
	
	public ArrayList searchTicket(String ticket) throws SQLException
	{
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		TestTableData testTableData=new TestTableData();
		ArrayList<TestTablePojo> TestTablelist = new ArrayList();
		//System.out.println("id is "+id);
		String query = "select * from testtable where Ticket_Id = '"+ticket+"'";
		//System.out.println(query);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		TestTablePojo TestTablePojo=new TestTablePojo();
		while(rs.next()){
			
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
        	
			
		}
		TestTablelist.add(TestTablePojo);
		st.close();
		rs.close();
		conn.close();
		DBConnection=null;
		System.gc();
		return TestTablelist;
		
	}
	
}
