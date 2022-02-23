<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:scriptlet>String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}</jsp:scriptlet>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add patient</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
<script src="js/JsProperties.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

 <style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
	margin: auto;
	font-size: 1rem;
    font-weight: 700;
    line-height: 1.5
    

}



h1 {
	text-align: center;
	margin-left:130px;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Futara;
	border: 1px solid #aaaaaa;
}


button {
	background-color: #04AA6D;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
}
.card
{
   
    position: inherit;
    width: 776px;
    height: 385px;
    margin-left: 373px;
    background-color: white;
    background-clip: border-box;
    border: 1px solid;
    padding-right: 163px;
}
</style>

<script src="js/JsProperties.js"></script>

</head>
<body>
 <jsp:include page="Header.jsp"></jsp:include>
 	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
 <div >
 <h1>Add patient</h1>
 <div class="card">
  <div class="card-body">
<form class="col-lg-5 offset-lg-4 " action=""
		method="POST" name="form1" id="Form1">
	
        		
        <div class="form-group class="row justify-content-center"">
          <label for="name"> Name<span class="required-field">:</span></label>
          <input type="text" class="form-control" placeholder="Full Name" name="name" 
           id="name" required>
      </div> 
      
        <div class="form-group">
          <label for="position">Address<span class="required-field">:</span></label>
           <textarea rows = "3" cols = "45" name = "address" id="address" required  >
         
         </textarea>
      </div>      
      <div class="form-group">
          <label for="mobile no">Mobile No<span class="required-field">:</span></label>
          <input type="number" class="form-control" placeholder="Enter mobile No " name="mobilenumber" 
           id="mobilenumber" required> 
        </div>      
        
 
		
		<div style="overflow: auto;">
			<div style="float: center; decoration: none; text-align:center;">
				<button type="submit" id="addButton">Submit</button>
				
			</div>

		</div> 

	</form>
	</div>
	</div>
	</div>
	
	<script>
    	$(document).ready(function() {
    		
		var pattern =/^[a-zÀ-ÿ ,.'-]+$/i;
		var MobileNumberPattern=/[A-Za-z\s]+$/;
		var name=document.getElementById("name").value;
		var mobilenumber=document.getElementById("mobilenumber").value;
		var address=document.getElementById("address").value;
		
		alert("Page running");
		var dataString = 'name=' + name
		+ '&mobilenumber=' + mobilenumber +'&address='+ address;
		
		alert(dataString);
		if(!name.match(pattern))
			{
			alert("please enter valid name");
			return false;
			}else if(mobilenumber.match(MobileNumberPattern))
					{
						alert("please enter valid mobile number");
						return false;
					}else if(mobilenumber.length!=10)
					{
					alert("mobile number should be 10 digits");
					return false;
					}else
							{
						$.ajax({

							type : "POST",
							url : "AddPatientServlet",
							data : dataString,		
							 $(document).ajaxSuccess(function(){
								    alert("AJAX request successfully completed");
								  });
						 $("button").click(function(){
							    $("div").load("SuccessMessage.jsp");
							  });						 
						});
							}
		
		return true;
		
    	});
						
				
	
	</script>
	
	
	  <jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>







