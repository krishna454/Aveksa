<!DOCTYPE html>
<html lang="en">

  <head>
  <!-- Editing rows of the table -->
       <script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='ticketEditing.jsp?id='+id;
    f.submit();
}
function editInprogressRecord(id){
	var f=document.Inprogressform;
    f.method="post";
    f.action='ticketEditing.jsp?id='+id;
    f.submit();
	
}
function AWaitingInfoform(id){
	var f=document.AWaitingInfoform;
    f.method="post";
    f.action='ticketEditing.jsp?id='+id;
    f.submit();
	
}
function unassignedform(id){
	var f=document.unassignedform;
    f.method="post";
    f.action='ticketEditing.jsp?id='+id;
    f.submit();
	
}
</script>
  
  
  
  <!--Table design  -->
  
  <style>
table {
    font-family: arial, sans-serif;
   font-size: 12px;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
  
  
  
  

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Aveksa Tracker</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">

  </head>

  <body id="page-top">
  

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">
        <span class="d-block d-lg-none">Start Bootstrap</span>
        <span class="d-none d-lg-block">
          <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="profile.jpg" alt="">
        </span>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      
      
      <!-- Left side options -->
      
      
      
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#skills">Extract Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#interests">Un Assigned Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">All Aveksa Tickets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#experience">In-Progress</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#education"> A Waiting user Info</a>
          </li>
           
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#awards"></a>
          </li>
          
          <li class="nav-item">
            <form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" />
    </form>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid p-0">



<!-- get session and providing the name of the user -->



      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          
  
       
   
      <h3 class="mb-0">Welcome 
            <span class="text-primary"><%=session.getAttribute("userName")%></span>
            
          </h3>
       
          
          <%@ page import="pojo.TestTablePojo" %>
          <%@ page import ="java.util.ArrayList" %>
          <%@ page import ="database.TestTableData" %>
          
          
          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">
              
          
          <!-- finding a ticket -->
          
        
          
          <form id= class="example" action="action_page.php">
          <input type="text" placeholder="Search a ticket" name="search">
          <button type="button" onclick="getTicketDetails()" ><i class="fa fa-search"></i></button>
          </form>
          
          
          All Tickets
    <form method="post" name="form">
<table>     
     
     
    
  
  <tr>
    <th>Editing</th>
    <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>No_of_Users</th>
    <th>No_of_Targets</th>    
    <th>Provisioning_Events</th>
    <th>Ticket_Type</th>
    <th>Ticket_Category</th>    
    <th>Department</th>
    <th>Location</th>
    <th>Company_Name</th>
    <th>AFX</th>    
    <th>Assignee</th>
    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
    
  </tr> 
 
<%


TestTableData testTableData=new TestTableData();
ArrayList<TestTablePojo> TestTablelist = testTableData.getTestTableData();



for(TestTablePojo testTable : TestTablelist) {
	
	
	%>
	
	<tr>
	<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=testTable.getTesttable_id()%>);" ></td>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %></td>
    <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getNo_of_Users()%></td>
    <td><%=testTable.getNo_of_Targets()%></td>
    <td><%=testTable.getProvisioning_Events()%></td>
    <td><%=testTable.getTicket_Type()%></td>
    <td><%=testTable.getTicket_Category() %></td>
    <td><%=testTable.getDepartment()%></td>
    <td><%=testTable.getLocation()%></td>
    <td><%=testTable.getCompany_Name()%></td>
    <td><%=testTable.getAFX()%></td>        
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date() %></td>
    <td><%=testTable.getTicket_Status() %></td>
    <td><%=testTable.getComments()%></td>  
	</tr>
	
	
	<%
	

    }
 
%>

</table></form>
         </h3></div>
        
       
      </section> 
       
    
<!-- Inprogress tickets -->

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="experience">
        <div class="my-auto">
          <h2 class="mb-5">InProgress Tickets</h2>

          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">
              <table>
     
    <form method="post" name="Inprogressform">
<table>    
  
  <tr>
  <th>Editing</th>
     <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>No_of_Users</th>
    <th>No_of_Targets</th>    
    <th>Provisioning_Events</th>
    <th>Ticket_Type</th>
    <th>Ticket_Category</th>    
    <th>Department</th>
    <th>Location</th>
    <th>Company_Name</th>
    <th>AFX</th>    
    <th>Assignee</th>
    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
     
  </tr> 
 
  
<%

for(TestTablePojo testTable : TestTablelist) {
	
	String status=testTable.getTicket_Status();
	
	if(status.equalsIgnoreCase("inprogress"))
			{
	%>
	<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editInprogressRecord(<%=testTable.getTesttable_id()%>);" ></td>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %></td>
    <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getNo_of_Users()%></td>
    <td><%=testTable.getNo_of_Targets()%></td>
    <td><%=testTable.getProvisioning_Events()%></td>
    <td><%=testTable.getTicket_Type()%></td>
    <td><%=testTable.getTicket_Category() %></td>
    <td><%=testTable.getDepartment()%></td>
    <td><%=testTable.getLocation()%></td>
    <td><%=testTable.getCompany_Name()%></td>
    <td><%=testTable.getAFX()%></td>        
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date() %></td>
    <td><%=testTable.getTicket_Status() %></td>
    <td><%=testTable.getComments()%></td>
    
	</tr>
	
	<%
	
			}
    }
 
%>
</table>
</h3>
              </div>
          </div></div></section>


      
<!-- waiting user Info -->



     
          <<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="education">
        <div class="my-auto">
          <h2 class="mb-5">Awaiting User Info</h2>

          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">
     
               <form method="post" name="AWaitingInfoform">
<table>    
  
  <tr>
  <th>Editing</th>
 <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>No_of_Users</th>
    <th>No_of_Targets</th>    
    <th>Provisioning_Events</th>
    <th>Ticket_Type</th>
    <th>Ticket_Category</th>    
    <th>Department</th>
    <th>Location</th>
    <th>Company_Name</th>
    <th>AFX</th>    
    <th>Assignee</th>
    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
     
  </tr> 
 
  
<%

for(TestTablePojo testTable : TestTablelist) {
	
	String status=testTable.getTicket_Status();
	
	if(status.equalsIgnoreCase("Awaiting User info"))
			{
	%>
	
	<tr>
	<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editInprogressRecord(<%=testTable.getTesttable_id()%>);" ></td>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %></td>
    <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getNo_of_Users()%></td>
    <td><%=testTable.getNo_of_Targets()%></td>
    <td><%=testTable.getProvisioning_Events()%></td>
    <td><%=testTable.getTicket_Type()%></td>
    <td><%=testTable.getTicket_Category() %></td>
    <td><%=testTable.getDepartment()%></td>
    <td><%=testTable.getLocation()%></td>
    <td><%=testTable.getCompany_Name()%></td>
    <td><%=testTable.getAFX()%></td>        
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date() %></td>
    <td><%=testTable.getTicket_Status() %></td>
    <td><%=testTable.getComments()%></td>
    
	</tr>
	
	
	<%
	
			}
    }
 
%>
</table>
</h3> </div>

              </div></div>
        </div>
      </section>



<!-- Remaing  -->
      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="skills">
        <div class="my-auto">
          <h2 class="mb-5">Extracting Tickets</h2>
          
          <a href="readExcel.jsp" >click me to extract</a>

     <!--     <div class="subheading mb-3">Programming Languages &amp; Tools</div>
          <ul class="list-inline list-icons">
            <li class="list-inline-item">
              <i class="devicons devicons-html5"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-css3"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-javascript"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-jquery"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-sass"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-less"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-bootstrap"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-wordpress"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-grunt"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-gulp"></i>
            </li>
            <li class="list-inline-item">
              <i class="devicons devicons-npm"></i>
            </li>
          </ul>

          <div class="subheading mb-3">Workflow</div>
          <ul class="fa-ul mb-0">
            <li>
              <i class="fa-li fa fa-check"></i>
              Mobile-First, Responsive Design</li>
            <li>
              <i class="fa-li fa fa-check"></i>
              Cross Browser Testing &amp; Debugging</li>
            <li>
              <i class="fa-li fa fa-check"></i>
              Cross Functional Teams</li>
            <li>
              <i class="fa-li fa fa-check"></i>
              Agile Development &amp; Scrum</li>
          </ul>
        </div>  --> 
        
        
        </div>
      </section>

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="interests">
        <div class="my-auto">
          <h2 class="mb-5">Un Assigned Tickets</h2>
           <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">
          
                         <form method="post" name="unassignedform">
<table>    
  
  <tr>
   <th>Editing</th>
   <th>S.No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Form Type</th>
    <th>Request_Date</th>    
    <th>Queued_Date</th>
    <th>No_of_Users</th>
    <th>No_of_Targets</th>    
    <th>Provisioning_Events</th>
    <th>Ticket_Type</th>
    <th>Ticket_Category</th>    
    <th>Department</th>
    <th>Location</th>
    <th>Company_Name</th>
    <th>AFX</th>    
    <th>Assignee</th>
    <th>Completed_Date</th>
    <th>Ticket_Status</th>
    <th>Comments</th>
    
  </tr> 
 
  
<%

for(TestTablePojo testTable : TestTablelist) {
	
	String status=testTable.getTicket_Status();
	
	if(status.equalsIgnoreCase("unassigned"))
			{
	%>
	 <td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editInprogressRecord(<%=testTable.getTesttable_id()%>);" ></td>
	<td><%= testTable.getTesttable_id() %></td>
    <td><%=testTable.getTicket_Id() %></td>
    <td><%=testTable.getName()%></td>
    <td><%=testTable.getForm_Type() %></td>
    <td><%=testTable.getRequest_Date()%></td>
    <td><%=testTable.getQueued_Date()%></td>
    <td><%=testTable.getNo_of_Users()%></td>
    <td><%=testTable.getNo_of_Targets()%></td>
    <td><%=testTable.getProvisioning_Events()%></td>
    <td><%=testTable.getTicket_Type()%></td>
    <td><%=testTable.getTicket_Category() %></td>
    <td><%=testTable.getDepartment()%></td>
    <td><%=testTable.getLocation()%></td>
    <td><%=testTable.getCompany_Name()%></td>
    <td><%=testTable.getAFX()%></td>        
   <td><%=testTable.getAssignee() %></td>
    <td><%=testTable.getCompleted_Date() %></td>
    <td><%=testTable.getTicket_Status() %></td>
    <td><%=testTable.getComments()%></td>
   </tr>
	
	
	<%
	
			}
    }
 
%>
</table>
</h3> 
          
      </section>

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="awards">
        <div class="my-auto">
          <h2 class="mb-5">Awards &amp; Certifications</h2>
          <ul class="fa-ul mb-0">
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              Google Analytics Certified Developer</li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              Mobile Web Specialist - Google Certification</li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              1<sup>st</sup>
              Place - University of Colorado Boulder - Emerging Tech Competition 2009</li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              1<sup>st</sup>
              Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)</li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              2<sup>nd</sup>
              Place - University of Colorado Boulder - Emerging Tech Competition 2008</li>
            <li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              1<sup>st</sup>
              Place - James Buchanan High School - Hackathon 2006</li>
            <li>
              <i class="fa-li fa fa-trophy text-warning"></i>
              3<sup>rd</sup>
              Place - James Buchanan High School - Hackathon 2005</li>
          </ul>
        </div>
      </section>

    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>

  </body>

</html>
