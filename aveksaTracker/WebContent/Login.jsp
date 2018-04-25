<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aveksa Tracker</title>
</head>
<body>
<center>
<h1>Welcome to Aveksa Tracker</h1>
</center>

<center>
<div>
<form Name="LoginForm" methode="GET" action="LoginServlet">
<table>
  <tr>
    <th> User Name</th>
    <th><input type= "text"   id="userName" Name="userName"></th>
  </tr>
<tr>
    <th>Password</th>
    <th><input type="password" id="password" Name="password"></th>
  </tr>
  
  <tr>
    <th><input type="submit" id="loginButton" value="Login"/></th>
    <th><input type="Button" id="resetButton" value="Reset"></th>
  </tr>
</table>

</form>
</div>
</center>

</body>
</html>