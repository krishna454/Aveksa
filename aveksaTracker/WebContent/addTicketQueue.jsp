<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="database.MySQLConnection" %>
<%@ page import ="java.util.ArrayList" %>
          <%@ page import ="tickets.EditingTickets" %>
            <%@ page import="pojo.TestTablePojo" %>
            
 <body style="background-color:#daddd7;">   
    
    
            <% try {
            	String userid=session.getAttribute("userId").toString(); %>
            	
            	
            	
            	<center>
<form method="post" action="updateAddTicketQueue.jsp">
<table border="1">
 <tr>
     
 <th>S.No</th>
   
    <th>Name</th>
     <th></th>
  </tr> 
<%
MySQLConnection MySQLConnection=new MySQLConnection();

Connection con=MySQLConnection.getCon();

Statement st = (Statement) con.createStatement();
// System.out.println("creating statement");


//out.println(no);
int sumcount=0;

/*	
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");*/

ResultSet rs2 =  st.executeQuery("select * from testtable");
// System.out.println("executed required "+rs2);
 
while(rs2.next())
{
	sumcount=rs2.getInt(1);
}
int testtable_id=sumcount+1;
		        //int testtable_id = rs2.getRow();
		       // rs2.beforeFirst();

//testtable_id+1;
//System.out.println("value is "+testtable_id);
%>
<tr>

 <td><input type="hidden" name="Testtable_id" value="<%=testtable_id%>">
<%=testtable_id%>
</td>


<td><input type="text" name="ticket_Name" required/></td>
 <td><input type="submit" name="Submit" value="Save" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>

</tr>
<%

}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("Homepage.jsp");
	
}
%>
</table>
</form></center></body>