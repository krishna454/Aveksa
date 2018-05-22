<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <%@ page import="pojo.TestTablePojo" %>
          <%@ page import ="java.util.ArrayList" %>
          <%@ page import ="database.TestTableData" %>
           <%@ page import ="database.MySQLConnection" %>
             <%@ page import ="java.sql.Connection" %>
            <%@ page import ="java.sql.Statement" %>
            <%@ page import ="java.sql.ResultSet" %>
          
           <%String userid=session.getAttribute("userId").toString(); %> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>     
     
     
    
  
  <tr>
   <!--   <th>Editing</th>-->
    <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>No_of_Users</th>
    <th>No_of_Targets</th>    
    <th>Provisioning_Events</th>
    <th>Ticket_Type</th>
    <th>Ticket_Category</th>    
    <th>Department</th>
    <th>Location</th>
    <th>Company_Name</th>
    <th>AFX</th>    
    <th>Assignee</th>
    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
    
  </tr> 


<%
//String admin=null;
String userName=null;
MySQLConnection MySQLConnection=new MySQLConnection();

Connection con=MySQLConnection.getCon();
try {
Statement st = (Statement) con.createStatement();
// System.out.println("creating statement");
ResultSet rs =  st.executeQuery("select * from userdetails where userid='"+userid+"' ");
while(rs.next()){
//admin = rs.getString("Admin");
userName=rs.getString("userName");
}
st.close();
con.close();
MySQLConnection=null;

TestTableData testTableData=new TestTableData();
ArrayList<TestTablePojo> TestTablelist = testTableData.getTestTableData();
for(TestTablePojo testTable : TestTablelist) {
	
	String status=testTable.getTicket_Status();
	String assigneed= testTable.getAssignee();
//	System.out.println(status+" and the user name is "+userName);
	if(assigneed.equalsIgnoreCase(userName) )
			{
	%>
	<tr>
<!-- <td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=testTable.getTesttable_id()%>);" ></td> -->
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %></td>
    <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getNo_of_Users()%></td>
    <td><%=testTable.getNo_of_Targets()%></td>
    <td><%=testTable.getProvisioning_Events()%></td>
    <td><%=testTable.getTicket_Type()%></td>
    <td><%=testTable.getTicket_Category() %></td>
    <td><%=testTable.getDepartment()%></td>
    <td><%=testTable.getLocation()%></td>
    <td><%=testTable.getCompany_Name()%></td>
    <td><%=testTable.getAFX()%></td>        
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date() %></td>
    <td><%=testTable.getTicket_Status() %></td>
    <td><%=testTable.getComments()%></td>  
	</tr>
	
	
	<%
  
    }

}
}
catch(Exception e)
{
	
}
%>

</table>
</body>
</html>