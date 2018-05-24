<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ page import="tickets.UpdateTicket" %>
 <body style="background-color:#daddd7;">   
 <% 
 try{
 String userid=session.getAttribute("userId").toString(); 

String ide=request.getParameter("Testtable_id");
int num=Integer.parseInt(ide);
String ticket_Name=request.getParameter("ticket_Name");


//int Assigned=Integer.parseInt(Assignee);

UpdateTicket updateTicket=new UpdateTicket();
updateTicket.updateAddTickets(num, ticket_Name,userid);


//System.out.print(Assigned);
response.sendRedirect("Homepage.jsp");
 }
 catch(Exception e)
 {
	 e.printStackTrace();
	 response.sendRedirect("Login.jsp");
 }
%>
</body>