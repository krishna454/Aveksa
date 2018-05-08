package tickets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MySQLConnection;
import pojo.TestTablePojo;

/**
 * Servlet implementation class AveksaTickets
 */

@WebServlet("/AveksaTickets")

public class AveksaTickets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init() throws ServletException 
	{
		System.out.println("AveksaTickets servlet is loaded 3");
		
		
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AveksaTickets() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println("Aveksa tickets servlet has been loaded");
		
		ArrayList<TestTablePojo> TestTablelist=new ArrayList<TestTablePojo>();
		
		
		MySQLConnection MySQLConnection=new MySQLConnection();
				
				Connection con=MySQLConnection.getCon();
				try {
			
				
			    Statement st = (Statement) con.createStatement();
		       // System.out.println("creating statement for TestTable");
		        ResultSet rs =  st.executeQuery("select * from testtable");
		        while(rs.next()){
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
		        	TestTablelist.add(TestTablePojo);
		        	
		        	        }
		        st.close();
		        rs.close();
		        con.close();
		    
		        }
		        catch(Exception e) {
		        	
		        System.out.println(e);
		        	
		        }
			
		        request.setAttribute("TestTableArrayList", TestTablelist);
				 //looping arraylist
		       // java.util.Iterator<TestTablePojo> itr=TestTablelist.iterator();
				//while(itr.hasNext())
				//{
				//	System.out.println(itr.next());
				//}
			

        RequestDispatcher view=request.getRequestDispatcher("allAveksaTickets.jsp");
        view.forward(request,response);
        }
		
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
