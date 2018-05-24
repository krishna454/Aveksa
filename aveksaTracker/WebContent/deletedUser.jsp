<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#daddd7;">
  <%
  try{
  String userid=session.getAttribute("userId").toString();
  }
  catch(Exception e)
  {
	  response.sendRedirect("Login.jsp");
  }
  
  %>
<h2>Successfully Deleted Employee</h2>
<a href="Homepage.jsp">Click here to go Home</a>
</body>
</html>