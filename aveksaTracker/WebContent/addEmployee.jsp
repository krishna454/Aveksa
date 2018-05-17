<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <%
  try{
  String userid=session.getAttribute("userId").toString();
  }
  catch(Exception e)
  {
	  response.sendRedirect("Login.jsp");
  }
 
  
  %>
</head>
<body style="background-color:#daddd7;">
<form name="Employee"  method="get" action="AddUser" >

<table>

<tr>
<td>User ID</td><td><input type="Test" name="user_Id" required/></td></tr>
<tr>
<td>User Name</td><td><input type="Test" name="user_Name" required/></td>
</tr>
<tr>
<td>Password</td><td><input type="password" name="password"  minlength="5" required/></td>
</tr>
<tr>
<td>
Is Admin
 <select name = "admin">
             <option value = "No" >No</option>
               <option value = "Yes">yes</option>
              
              
    </select>

</td><td><input type="submit" value="Add Employe"/></td>
</tr>
</table>

</form>

<form name="deleteEmployee"  method="get" action="DeleteUser">
<table>
<tr>
<td>User ID</td>
<td><input type="Test" name="duser_Id"/></td></tr>
</td><td><input type="submit" value="Delete Employe" required/></td>
</tr>
</table>
</form>


</body>
</html>