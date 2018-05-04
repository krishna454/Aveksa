<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="pojo.TestTablePojo" %>
          <%@ page import ="java.util.ArrayList" %>
        
     
   <html>
<head>
<a href="Homepage.jsp">Home</a>
<a href="Login.jsp">Logout</a>
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
</head>
<body>
<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          <h2 class="mb-0">Welcome to Aveksa Tracker
            <span class="text-primary"><%=session.getAttribute("userName")%></span>
            
          </h2>
<h2>All Tickets</h2>

<table>
  <tr>
    <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Assigned</th>
    
    <th>completd Date</th>
  </tr> 
 
  
<% ArrayList<TestTablePojo> TestTablelist = (ArrayList<TestTablePojo>) request.getAttribute("TestTableArrayList");



for(TestTablePojo testTable : TestTablelist) {
	
	
	%>
	
	<tr>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %>
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date()%></td>
    
	</tr>
	
	
	<%
	

    }
 
%>
</table>



</body>
</html>  
     
     
        
     




