<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="database.MySQLConnection" %>
<%@ page import ="java.util.ArrayList" %>
          <%@ page import ="tickets.EditingTickets" %>
            <%@ page import="pojo.TestTablePojo" %>
            
            
<form method="post" action="updateUnAssingedTicket.jsp">
<table border="1">
 <tr>
     
 <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
   
    <th>Assignee</th>
    
  </tr> 
<%

String id=request.getParameter("id");
int no=Integer.parseInt(id);
//out.println(no);
int sumcount=0;
try {
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
    <select name = "Assignee">
            <option value = "5"><%=testTable.getAssignee()%></option>
               <option value = "0">Ram</option>              
               <option value = "1">Saurabh</option>
               <option value = "2">Namrata</option>
               <option value = "3">Vijay</option>
               <option value = "4">Arun</option>
   </select>
   
 </td>
 
    <td><input type="submit" name="Submit" value="Save" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>

</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>