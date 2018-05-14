package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MySQLConnection;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userID=request.getParameter("user_Id");
		String userName=request.getParameter("user_Name");
		String password=request.getParameter("password");
		String admin=request.getParameter("admin");
		
		//System.out.println(admin);
	MySQLConnection MySQLConnection=new MySQLConnection();
		
		Connection con=MySQLConnection.getCon();
		try {
	
	
	    Statement st = (Statement) con.createStatement();
		st.executeUpdate("insert into userdetails(userid,userName,password,Admin) VALUES ('"+userID+"','"+userName+"','"+password+"','"+admin+"')");
		
		con.close();
		MySQLConnection=null;
		
		//System.out.println("user Added successfully");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
		
		 response.sendRedirect("addedUser.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
