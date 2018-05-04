package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.MySQLConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName=request.getParameter("userName");
		System.out.println(userName);
		String password=request.getParameter("password");
		System.out.println(password);
		String dbUsername, dbPassword;
		boolean login = false;
		HttpSession session = request.getSession(true); 
		//System.out.println("seesion request");
		MySQLConnection MySQLConnection=new MySQLConnection();
		
		Connection con=MySQLConnection.getCon();
		try {
	
		
	    Statement st = (Statement) con.createStatement();
       // System.out.println("creating statement");
        ResultSet rs =  st.executeQuery("select * from userdetails");
        while(rs.next()){
        dbUsername = rs.getString("userid");
       
        dbPassword = rs.getString("password");
    

        if(dbUsername.equals(userName))
        {
        	if(dbPassword.equals(password))
        	{
            System.out.println("OK");
            login = true;
            
            session.setAttribute("userName",rs.getString("userName"));
            response.sendRedirect("Homepage.jsp");
            
        	}
        	else {
            	session.setAttribute("errorMessage","Invalid Credentials");
            	 response.sendRedirect("ErrorPage.jsp");
            }
        }
        
      //  System.out.println(userName + password + " " + dbUsername + dbPassword);
        }
        
		}
		catch (Exception ex) {
		    ex.printStackTrace();
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
