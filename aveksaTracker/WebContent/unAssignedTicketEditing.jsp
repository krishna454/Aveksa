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
<form method="post" action="updateUnAssingedTicket.jsp">
<table border="1">
 <tr>
     
 <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
   
    <th>&nsbp&nsbp&nsbp&nsbp&nsbp Assignee &nsbp&nsbp&nsbp&nsbp&nsbp</th>
    
  </tr> 
<%
MySQLConnection MySQLConnection=new MySQLConnection();

Connection con=MySQLConnection.getCon();

Statement st = (Statement) con.createStatement();
// System.out.println("creating statement");
Statement st2 = (Statement) con.createStatement();
ResultSet rs2 =  st2.executeQuery("select userName from userdetails");

String id=request.getParameter("id");
int no=Integer.parseInt(id);
//out.println(no);
int sumcount=0;

/*	
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");*/

EditingTickets editingTickets=new EditingTickets();
ArrayList<TestTablePojo> TestTablelist = editingTickets.editTicket(no);

for(TestTablePojo testTable : TestTablelist) {
%>
<tr>

 <td><input type="hidden" name="Testtable_id" value="<%=testTable.getTesttable_id()%>">
<%=testTable.getTesttable_id()%>
</td>
<td><%=testTable.getTicket_Id()%></td>
<td><%=testTable.getName() %></td>

   <td>
   <% 
   while(rs2.next())
		{
    		if((testTable.getAssignee()).equalsIgnoreCase(rs2.getString("userName")))
    		{
    			
    	    	%>
    	    	
    	    	<input type="radio" name="Assignee" value="<%=testTable.getAssignee()%>" checked> <%=testTable.getAssignee()%><br>
    	    	<%
    		}
    		else{
    			
    		
    		%>
    		<input type="radio" name="Assignee" value="<%=rs2.getString("userName")%>"> <%=rs2.getString("userName")%><br>
    		
    		
    		<%
    		}
    		}
    	%>
   <!-- 
    <select name = "Assignee">
            <option value = "<%=testTable.getAssignee()%>"><%=testTable.getAssignee()%></option>
               <option value = "Ram">Ram</option>              
               <option value = "Saurabh">Saurabh</option>
               <option value = "Namrata">Namrata</option>
               <option value = "Vijay">Vijay</option>
               <option value = "Arun">Arun</option>
   </select> -->
   
 </td>
 
    <td><input type="submit" name="Submit" value="Save" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>

</tr>
<%
}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("Homepage.jsp");
	
}
%>
</table>
</form></body>