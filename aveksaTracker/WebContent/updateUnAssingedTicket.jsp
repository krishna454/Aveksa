<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ page import="tickets.UpdateTicket" %>
<%
String ide=request.getParameter("Testtable_id");
int num=Integer.parseInt(ide);

String Assignee=request.getParameter("Assignee");
int Assigned=Integer.parseInt(Assignee);

UpdateTicket updateTicket=new UpdateTicket();
updateTicket.updateUnAssignedTickets(num,Assigned);

//System.out.print(Assigned);
response.sendRedirect("unAssignedTickts.jsp");

%>