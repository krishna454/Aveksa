<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ page import="tickets.UpdateTicket" %>

 <body style="background-color:#daddd7;">   
<%

try
{
	String userid=session.getAttribute("userId").toString(); 

String ide=request.getParameter("Testtable_id");
int num=Integer.parseInt(ide);
String Ticket_Id=request.getParameter("Ticket_Id");

String Name=request.getParameter("Name");
String Form_Type=request.getParameter("Form_Type");
int formtype=Integer.parseInt(Form_Type);


String No_of_Users=request.getParameter("No_of_Users");
int no_of_Users=Integer.parseInt(No_of_Users);

String No_of_Targets=request.getParameter("No_of_Targets");
int no_of_Targets=Integer.parseInt(No_of_Targets);

String No_of_Events=request.getParameter("No_of_Events");
int no_of_Events=Integer.parseInt(No_of_Events);


String Ticket_Type=request.getParameter("Ticket_Type");
int tickettype=Integer.parseInt(Ticket_Type);

String Ticket_Category=request.getParameter("Ticket_Category");
int ticketCategory=Integer.parseInt(Ticket_Category);

String Department=request.getParameter("Department");

String Location=request.getParameter("Location");
int location=Integer.parseInt(Location);

String Company_Name=request.getParameter("Company_Name");

String AFX=request.getParameter("AFX");
int afx=Integer.parseInt(AFX);

String Assignee=request.getParameter("Assignee");

String Comments=request.getParameter("Comments");
String Ticket_Status=request.getParameter("Ticket_Status");
int ticketStatus=Integer.parseInt(Ticket_Status);

System.out.println("Ticket_Id is "+Ticket_Id+" Assignee is "+Assignee+" ");

//String Completed_Date=request.getParameter("Completed_Date");

UpdateTicket updateTicket=new UpdateTicket();
updateTicket.updateTickets(num,Comments,Ticket_Id,no_of_Users,no_of_Targets,no_of_Events,formtype,tickettype,ticketCategory,Department,location,Company_Name,afx,Assignee, ticketStatus);
response.sendRedirect("Homepage.jsp");


}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Login.jsp");
}
%>

</body>