<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:scriptlet>String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}</jsp:scriptlet>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>AddNurse Page</title>
<script src="js/JsProperties.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
	
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js">
	
</script>

<!-- Default bootstrap CSS link taken from the 
        bootstrap website-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>
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
	margin-left: 125px;
}

input {
	width: 400px;
	font-size: 17px;
	font-family: Futara;
	border: 1px solid #aaaaaa;
}

button {
	background-color: #04AA6D;
	color: #ffffff;
	border: none;
	padding: 7px 20px;
	font-size: 17px;
	font-family: Raleway;
	margin-top:5px;
}
.card
{
   
     width: 728px;
    height: 440px;
    margin-left: 373px;
    background-color: white;
    background-clip: border-box;
    border: 1px solid;
    padding-right: 49px;
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
	<h1>Add Nurse</h1>
		<div class="card">
			<div class="card-body">

				<form class="col-lg-5 offset-lg-4 " style="margin-top: -22px;"
					action="" method="POST" name="form1" id="form1"
					onsubmit="return validateForm()">



					<div class="">
						<label for="name">Full Name<span class="required-field">:</span></label>
						<input type="text" class="form-control" placeholder="Full Name"
							name="name" id="name" required>
					</div>

					<div class="form-group">
						<label"position">Position<span class="required-field">:</span></label>
						<input type="text" class="form-control"
							placeholder="Enter position" name="position" id="position"
							required>
					</div>

					Registerd:
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault2" value="yes"
							checked /> <label class="form-check-label"
							for="flexRadioDefault2">Yes</label>
					</div>
					<!-- Default checked radio -->
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault1" value="no" />
						<label class="form-check-label" for="flexRadioDefault1">No</label>
					</div>

					<div >
						<label for="ssn">SSN*(9-digits)<span
							class="required-field">:</span></label> <input type="number"
							class="form-control" placeholder="Enter ssn(123456789) "
							name="ssn" id="ssn" required>
					</div>
					<div >
						<label for="join date">Joining date<span
							class="required-field">:</span></label> <input type="date"
							class="form-control" placeholder="join date" id="joindate"
							name="joindate" required>
					</div>


					<div style="overflow: auto;">
						<div
							style="float: center; decoration: none; text-align: center;">
							<button type="submit">Submit</button>

						</div>

					</div>

				</form>

			</div>
		</div>
	<script>
		function validateForm() {

			var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
			var ssnPattern = /[A-Za-z\s]+$/;
			var name = document.getElementById("name").value;
			var position = document.getElementById("position").value;
			var ssn = document.getElementById("ssn").value;
			
			if (!name.match(pattern)) {
				alert("please enter valid name");
				return false;
			} else if (!position.match(pattern)) {
				alert("please enter valid Position name");
				return false;
			}
			if (ssn.match(ssnPattern)) {
				alert("please enter valid ssn name");
				return false;
			} else if (ssn.length != 9 || ssn.length < 9) {
				alert("ssn number should be 9 digits");
				return false;
			} else {
				return true;
			}
		}
	</script>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
