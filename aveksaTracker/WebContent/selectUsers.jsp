<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#daddd7;">
<%@ page import ="tickets.ExtractingTickets" %> 
  <% %>
<center> 

<% try{
String userid=session.getAttribute("userId").toString();
String[] assigning = request.getParameterValues("assigning");
 
 //ExtractingTickets extractingTickets= new ExtractingTickets();
//extractingTickets.inserDataFromExceltotable();
//extractingTickets.extractTicket(assigning);
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Login.jsp");
}
 %>
<h1> Tickets extracted succesfully Please check in Un-assigned tickets tab</h1>
 <a href="Homepage.jsp" >click me to Home for Un Assigned Tickets</a>
</body>
</html>