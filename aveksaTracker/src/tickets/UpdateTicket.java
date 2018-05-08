package tickets;




	import java.sql.Connection;
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



	synchronized public void updateTickets(int num,int Form_Type, int Ticket_Type,int Ticket_Category,String Department, int Location,String Company_Name,int AFX,int Assignee,int Ticket_Status) throws SQLException
		{
		
	
		String Form_type1=null,Ticket_type1=null,Ticket_Category1=null,Location1=null,Ticket_Status1=null,AFX1=null,Assigned=null;
		
		
		
		MySQLConnection DBConnection=new MySQLConnection();
		Connection conn = DBConnection.getCon();
		 Statement st=conn.createStatement();
		 
		 
		 ResultSet rs=st.executeQuery("select Form_type,Ticket_type,AFX,Assignee,Ticket_Category,Location,Ticket_Status from testtable where testtable_id='"+num+"'");
		 
		 while(rs.next())
		 {
			 Form_type1=rs.getString("Form_type");
			 Ticket_type1=rs.getString("Ticket_type");
			 Ticket_Category1=rs.getString("Ticket_Category");
			 Location1=rs.getString("Location");
			 Ticket_Status1=rs.getString("Ticket_Status");
			 AFX1=rs.getString("AFX");
			 Assigned=rs.getNString("Assignee");
			
			
		 }
		
		
		
		
		
		//Date
		 
		// new SimpleDateFormat("MM/dd/yyyy").format(new Date(timeStampMillisInLong));
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String Completed_Date= dtf.format(now);
		
		System.out.println(Completed_Date);
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
	   //AFX
	   selectedForm=formTypeArrayList.getAssignee(Assigned);
	   String getAssignee=(String) selectedForm.get(Assignee);	
				
			
			//System.out.println("id in update class is "+num);
		//	TestTableData testTableData=new TestTableData();
				
				
				 if(getAFX.equalsIgnoreCase("yes"))
				 {
					getAssignee="Dileep";
					getTicket_Status="Completed";
			            	
			            	  st.executeUpdate("update testtable set Form_Type='"+getForm_type+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"',Completed_Date='"+Completed_Date+"'  where testtable_id='"+num+"'");
			         
			           
				 }
			
				 else {
					 
				
            
            if(getTicket_Status.equals("Completed"))
            {
            	
            	  st.executeUpdate("update testtable set Form_Type='"+getForm_type+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"',Completed_Date='"+Completed_Date+"'  where testtable_id='"+num+"'");
            }
            else {
            st.executeUpdate("update testtable set Form_Type='"+getForm_type+"',Ticket_Type='"+getTicket_type+"',Ticket_Category='"+getTicket_Category+"',Department='"+Department+"',Location='"+getLocation+"',Company_Name='"+Company_Name+"',AFX='"+getAFX+"',Assignee='"+getAssignee+"',Ticket_Status='"+getTicket_Status+"'  where testtable_id='"+num+"'");
         //  System.out.println("automation null is executed");
            
            }
				 }	
				
				
		//   System.out.println("updated table");
			
			
			
			DBConnection=null;
			formTypeArrayList=null;
			
		}
		

}
