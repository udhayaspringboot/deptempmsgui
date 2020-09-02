<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Emp Dept App</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

#header {
	background-color: black;
	width: 100%;
	height: 50px;
	text-align: center;
}

#sidebar-left {
	float: left;
	width: 15%;
	height: 75%;
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 70%;
	background-color:lightgrey;
}

#sidebar-right {
	float: left;
	width: 15%;
	height: 75%;
	background-color: #83A0FF;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: black;
}

#sidebar-left, #main, #sidebar-right {
	min-height: 600px
}

form {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 43%;
	border: 5px solid green;
}
/*assign full width inputs*/
input[type=text], input[type=password] {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid blue;
	box-sizing: border-box;
}
/*set a style for the buttons*/
button {
	background-color: #CF5BE1;
	color: white;
	
	padding: 10px 18px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 10%;
}
/* set a hover effect for the button*/
button:hover {
	opacity: 0.8;
}
/*set extra style for the cancel button*/
.cancelbtn {
	width: 10%;
	padding: 10px 18px;
	background-color: #A9531A;
}


.pos{

position: absolute;
	left: 300px;
	top: 120px;
}

  
  
 



</style>
</head>
<body>
<div id="header"><font color="white">Employee Dept App</font></div>
		<div id="sidebar-left"></div>
		<div id="main">
		
		<div align="center">

 
	<h3>Login Page</h3></div>
	
	<form method="post" action="usercheck">
	<div align="center"><h4><font color="red">${SPRING_SECURITY_LAST_EXCEPTION.message}</font></h4></div>
	<c:remove var="message" scope="session" />
		<div class="container">
			<label><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="userName" required> <br>

			<label><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required> <br>
		
		
			<button type="submit">Login</button>
			<button type="reset" class="cancelbtn">Cancel</button>


</div>
	

	</form>
	
</div>	
		
		
		
		
		
		
		</div>
		<div id="sidebar-right"></div>
		<div id="footer"><font color="white">Employee Department App :)</font></div>



</body>
</html>