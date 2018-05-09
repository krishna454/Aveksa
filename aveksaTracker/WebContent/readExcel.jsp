<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ page import ="tickets.ExtractingTickets" %>  

 <html>  
 <head>  
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
 <title>Insert title here</title>  
 </head>  
 <body>  
 <!--<jsp:useBean id="connection" class="database.MySQLConnection" scope="page">  
   <jsp:setProperty name="connection" property="*"/>  
 </jsp:useBean>   -->
 <!--  
 <form action="selectUsers.jsp">
  <input type="checkbox" name="assigning" value="Ram">Ram<br>
  <input type="checkbox" name="assigning" value="Saurabh" >Saurabh<br>
   <input type="checkbox" name="assigning" value="Vijay">Vijay<br>
  <input type="checkbox" name="assigning" value="Namrata" >Namrata<br>
  <input type="checkbox" name="assigning" value="Arun" >Arun<br>
  <input type="submit" value="Submit">
</form>-->
<% 

ExtractingTickets extractingTickets= new ExtractingTickets();
 extractingTickets.inserDataFromExceltotable();
 
extractingTickets.extractTicket();

 %>
<h1> Tickets extracted succesfully Please check in Un-assigned tickets tab</h1>
 <a href="unAssignedTickts.jsp" >click me to show Un Assigned Tickets</a>
 
 </body>  
 </html>  