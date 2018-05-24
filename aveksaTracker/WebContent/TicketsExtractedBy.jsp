<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


          <%@ page import="pojo.TestTablePojo" %>
          <%@ page import ="java.util.ArrayList" %>
          <%@ page import ="database.TestTableData" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket updated Details</title>

  <style>
table {
    font-family: arial, sans-serif;
   font-size: 12px;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 2px solid #d87229;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #daddd7;
}
</style>
  
</head>
<body style="background-color:#daddd7;">
<table>     
     
     
    
  
  <tr>
   <!--   <th>Editing</th>-->
    <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
   
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>Assignee</th>
    <th>Ticket Extracted </th>
    <th>Ticket Updated</th>
    
  </tr> 
 
<%

try{
String userid=session.getAttribute("userId").toString();
TestTableData testTableData=new TestTableData();
ArrayList<TestTablePojo> TestTablelist = testTableData.getTestTableData();



for(TestTablePojo testTable : TestTablelist) {
	//System.out.println(testTable.getTicketsExtractedBy()+"its extracted by if condition in ticketsExtractedBy page "+);
	
	if(((testTable.getTicketsExtractedBy()).equalsIgnoreCase("NA")) && (testTable.getTicketsUpdatedBy().equalsIgnoreCase("NA")))
	{
	//	System.out.println("its extracted by if condition in ticketsExtractedBy page ");
	}else
	{
	%>
	
	<tr>
<!-- 	<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=testTable.getTesttable_id()%>);" ></td> -->
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
      <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getTicketsExtractedBy()%></td>  
    <td><%=testTable.getTicketsUpdatedBy()%></td>  
	</tr>
	
	
	<%
	
	}
    }
}
catch(Exception e)
{
	response.sendRedirect("Homepage.jsp");
}
 
%>

</table>
</body>
</html>