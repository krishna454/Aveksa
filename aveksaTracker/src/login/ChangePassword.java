package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MySQLConnection;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
try {
		String userID=request.getParameter("user_Id");
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		String dbPassword=null;
		System.out.println(userID);
		
		
MySQLConnection MySQLConnection=new MySQLConnection();
		
		Connection con=MySQLConnection.getCon();
		
	
	
			Statement st = (Statement) con.createStatement();
			
			
			
			ResultSet rs =  st.executeQuery("select password from userdetails where userid='"+userID+"'");
			   while(rs.next()){
			       
			       
			        dbPassword = rs.getString("password");
			   }
			   
			   if(dbPassword.equals(oldPassword))
			   {
				   st.executeUpdate("update userdetails set password='"+newPassword+"' where userid='"+userID+"'");
				  
				   response.sendRedirect("success.jsp");
			   }
			   else
			   {
				   response.sendRedirect("ErrorPage.jsp");
			   }
	       
			
	    
	    
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
		
	
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
