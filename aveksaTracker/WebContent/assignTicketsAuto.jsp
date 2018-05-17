<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import ="tickets.ExtractingTickets" %>  
     <%@ page import ="database.MySQLConnection" %>
             <%@ page import ="java.sql.Connection" %>
            <%@ page import ="java.sql.Statement" %>
            <%@ page import ="java.sql.ResultSet" %>
           
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assigning Tickets</title>
</head>
<body style="background-color:#daddd7;">
<% 
try{
	String userid=session.getAttribute("userId").toString();
String list[]=request.getParameterValues("assignee");

ExtractingTickets extractingTickets= new ExtractingTickets();
 extractingTickets.inserDataFromExceltotable();
 
String update=extractingTickets.extractTicket(list,userid);


 %>
<h1> <%=update %></h1>
 <a href="Homepage.jsp" >click me to go Home</a>
 <%
}
catch(Exception e)
{
	  response.sendRedirect("Login.jsp");
}

 
 %>
</body>
</html>