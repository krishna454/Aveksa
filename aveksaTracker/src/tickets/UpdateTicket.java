package tickets;




	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

	import database.MySQLConnection;
	import database.TestTableData;
import dropDowns.FormTypeArrayList;
import pojo.TestTablePojo;

	public class UpdateTicket {

//updating the data  on table

	public void updateTickets(int num,String userID, String Comments,String Ticket_Id, int no_of_Users,int no_of_Targets,int no_of_Events,   int Form_Type, int Ticket_Type,int Ticket_Category,String Department, int Location,String Company_Name,int AFX,String Assignee,int Ticket_Status) throws SQLException
		{
		
	
		String Form_type1=null,Ticket_type1=null,Ticket_Category1=null,Location1=null,Ticket_Status1=null,AFX1=null,userName=null;
		
		
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		 Statement st=conn.createStatement();
		 
		 ResultSet rs1=st.executeQuery("select userName from userdetails where userid='"+userID+"'");
		 
		 while(rs1.next())
		 {
			 userName=rs1.getString("userName");
		 }
		 
		 ResultSet rs=st.executeQuery("select Form_type,Ticket_type,AFX,Assignee,Ticket_Category,Location,Ticket_Status from testtable where testtable_id='"+num+"'");
		 
		 while(rs.next())
		 {
			 Form_type1=rs.getString("Form_type");
			 Ticket_type1=rs.getString("Ticket_type");
			 Ticket_Category1=rs.getString("Ticket_Category");
			 Location1=rs.getString("Location");
			 Ticket_Status1=rs.getString("Ticket_Status");
			 AFX1=rs.getString("AFX");
		
		
			 
			
		 }
		
		
		
		
		
		//Date
		 
		// new SimpleDateFormat("MM/dd/yyyy").format(new Date(timeStampMillisInLong));
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String Completed_Date= dtf.format(now);
		
		//System.out.println(Completed_Date);
	FormTypeArrayList formTypeArrayList=new FormTypeArrayList();
	
	//Form_type
	ArrayList selectedForm=formTypeArrayList.getFormTypeArrayList(Form_type1);
	String getForm_type=(String) selectedForm.get(Form_Type);
	//Ticket_type
	selectedForm=formTypeArrayList.getTicketType(Ticket_type1);
	String getTicket_type=(String) selectedForm.get(Ticket_Type);
	
	//Ticket_Category
		selectedForm=formTypeArrayList.getTicketCategory(Ticket_Category1);
		String getTicket_Category=(String) selectedForm.get(Ticket_Category);
	
		//Location
				selectedForm=formTypeArrayList.getLocation(Location1);
				String getLocation=(String) selectedForm.get(Location);
	
	   //TicketStatus
	   selectedForm=formTypeArrayList.getStatus(Ticket_Status1);
	   String getTicket_Status=(String) selectedForm.get(Ticket_Status);
	   
	 //AFX
	   selectedForm=formTypeArrayList.getAFX(AFX1);
	   String getAFX=(String) selectedForm.get(AFX);
	 
				String getAssignee=Assignee;
			
			//System.out.println("id in update class is "+num);
		//	TestTableData testTableData=new TestTableData();
	
		String query="update testtable set TicketsUpdatedBy='"+userName+"', Comments='"+Comments+"',Ticket_Id='"+Ticket_Id+"', Form_Type='"+getForm_type+"',No_of_Users='"+no_of_Users+"',No_of_Targets='"+no_of_Targets+"',Provisioning_Events='"+no_of_Events+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"'  where testtable_id='"+num+"'";	
				 if(getAFX.equalsIgnoreCase("yes"))
				 {
					getAssignee="Dileep";
					getTicket_Status="Completed";
			            	
			            	  st.executeUpdate("update testtable set TicketsUpdatedBy='"+userName+"',Comments='"+Comments+"', Completed_Date='"+Completed_Date+"', Ticket_Id='"+Ticket_Id+"', Form_Type='"+getForm_type+"',No_of_Users='"+no_of_Users+"',No_of_Targets='"+no_of_Targets+"',Provisioning_Events='"+no_of_Events+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"'  where testtable_id='"+num+"'");
			         
			           
				 }
			
				 else  if(getTicket_Status.equals("Completed"))
                         {
            	
            	  st.executeUpdate("update testtable set TicketsUpdatedBy='"+userName+"', Comments='"+Comments+"', Completed_Date='"+Completed_Date+"', Ticket_Id='"+Ticket_Id+"', Form_Type='"+getForm_type+"',No_of_Users='"+no_of_Users+"',No_of_Targets='"+no_of_Targets+"',Provisioning_Events='"+no_of_Events+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"'  where testtable_id='"+num+"'");
                          }
                  else {
                        st.executeUpdate(query);
                   //  System.out.println("automation null is executed");
            
                    }
					
				
				
		//   System.out.println("updated table");
			
			
			
			DBConnection=null;
			formTypeArrayList=null;
			
		}
	
	
	public void updateUnAssignedTickets(int num,String Assignee,String exctractedBy) throws SQLException
	{
		
	//String for getting values from database
		//String Assigned=null;
		
		//FormTypeArrayList formTypeArrayList=new FormTypeArrayList();  
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		 Statement st=conn.createStatement();
		 
		 String query="update testtable set  Assignee='"+Assignee+"',TicketsExtractedBy='"+exctractedBy+"'  where testtable_id='"+num+"'";	
		  st.executeUpdate(query);
		  
		 
	}
		
	
	public void updateAddTickets(int num,String ticket_Name,String userid) throws SQLException
	{
		
	//String for getting values from database
		//String Assigned=null;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String Queue_Request_Date= dtf.format(now);
		String userName=null;
	//	FormTypeArrayList formTypeArrayList=new FormTypeArrayList();  
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		 Statement st=conn.createStatement();
      ResultSet rs1=st.executeQuery("select userName from userdetails where userid='"+userid+"'");
		 
		 while(rs1.next())
		 {
			 userName=rs1.getString("userName");
		 }
		 
		 
		 String query="insert into testtable ("+"testtable_id,"+"Ticket_Id,"+"Name,"+"Request_Date,"+"Queued_Date,"+"AFX,"+"Assignee,"+"Ticket_Type,"+"TicketsExtractedBy,"+"Ticket_Status)" + " VALUES(?,?,?,?,?,?,?,?,?,?) ";
		// String query="update testtable set  Assignee='"+Assignee+"',TicketsExtractedBy='"+exctractedBy+"'  where testtable_id='"+num+"'";	
		//  st.executeUpdate(query);
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 
		 pstmt.setInt(1,num);
		 pstmt.setString(2, ticket_Name);
		 pstmt.setString(3, ticket_Name);
		 pstmt.setString(4, Queue_Request_Date);
		 pstmt.setString(5, Queue_Request_Date);
		 pstmt.setString(6, "No");
		 pstmt.setString(7, userName);
		 pstmt.setString(8, "Snow");
		 pstmt.setString(9,userName);
		 pstmt.setString(10,"Assigned");
		 pstmt.executeUpdate();
		pstmt.close();
		rs1.close();
		st.close();
		conn.close();
		DBConnection=null;
		System.gc();
	}
		

}
