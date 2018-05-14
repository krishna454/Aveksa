<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>change password</title>
</head>
<body>
<form name="changePass" action="ChangePassword" method="get">



<table>

<tr>
<td>User ID</td><td><input type="Test" name="user_Id" required/></td></tr>
<tr>
<td>Old Password</td><td><input type="password" name="oldPassword" minlength="5" required/></td>
</tr>
<tr>
<td> New Password</td><td><input type="password" name="newPassword" minlength="5" required/></td>
</tr>
<tr>
<td><input type="submit" value="Change Password"/></td>
</body>
</html>