<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import ="excel.CreatingExcelFile" %>
<title>Insert title here</title>
</head style="background-color:#daddd7;">
<body>
  <%
  try{
	String userid=session.getAttribute("userId").toString();

String query="Select * from testtable";

CreatingExcelFile creatingExcelFile=new CreatingExcelFile();
creatingExcelFile.createAveksaTicketsDump(query);
}
catch(Exception e)
{
	  response.sendRedirect("Login.jsp");
}


%>
<a href="Homepage.jsp" >Successfully pull the dump please check in D drive the file name is AveksaTicketsData</a>

</body>
</html>