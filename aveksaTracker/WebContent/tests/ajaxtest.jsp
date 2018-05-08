<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="formoid" action="studentFormInsert.php" title="" method="post">
        <div>
            <label class="title">First Name</label>
            <input type="text" id="name" name="name" >
        </div>
        <div>
            <label class="title">Name</label>
            <input type="text" id="name2" name="name2" >
        </div>
        <div>
            <input type="submit" id="submitButton"  name="submitButton" value="Submit">
        </div>
 </form>
<script type='text/javascript'>
    /* attach a submit handler to the form */
    $("#formoid").submit(function(event) {

      /* stop form from submitting normally */
      event.preventDefault();

      /* get the action attribute from the <form action=""> element */
      var $form = $( this ),
          url = $form.attr( 'action' );

      /* Send the data using post with element id name and name2*/
      var posting = $.post( url, { name: $('#name').val(), name2: $('#name2').val() } );

      /* Alerts the results */
      posting.done(function( data ) {
        alert('success');
      });
    });
</script>

</body>
</html> 