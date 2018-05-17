<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Assigned Tickets</title>

  <style>
table {
    font-family: arial, sans-serif;
   font-size: 12px;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

    <script language="javascript">
function assigneTicket(id){
    var f=document.unAssingedForm;
    f.method="post";
    f.action='unAssignedTicketEditing.jsp?id='+id;
    f.submit();
}
</script>

<%

//String userName=request.getParameter("userName");
%>
</head>
<body>
  <%@ page import="pojo.TestTablePojo" %>
          <%@ page import ="java.util.ArrayList" %>
          <%@ page import ="database.TestTableData" %>

    
          <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="education">
        <div class="my-auto">
          <h2 class="mb-5" >Below are the assigned Tickets </h2>

          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">
     
     
     <a href="Homepage.jsp" >click me to go Home Page</a>
               <form method="post" name="unAssingedForm">
<table>    
  
  <tr>
  <th>Editing</th>
 <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
<!--      <th>Form Type</th>
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
    <th>AFX</th>    -->
    <th>Assignee</th>
  <!--    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
     -->
  </tr> 
 
   <% try {
            	String userid=session.getAttribute("userId").toString(); 

int i=0;
TestTableData testTableData=new TestTableData();
ArrayList<TestTablePojo> TestTablelist = testTableData.getTestTableData();
for(TestTablePojo testTable : TestTablelist) {
	
	String status=testTable.getTicket_Status();
	String assigneed= testTable.getAssignee();
	if(status.equalsIgnoreCase("Assigned"))
			{
		i++;
	%>


	<tr>
	<td><input type="button" name="edit" value="Edit" style="background-color:green;  font-weight:bold;color:white;" onclick="assigneTicket(<%=testTable.getTesttable_id()%>);" ></td>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
   
   <td><%=testTable.getAssignee() %></td>
 
    
	</tr>
	
	
	<%
	
			}
    }
 
%>
</table>
</h3>
 </div></div></div></section>
<%

if(i==0)
{

%>
 No  Assigned tickets
 <%
}
 else
 {
	 %>
	We have  Total <%=i %> Tickets
 <%
	 
 }
   }
   catch(Exception e)
   {
		e.printStackTrace();
		response.sendRedirect("Login.jsp");
	   
   }
 %>


</form>
    
</body>
</html>