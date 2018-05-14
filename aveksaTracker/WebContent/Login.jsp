<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="false" %>
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
<form  methode="GET" action="LoginServlet">
<table>
  <tr>
    <th> User Name</th>
    <th><input type= "text"   id="userID" Name="userID" required></th>
  </tr>
<tr>
    <th>Password</th>
    <th><input type="password" id="password" Name="password" required></th>
  </tr>
  
  <tr>
    <th><input type="submit" id="loginButton" value="Login"/></th>
    
  
  </form>
 
  <td> <form name="passwordReset" action="passwordChange.jsp" method="get">
<input type="submit" value="Change my password">
</form>
  </td>
  </tr>
</table>
</div>
</center>

<script type="text/javascript">

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};</script>
</body>
</html>