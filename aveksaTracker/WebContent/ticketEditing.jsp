<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="database.MySQLConnection" %>
<%@ page import ="java.util.ArrayList" %>
          <%@ page import ="tickets.EditingTickets" %>
            <%@ page import="pojo.TestTablePojo" %>
<form method="post" action="updateTicket.jsp">
<table border="1">
 <tr>
     
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
    
    <th>Ticket_Status</th>
    <th>Completed_Date</th>
    <th>Comments</th>
   
    
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
<%
if(testTable.getName().contains("Rule"))
{
	%>
	<td><input type="Text" name="Ticket_Id" value="<%=testTable.getTicket_Id()%>"></td>
	
	<%
	
}
else
{
	


%>
 <td><lable name="Ticket_Id" value="<%=testTable.getTicket_Id()%>"><%=testTable.getTicket_Id()%></lable></td>
<%
}
%>
<td><%=testTable.getName() %></td>
<td>
 <select name = "Form_Type">
         <option value = "57"><%=testTable.getForm_Type() %></option>
               <option value = "0">File Share groups</option>
               <option value = "1">Active Directory - DEV</option>
               <option value = "2">AIX Unix</option>
               <option value = "3">Application Xtender groups</option>
               <option value = "4">Aveksa Compliance Manager (ACM)</option>
               <option value = "5">Caseworks groups	</option>
               <option value = "6">CITRIX groups</option>
               <option value = "7">Clarity</option>
               <option value = "8">Clarity groups</option>
               <option value = "9">Databases - Oracle</option>
               <option value = "10">Databases - SQL</option>
               <option value = "11">Databases - SQL DEV</option>
               <option value = "12">EAI End System SME groups</option>
               <option value = "13">ePortal Application groups</option>
               <option value = "14">eService Portal Groups</option>
               <option value = "15">Ferguson ASP</option>
               <option value = "16">Folder Access</option>
               <option value = "17">Gas Supply groups</option>
               <option value = "18">GasPro</option>
               <option value = "19">ITS Facilities</option>
               <option value = "20">ITS Server Support groups</option>
               <option value = "21">Miscellaneous groups</option>
               <option value = "22">Mobile Mapping groups</option>
               <option value = "23">Other</option>
               <option value = "24">PeopleSoft Finance/Supply Chain (ePro)</option>
               <option value = "25">PeopleSoft HRMS/Payroll</option>
               <option value = "26">Powerplant/Powertax</option>
               <option value = "27">Remote Access</option>
               <option value = "28">SalesForce</option>
               <option value = "29">Shared Mailbox Creation</option>
               <option value = "30">SharePoint groups</option>
               <option value = "31">Smallworld</option>
               <option value = "31">Supervisor Change for Contractors</option>
               <option value = "32">Supplier Interface Manager (SIM) Application  groups</option>
               <option value = "33">Tableau Development</option>
               <option value = "34">Transfer.washgas (FTP)</option>
               <option value = "35">Transmission Risk Model (TRM)</option>
               <option value = "36">Unity</option>
               <option value = "37">WGES Coollinks</option>
               <option value = "38">WGES Entegrate</option>
               <option value = "39">WGES groups</option>
               <option value = "40">WGL Distribution Lists</option>
               <option value = "41">WM Asset Manager</option>
               <option value = "42">WM BAF</option>
               <option value = "44">WM Central Config</option>
               <option value = "45">WM EE_GUI</option>
               <option value = "46">WM Security Admin</option>
               <option value = "47">WM Web Work Manager</option>
               <option value = "48">WM Work Manager</option>
               <option value = "49">Washington Gas On-boarding Express Access</option>
               <option value = "50">Contractor On-boarding Express Access</option>
               <option value = "51">Termination</option>
               <option value = "52">Termination Request Form</option>
               <option value = "53">Profile update</option>
               <option value = "54">Application Access</option>
               <option value = "55">Server Access</option>
               <option value = "56">User List</option>
         </select>





    <td><lable><%=testTable.getRequest_Date()%></lable></td>
    <td><lable><%=testTable.getQueued_Date()%></lable></td>
    <td><input type="text" name="No_of_Users" value="<%=testTable.getNo_of_Users()%>"></td>
    <td><input type="text" name="No_of_Targets" value="<%=testTable.getNo_of_Targets()%>"></td>
    <td><input type="text" name="No_of_Events" value="<%=testTable.getProvisioning_Events()%>"></td>
    <td>
     <select name = "Ticket_Type">
             <option value = "2"><%=testTable.getTicket_Type()%></option>
               <option value = "0">Aveksa</option>
               <option value = "1">Snow</option>
    </select>
    </td>
    
     <td>
     <select name = "Ticket_Category">
             <option value = "6" ><%=testTable.getTicket_Category()%></option>
               <option value = "0">Normal Access Request</option>
               <option value = "1">Onboarding Request</option>
               <option value = "2">Normal Termination</option>
               <option value = "3">Escalated Access Request</option>
               <option value = "4">Expedited Termination</option>
               <option value = "5">ATS</option>
              
    </select>
    </td>
    <td><input type="text" name="Department" value="<%=testTable.getDepartment()%>"></td>
    
    
    <td>
    
    <select name = "Location">
            <option value = "29"><%=testTable.getLocation()%></option>
               <option value = "0">Remote</option>              
               <option value = "1">1</option>
               <option value = "2">2</option>
               <option value = "3">3</option>
               <option value = "4">4</option>
               <option value = "5">5</option>
               <option value = "6">6</option>
               <option value = "7">9</option>
               <option value = "8">11</option>
               <option value = "9">13</option>
               <option value = "10">15</option>
               <option value = "11">16</option>
               <option value = "12">17</option>
               <option value = "13">18</option>
               <option value = "14">19</option>
               <option value = "15">24</option>
               <option value = "16">400</option>
               <option value = "17">401</option>
               <option value = "18">402</option>
               <option value = "19">403</option>
               <option value = "20">405</option>
               <option value = "21">406</option>
               <option value = "22">407</option>
               <option value = "23">408</option>
               <option value = "24">500</option>
               <option value = "25">1A</option>
               <option value = "26">RDH</option>
               <option value = "27">RDS</option>
               <option value = "28">RET</option>
               
    
    </select>
    </td>
    <td><input type="text" name="Company_Name" value="<%=testTable.getCompany_Name()%>"></td>
    <td>
     <select name = "AFX">
             <option value = "2"><%=testTable.getAFX()%></option>
               <option value = "0">Yes</option>
               <option value = "1">No</option>
    </select>
 </td>        
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
  
    
   

 <td>  <select name = "Ticket_Status">
             <option value = "7" ><%=testTable.getTicket_Status()%></option>
               <option value = "0">In-progress</option>
               <option value = "1">Completed</option>
               <option value = "2">Awaiting User info</option>
               <option value = "3">Awaiting User confirmation</option>
               <option value = "4">Transferred</option>
               <option value = "5">Cancelled</option>
               <option value = "6">On-Hold</option>
              
    </select>
    
  </td> 
 
   <td><%=testTable.getCompleted_Date()%></td>	
    <td><input type="test" name="Comments" value="<%=testTable.getComments()%>"></td>
    <td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>

</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>