<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 
     <%@ page import ="database.MySQLConnection" %>
             <%@ page import ="java.sql.Connection" %>
            <%@ page import ="java.sql.Statement" %>
            <%@ page import ="java.sql.ResultSet" %>
         

 <html>  
 <head>  
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
 <title>Selecting Employees</title>  
 </head>  
 <body style="background-color:#daddd7;">  
 
 <form action="assignTicketsAuto.jsp" method="post" color="blue">
 <h3>Please select Today working Employees from the below list </h3>
 <table>
<%
try {
	String userid=session.getAttribute("userId").toString();
MySQLConnection MySQLConnection=new MySQLConnection();

Connection con=MySQLConnection.getCon();

Statement st = (Statement) con.createStatement();
// System.out.println("creating statement");
ResultSet rs =  st.executeQuery("select userName from userdetails");
while(rs.next()){
	%>
	
	<input type="checkbox" name="assignee" value="<%=rs.getString("userName") %>"><%=rs.getString("userName") %></input><br>
	<%
	
}
rs.close();
st.close();
con.close();
MySQLConnection=null;
}catch(Exception e)
{
	
e.printStackTrace();
response.sendRedirect("Login.jsp");
}


%>
<input type="submit" value="Assign tickets"/></table>
</form>

 </body>  
 </html>  