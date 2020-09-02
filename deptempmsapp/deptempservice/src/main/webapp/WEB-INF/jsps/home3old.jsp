<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dept Emp App</title>
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
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 85%;
	background-color: lightgray;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: black;
}

#sidebar-left, #main {
	min-height: 600px
}

input[type=text], input[type=date] {
	border: 1px solid black;
	background-color: lightgrey;
}

t {
	text-align: left;
}

.pl {
	float: right;
	text-align: right;
}

.p2 {
	float: left;
	text-align: left;
}

table.d, td {
	table-layout: fixed;
	width: 95%;
	height: 80px;
	padding: 16px;
}

table.c, td {
	table-layout: auto;
	width: 95%;
	height: 50px;
}

.pos_right {
	float: left;
	padding: 15px;
	background-color: green;
	margin-left: 25px;
}

.pos_left {
/* 	float: right;
	padding: 15px;
	background-color: green;
	margin-right: 25px; */ 
	
	float: right;
    padding: 8px;
    background-color: green;
    margin-right: 25px;
    margin-top: 8px;
}

ul {
  list-style-type: none;
 
}

li {
  float: left;
 
  margin-right:20px;
}

li a {
 
  padding: 8px;
  background-color: green;
}




</style>
</head>
<body>
	<%-- <%
		if (session.getAttribute("unam") == null) {
			response.sendRedirect("logout");
		}
	%> --%>
	<div class="container6">
		<div id="header">
			
				
			
			<font color="white">Dept Emp App</font>
			<div class="pos_left">
				<a href="logout"><font color="white">Logout</font></a>
			</div>
			<ul>
			<li>	<a href="homeserv"><font color="white">Home</font></a></li>
			
			<li><a href="admintab"><font color="white">Admin</font></a>
			<li><a href="hrtab"><font color="white">HR</font></a></li>
			</ul>
		</div>
		<div id="sidebar-left">
		<c:if test="${hrtag ne 'Hrtag'}">
<c:if test="${adtag ne 'admintag' }">
			<form action="home">
				<br> &nbsp <input type="submit" value="+"> Department
			</form>

			<c:if test="${hom eq 'homep'}">
				<c:forEach var="dept" items="${lis}">
					<c:if test="${not empty dept}">

						<input type="hidden" name="deptId" value="${dept.deptId}">

						<br>
				&nbsp <a href="homeserv"><b>=></b></a>&nbsp <button type="button"
							class="btn btn-success" style="width: 100px;">
							<a href="listEmp?deptId=${dept.deptId}"><font color="white">${dept.deptName}
							</font></a>
						</button>
						<br>

					</c:if>
				</c:forEach>

			</c:if></c:if>
			
			<c:if test="${adtag eq 'admintag' }">
			
			
			<br>
			<ul >
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:yellow">Link 1</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:yellow">Link 2</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:yellow">Link 3</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:yellow">Link 4</a></li>
			
			
			</ul>
			
			
			
			
			
			
			</c:if></c:if>
		
			<c:if test="${hrtag eq 'Hrtag'}">
			<br>
			<ul >
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:pink">Link 1</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:pink">Link 2</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:pink">Link 3</a></li>
			<li style="float:left;margin-right:30px;padding:15px;"><a href="#" style="background-color:pink">Link 4</a></li>
			
			
			</ul>
			
			</c:if>

		</div>

		<div id="main">
<c:if test="${hrtag eq 'Hrtag'}">

Hi  HR Welcome to this Page
</c:if>


<c:if test="${adtag eq 'admintag' }">

Hi Admin Welcome to this page
</c:if>

			<c:if test="${hoser eq 'hseval'}">


				<br>
				<br>
				<div align="center">



					<form:form action="savedept" method="post"
						modelAttribute="deptpage">




						<table class="d" border="1px solid black" align="center">

							<tr>
								<th colspan="2.5" style="text-align: center"><font
									color="green">Department Table</font></th>
								<th colspan="3" style="text-align: center"><a
									href="regDept">Add new department</a></th>


							</tr>

							<tr>

								<th style="text-align: center"><font color="#EE8742">Dept
										Id</font></th>
								<th style="text-align: center"><font color="#EE8742">Dept
										Name</font></th>
								<th style="text-align: center"><font color="#EE8742">Dept
										Location</font></th>
								<th style="text-align: center"><font color="#EE8742">Edit</font></th>
								<th style="text-align: center"><font color="#EE8742">Delete</font></th>

							</tr>

							<c:forEach items="${deptlv}" var="dval">
							<form:form action="updatedept/${dval.deptId}" method="get" modelAttribute="deptpage">
								<c:if test="${deptva eq dval.deptId}">
									
										
										<tr>
											<td>${dval.deptId}<%-- <form:input path="deptId" type="" value="${dval.deptId}"
													disabled="true" style="background-color: lightgrey;" /> --%></td>
											<td><form:input path="deptName" value="${dval.deptName}" readonly="true"/></td>
											<td><form:input path="deptLoc" value="${dval.deptLoc}" /></td>
											<td>
												<button type="submit" class="btn btn-primary">update
												</button>
											</td>
											<td><button type="button" class="btn btn-warning">
													<a href="homeserv">Cancel</a>
												</button></td>
										</tr>
									
								</c:if></form:form>
								<c:if test="${deptva ne dval.deptId}">
									<tr>
										<td style="vertical-align: top">${dval.deptId}</td>
										<td style="vertical-align: top">${dval.deptName}</td>
										<td style="vertical-align: top">${dval.deptLoc}</td>
										<td style="vertical-align: top"><a
											href="editdepartment?depId=${dval.deptId}"><img src="editimg.jpg" width="25" height="25" align="middle"></a></td>
										<td style="vertical-align: top"><a
											href="deledept?deptId=${dval.deptId}"><img src="delete.jpg" width="25" height="25" align="middle"></a></td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${adddept eq 'regdept'}">

								<tr>
									<td><form:input type="hidden" path="deptId" /></td>
									<td><form:input path="deptName" placeholder="Enter DeptName" required="required"  /></td>
									<td><form:input path="deptLoc" placeholder="Enter DeptLoc" required="required" 
											 /></td>
									<td>



										<button type="submit" class="btn btn-info">save</button>


									</td>
									<td><button type="button" class="btn btn-warning">
											<a href="homeserv">cancel</a>
										</button></td>
								</tr>
							</c:if>
						</table>
					</form:form>

				</div>


			</c:if>
			<c:if test="${hom eq 'homep'}">

				<br>
				<div align="center">
					<c:if test="${empty val}">
						<c:if test="${newtab eq 'ntabl'}">
							<form:form action="saveemployee" method="post"
								modelAttribute="emppage">
								<table class="c" border="1px solid black">

									<tr>
										<th colspan="5" style="text-align: center"><font
											color="green">Employee Table</font></b></th>
										<th colspan="5" style="text-align: center"><a
											href="addemployee">Add new Employee</a></th>


									</tr>

									<tr>
										<th style="text-align: center;"><font color="#AB2F9A">EmpId</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Emp
												Name</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">DateOfBirth</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Mail
												Id</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">DeptName</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Mobile
												Number</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Salary</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Company
												Name</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Edit</font></th>
										<th style="text-align: center;"><font color="#AB2F9A">Delete</font></th>
									</tr>
									<tr>
										<td><input  type="hidden" name="empId" size="3" /></td>



										<td><form:input path="empName" size="9" required="required" /></td>



										<td><form:input path="dateOfBirth"  type="date" size="5" required="required" /></td>
										<td><form:input path="mailId" size="16" required="required" /></td>
										<td><select name="deptEmpNa" required="required">


												<c:forEach items="${lis}" var="depnt">

													<option>${depnt.deptName}</option>


												</c:forEach>
										</select></td>
										<td><form:input path="mobileNo" size="5" required="required" /></td>
										<td><form:input path="salary" size="5" required="required" /></td>

										<td><form:input path="companyName" size="5" required="required" /></td>

										<td><div align="center">
												<button type="submit" class="btn btn-info">Save</button>
											</div></td>
										<td><button type="submit" class="btn btn-warning">
												<a href="listEmp?deptId=${depIdx}">Back</a>
											</button></td>
									</tr>


								</table>
							</form:form>


						</c:if>

						<c:if test="${newtab ne 'ntabl'}">
							<div align="center">


								<h4>
									No Employee Table Associated with This Department Kindly <a
										href="addemployee?empId=0">Add Employee</a> to this.
								</h4>
							</div>
						</c:if>
					</c:if>
				</div>




				<div align="center">
<c:if test="${not empty val }">

					





						<table class="c" border="1px solid black">

							<tr>
								<th colspan="5" style="text-align: center"><font
									color="green">Employee Table</font></th>
								<th colspan="5" style="text-align: center"><a
									href="addemployee">Add new Employee</a></th>


							</tr>
							<tr>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">EmpId</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Emp Name</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Date Of Birth</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Mail Id</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Dept Name</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Mobile Number</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Salary</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Company Name</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Edit</font></th>
								<th style="vertical-align: top; text-align: center;"><font
									color="#AB2F9A">Delete</font></th>
							</tr>
							
							<c:forEach var="emp" items="${val}">
							
								<c:if test="${mainemps eq 'checktableedit'}">
								
									<c:if test="${empl eq emp.empId}">
										
											<form:form action="updateemployee/${emp.empId}" method="get" modelAttribute="emppage">
											<tr>
												<td style="width: 70px;">${emp.empId}<%-- <input type="" name="empId"
													value="${emp.empId}" size="3" disabled="true"
													style="background-color: lightgrey;" /> --%></td>

												<td style="width: 350px;"><form:input path="empName"
														value="${emp.empName}" size="10" /></td>

												<td style="width: 300px;"><form:input path="dateOfBirth"
														type="date" value="${emp.dateOfBirth}" maxlength="4" /></td>
												<td style="width: 250px;border: none"><input type="" name="mailId"
													value="${emp.mailId}" size="19" readonly
													style="background-color: lightgrey;"></td>
												<td style="width: 290px;"><select name="deptEmpName"
													style="max-width: 100%;">
														<option>${deptName}</option>

														<c:forEach items="${lis}" var="depnt">
															<c:if test="${deptName ne depnt.deptName}">
																<option>${depnt.deptName}</option>
															</c:if>


														</c:forEach>
												</select></td>
												<td style="width: 280px;"><form:input path="mobileNo"
														value="${emp.mobileNo}" size="6" /></td>
												<td style="width: 280px;"><form:input path="salary"
														value="${emp.salary}" size="6" /></td>

												<td style="width: 250px;"><form:input
														path="companyName" value="${emp.companyName}" size="6" /></td>

												<td style="width: 70px;">
													<button type="submit" class="btn btn-primary"
														style="width: 60px;">Update</button>
												</td>
												<td style="width: 70px;"><button type="submit"
														class="btn btn-warning" style="width: 50px;">
														<a href="listEmp?deptId=${emp.deptEmpFk}">Back</a>
													</button></td>


											</tr>
										</form:form>

									</c:if>
								</c:if>

								<c:if test="${empl ne emp.empId}">
									<tr>
										<td style="text-align: center; width: 100px;">${emp.empId}</td>
										<td style="width: 300px;">${emp.empName}</td>
										<td style="width: 900px;">${emp.dateOfBirth}</td>
										<td style="width: 500px;">${emp.mailId}</td>
										<c:forEach items="${lis}" var="dtn">
											<c:if test="${emp.deptEmpFk eq dtn.deptId}">
												<td style="width: 500px;">${dtn.deptName}</td>
											</c:if>
										</c:forEach>
										<td style="width: 500px;">${emp.mobileNo}</td>
										<td style="width: 500px;">${emp.salary}</td>
										<td style="width: 500px;">${emp.companyName}</td>


										<td style="width: 500px;"><a
											href="editemployee?empId=${emp.empId}&deptId=${emp.deptEmpFk}"><img src="editimg.jpg" width="25" height="25" align="middle"></a></td>
										<td style="width: 500px;"><a
											href="deleteemployee/${emp.empId}/${emp.deptEmpFk}"><img src="delete.jpg" width="25" height="25" align="middle"></a></td>
									</tr>
								</c:if>
							</c:forEach>
							
							<form:form action="saveemployee" method="post"
						modelAttribute="emppage">
							<c:if test="${valcheck eq 'regemployee'}">
								<tr>
									<td><input type="hidden" name="empId" value=0 size="3" /></td>



									<td><form:input path="empName" size="9" required="required" /></td>



									<td><form:input path="dateOfBirth" type="date" size="5" required="required" /></td>
									<td><form:input path="mailId" size="16" required="required" /></td>
									<td><select name="deptEmpNa" required="required">


											<c:forEach items="${lis}" var="depnt">

												<option>${depnt.deptName}</option>


											</c:forEach>
									</select></td>
									<td><form:input path="mobileNo" size="5" required="required" /></td>
									<td><form:input path= "salary" size="5" required="required" /></td>

									<td><form:input path="companyName" size="5" required="required" /></td>

									<td><div align="center">
											<button type="submit" class="btn btn-info">Save</button>
										</div></td>
									<td><button type="submit" class="btn btn-warning">
											<a href="listEmp?deptId=${depId}">Back</a>
										</button></td>
								</tr>
							</c:if>
</form:form>

						</table>
					</c:if>
				</div>





			</c:if>




		</div>






		<c:if test="${not empty deleteDoneDept}">
			<script>
				alert("Department deleted");
			</script>
			<c:remove var="deleteDoneDept" scope="session" />
		</c:if>
		<c:if test="${not empty EditDept}">
			<script>
				alert("Department Details Updated");
			</script>
			<c:remove var="EditDept" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneEmp}">
			<script>
				alert("Employee Added");
			</script>
			<c:remove var="submitDoneEmp" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneDept}">
			<script>
				alert("Department Added");
			</script>
			<c:remove var="submitDoneDept" scope="session" />
		</c:if>

		<c:if test="${not empty deleteDone}">
			<script>
				alert("Employee deleted");
			</script>
			<c:remove var="deleteDone" scope="session" />
		</c:if>
		<c:if test="${not empty submitDone}">
			<script>
				alert("Employee Details Updated");
			</script>
			<c:remove var="submitDone" scope="session" />
		</c:if>


	</div>


	<div id="footer"><font color="white">Department Employee Application :)</font></div>
	</div>
</body>
</html>




































<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dept Emp App</title>
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
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 85%;
	background-color: lightgray;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: black;
}

#sidebar-left, #main {
	min-height: 600px
}

input[type=text], input[type=date] {
	border: 1px solid black;
	background-color: lightgrey;
}

.container {
	position: absolute;
	top: 200px;
	right: 350px;
	margin: 20px;
	max-width: 500px;
	padding: 16px;
	background-color: white;
}

.container2 {
	position: absolute;
	top: 170px;
	right: 150px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

.container3 {
	position: absolute;
	top: 400px;
	right: 550px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container4 {
	position: absolute;
	top: 420px;
	right: 350px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container5 {
	position: absolute;
	top: 180px;
	right: 250px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

.container6 {
	width: 100%;
	height: 100%;
}

t {
	text-align: left;
}

.pl {
	float: right;
	text-align: right;
}

.p2 {
	float: left;
	text-align: left;
}

table.d, td {
	table-layout: fixed;
	width: 95%;
	height: 80px;
	padding: 16px;
}

table.c, td {
	table-layout: auto;
	width: 95%;
	height: 50px;
	
}

.pos_right {
  position: relative;
  top:15px;
  right: 600px;
 
}

.pos_left
{
position: relative;
  top:-18px;
  left: 600px;
}


</style>
</head>
<body>
	<%
		if (session.getAttribute("unam") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="container6">
		<div id="header">
			<div class="pos_right">
				<a href="homeserv" ><font color="white">Home</font></a>
			</div>
			<font color="white">Dept Emp App</font>
			<div class="pos_left">
				<a href="logout"><font color="white">Logout</font></a>
			</div>
		</div>
		<div id="sidebar-left">

			<form action="home">
				<br> &nbsp <input type="submit" value="+"> Department
			</form>

			<c:if test="${hom eq 'homep'}">
				<c:forEach var="dept" items="${lis}">
					<c:if test="${not empty dept}">

						<input type="hidden" name="deptId" value="${dept.deptId}">

						<br>
				&nbsp <a href="homeserv"><b>=></b></a>&nbsp <button type="button"
							class="btn btn-success" style="width:150px;">
							<a href="listEmp?deptId=${dept.deptId}"><font color="white">${dept.deptName}
							</font></a>
						</button>
						<br>

					</c:if>
				</c:forEach>

			</c:if>

		</div>

		<div id="main">


			<c:if test="${hoser eq 'hseval'}">

				
				<br>
				<br>
				<div align="center">
					<c:if test="${deptva.deptName != null}">
						<form action="updatedept" method="post">
					</c:if>
					<c:if test="${deptva.deptName == null}">
						<form action="savedept" method="post">
					</c:if>



					<table class="d" border="1px solid black" align="center">

						<tr>
							<th colspan="2.5" style="text-align: center"><font
								color="green">Department Table</font></th>
							<th colspan="3" style="text-align: center"><a href="regDept">Add
									new department</a></th>


						</tr>

						<tr>

							<th style="text-align: center"><font color="#EE8742">Dept
									Id</font></th>
							<th style="text-align: center"><font color="#EE8742">Dept
									Name</font></th>
							<th style="text-align: center"><font color="#EE8742">Dept
									Location</font></th>
							<th style="text-align: center"><font color="#EE8742">Edit</font></th>
							<th style="text-align: center"><font color="#EE8742">Delete</font></th>

						</tr>

						<c:forEach items="${deptlv}" var="dval">
							<c:if test="${deptva.deptId eq dval.deptId}">

								<tr>
									<td><input type="" name="deptId" value="${deptva.deptId}"
										disabled style="background-color: lightgrey;" /></td>
									<td><input type="text" name="deptName"
										value="${deptva.deptName}"></td>
									<td><input type="text" name="deptLoc"
										value="${deptva.deptLoc}"></td>
									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-primary">update
												dept</button>
										</div></td>
								</tr>
							</c:if>
							<c:if test="${deptva.deptId ne dval.deptId}">
								<tr>
									<td style="vertical-align: top">${dval.deptId}</td>
									<td style="vertical-align: top">${dval.deptName}</td>
									<td style="vertical-align: top">${dval.deptLoc}</td>
									<td style="vertical-align: top"><a
										href="editdepartment?depId=${dval.deptId}"><img src="/images/editimg.jpg"></a></td>
									<td style="vertical-align: top"><a
										href="deledept?deptId=${dval.deptId}"><img src="/images/delete.jpg"></a></td>
								</tr>
							</c:if>
						</c:forEach>
						<c:if test="${adddept eq 'regdept'}">

							<tr>
								<td><input type="hidden" name="deptId" /></td>
								<td><input type="text" name="deptName"
									placeholder="Enter DeptName" required /></td>
								<td><input type="text" name="deptLoc"
									placeholder="Enter DeptLoc" required /></td>
								<td colspan="2">


										<div align="center">
											<button type="submit" class="btn btn-info">save</button>
										</div>

									</td>
							</tr>
						</c:if>
					</table>
					</form>

				</div>

				
			</c:if>
			<c:if test="${hom eq 'homep'}">

				<br>
				<div align="center">
				<c:if test="${empty val}">
					<c:if test="${newtab eq 'ntabl'}">
						<form action="saveemployee" method="post">
							<table class="d" border="1px solid black" >

								<tr>
									<th colspan="5" style="text-align: center"><font color="green">Employee Table</font></b>
										</th>
									<th colspan="5" style="text-align: center"><a
										href="addemployee">Add new Employee</a></th>


								</tr>

								<tr>
									<th style="vertical-align: top">EmpId</th>
									<th style="vertical-align: top">Emp Name</th>
									<th style="vertical-align: top">DateOfBirth</th>
									<th style="vertical-align: top">Mail Id</th>
									<th style="vertical-align: top">DeptName</th>
									<th style="vertical-align: top">Mobile Number</th>
									<th style="vertical-align: top">Salary</th>
									<th style="vertical-align: top">Company Name</th>
									<th style="vertical-align: top">Edit</th>
									<th style="vertical-align: top">Delete</th>
								</tr>
								<tr>
									<td><input type="text" name="empId" size="5" disabled /></td>



									<td><input type="text" name="empName" size="5"></td>



									<td><input type="date" name="dob" maxlength="4"></td>
									<td><input type="text" name="mailId" size="5"></td>
									<td><select name="deptEmpNa" required>
											<option>select Deprtment Name</option>

											<c:forEach items="${lis}" var="depnt">

												<option>${depnt.deptName}</option>


											</c:forEach>
									</select></td>
									<td><input type="text" name="mobileNo" size="5"></td>
									<td><input type="text" name="salary" size="5"></td>

									<td><input type="text" name="companyName" size="5"></td>

									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-info">Add Employee</button>
										</div></td>
								</tr>



							</table>
						</form>


					</c:if>

					<c:if test="${newtab ne 'ntabl'}">
						<div align="center">


							<h4>
								No Employee Table Associated with This Department Kindly <a
									href="addemployee?empId=0">Add Employee</a> to this.
							</h4>
						</div>
					</c:if>
				</c:if></div>
				
				
				
				
			<div align="center">
				<c:if test="${not empty val }">

					<c:if test="${empl.empName != null}">
           <<form action="updateemployee" method="post">
					</c:if>
					<c:if test="${empl.empName == null}">
						<form action="saveemployee" method="post">
					</c:if>

					


						<table class="c" border="1px solid black">

							<tr>
								<th colspan="5" style="text-align: center"><font
									color="green">Employee Table</font></th>
								<th colspan="5" style="text-align: center"><a
									href="addemployee">Add new Employee</a></th>


							</tr>
							<tr>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">EmpId</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Emp Name</font></th>
								<th style="vertical-align: top;text-align: center ;" ><font color="#AB2F9A">Date Of Birth</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Mail Id</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Dept Name</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Mobile Number</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Salary</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Company Name</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Edit</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Delete</font></th>
							</tr>
							<c:forEach var="emp" items="${val}">
								<c:if test="${mainemps eq 'checktableedit'}">
									<c:if test="${empl.empId eq emp.empId}">
										<tr>
											<td style="vertical-align: top"><input type="text"
												name="empId" value="${empl.empId}" size="3" disabled /></td>

											<td style="vertical-align: top"><input type="text"
												name="empName" value="${empl.empName}" size="8"></td>

											<td><input type="date" name="dob"
												value="${empl.dateOfBirth}" maxlength="4"></td>
											<td><input type="text" name="mailId"
												value="${empl.mailId}" size="6" readonly></td>
											<td><select name="deptEmpName" style="max-width: 70%;">
													<option>${dfg.deptName}</option>

													<c:forEach items="${lis}" var="depnt">

														<option>${depnt.deptName}</option>


													</c:forEach>
											</select></td>
											<td><input type="text" name="mobileNo"
												value="${empl.mobileNo}" size="6"></td>
											<td><input type="text" name="salary"
												value="${empl.salary}" size="6"></td>

											<td><input type="text" name="companyName"
												value="${empl.companyName}" size="6"></td>

											<td colspan="2" style="text-align: center"><div align="center">
											<button type="submit" class="btn btn-primary">Update </button>
										</div></td>


										</tr>

									</c:if>
								</c:if>

								<c:if test="${empl.empId ne emp.empId}">
									<tr>
										<td style="text-align: center ;width:100px;">${emp.empId}</td>
										<td style="width:300px;">${emp.empName}</td>
										<td style="width:900px;">${emp.dateOfBirth}</td>
										<td style="width:500px;">${emp.mailId}</td>
										<c:forEach items="${lis}" var="dtn">
											<c:if test="${emp.department.deptId eq dtn.deptId}">
												<td style="width:500px;">${dtn.deptName}</td>
											</c:if>
										</c:forEach>
										<td style="width:500px;">${emp.mobileNo}</td>
										<td style="width:500px;">${emp.salary}</td>
										<td style="width:500px;"> ${emp.companyName}</td>


										<td style="width:500px;"><a
											href="editemployee?empId=${emp.empId}&deptId=${emp.department.deptId}"><img src="/images/editimg.jpg"></a></td>
										<td style="width:500px;"><a
											href="deleteemployee?empId=${emp.empId}&deptEmpId=${emp.department.deptId}"><img src="/images/delete.jpg"></a></td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${valcheck eq 'regemployee'}">
								<tr>
									<td><input type="hidden" name="empId" size="3" /></td>



									<td><input type="text" name="empName" size="5" required></td>



									<td><input type="date" name="dob" size="5" required></td>
									<td><input type="text" name="mailId" size="5" required></td>
									<td><select name="deptEmpNa" required>
											<option>select</option>

											<c:forEach items="${lis}" var="depnt">

												<option>${depnt.deptName}</option>


											</c:forEach>
									</select></td>
									<td><input type="text" name="mobileNo" size="5" required></td>
									<td><input type="text" name="salary" size="5" required></td>

									<td><input type="text" name="companyName" size="5" required></td>

									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-info">Add Employee</button>
										</div></td>
								</tr>
							</c:if>


						</table>
					</div>

					</form>

</c:if>
				</c:if>
				
			
			
			</div>






			<c:if test="${not empty deleteDoneDept}">
				<script>
					alert("Department deleted");
				</script>
				<c:remove var="deleteDoneDept" scope="session" />
			</c:if>
			<c:if test="${not empty EditDept}">
				<script>
					alert("Department Details Updated");
				</script>
				<c:remove var="EditDept" scope="session" />
			</c:if>

			<c:if test="${not empty submitDoneEmp}">
				<script>
					alert("Employee Added");
				</script>
				<c:remove var="submitDoneEmp" scope="session" />
			</c:if>

			<c:if test="${not empty submitDoneDept}">
				<script>
					alert("Department Added");
				</script>
				<c:remove var="submitDoneDept" scope="session" />
			</c:if>

			<c:if test="${not empty deleteDone}">
				<script>
					alert("Employee deleted");
				</script>
				<c:remove var="deleteDone" scope="session" />
			</c:if>
			<c:if test="${not empty submitDone}">
				<script>
					alert("Employee Details Updated");
				</script>
				<c:remove var="submitDone" scope="session" />
			</c:if>


		</div>


		<div id="footer">Department Employee Application :)</div>
	</div>
</body>
</html> --%>



<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.dptempapp" /></title>
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
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 85%;
	background-color: lightgray;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: black;
}

#sidebar-left, #main {
	min-height: 600px
}

input[type=text], input[type=date] {
	border: 1px solid black;
	background-color: lightgrey;
}

t {
	text-align: left;
}

.pl {
	float: right;
	text-align: right;
}

.p2 {
	float: left;
	text-align: left;
}

table.d, td {
	table-layout: fixed;
	width: 95%;
	height: 80px;
	padding: 16px;
}

table.c, td {
	table-layout: auto;
	width: 95%;
	height: 50px;
}

.pos_right {
	float: left;
	padding: 15px;
	background-color: green;
	margin-left: 25px;
}

.pos_del

{

position: absolute;

right:95px;
top:145px;

}

.pos_dele

{

position: absolute;

right:65px;
top:50px;

}

.pos_left {
	/* 	float: right;
	padding: 15px;
	background-color: green;
	margin-right: 25px; */
	float: right;
	padding: 8px;
	background-color: green;
	margin-right: 25px;
	margin-top: 9px;
}

.pos_leftt {
	float: right;
	padding: 8px;
	background-color: green;
	margin-right: 30px;
	margin-top: 9px;
}

.errors {
	color: red;
}

.pos_lefttr {
	float: right;
	padding: 8px;
	background-color: green;
	margin-right: 35px;
	margin-top: 9px;
}

.pos_lefttrr {
	float: right;
	padding: 8px;
	background-color: green;
	margin-right: 38px;
	margin-top: 9px;
}

ul {
	list-style-type: none;
}

li {
	float: left;
	margin-right: 20px;
}

li a {
	padding: 8px;
	background-color: green;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("unam") == null) {
			response.sendRedirect("logout");
		}
	%>
	<div class="container6">
		<div id="header">



			<font color="white"><spring:message code="lable.dptempapp" /></font>

			<div class="pos_leftt">
				<a href="logout"><font color="white"><spring:message
							code="lable.logout" /></font></a>
			</div>
			<div class="pos_lefttr">
				<a href="homeserv?lang=en"><font color="white">English</font></a>
			</div>
			<div class="pos_left">

				<a href="homeserv?lang=fr"><font color="white">French</font></a>
			</div>

			<ul>
				<c:if test="${loggedInUser eq 'admin'}">
					<li><a href="homeserv"><font color="white"><spring:message
									code="lable.admin" /></font></a></li>
				</c:if>
				<c:if test="${loggedInUser eq 'hr'}">
					<li><a href="homeserv"><font color="white"><spring:message
									code="lable.home" /></font></a>
					<li><a href="hrtab"><font color="white"><spring:message
									code="lable.hr" /></font></a></li>
				</c:if>
			</ul>
		</div>
		<div id="sidebar-left">
			<c:if test="${hrtag ne 'Hrtag'}">
				<c:if test="${adtag ne 'admintag' }">
					<form action="home">
						<br> &nbsp <input type="submit" value="+">
						<spring:message code="lable.department" />
					</form>

					<c:if test="${hom eq 'homep'}">
						<c:forEach var="dept" items="${lis}">
							<c:if test="${not empty dept}">

								<input type="hidden" name="deptId" value="${dept.deptId}">

								<br>
				&nbsp <a href="homeserv"><b>=></b></a>&nbsp <button type="button"
									class="btn btn-success" style="width: 100px;">
									<a href="listEmp?deptId=${dept.deptId}"><font color="white">${dept.deptName}
									</font></a>
								</button>
								<br>

							</c:if>
						</c:forEach>

					</c:if>
				</c:if>

				<c:if test="${adtag eq 'admintag' }">


					<br>
					<ul>
						<li style="float: left; margin-right: 30px; padding: 15px;"><a
							href="#" style="background-color: yellow">Link 1</a></li>
						<li style="float: left; margin-right: 30px; padding: 15px;"><a
							href="#" style="background-color: yellow">Link 2</a></li>
						<li style="float: left; margin-right: 30px; padding: 15px;"><a
							href="#" style="background-color: yellow">Link 3</a></li>
						<li style="float: left; margin-right: 30px; padding: 15px;"><a
							href="#" style="background-color: yellow">Link 4</a></li>


					</ul>






				</c:if>
			</c:if>

			<c:if test="${hrtag eq 'Hrtag'}">
				<br>
				<ul>
					<li style="float: left; margin-right: 30px; padding: 15px;"><a
						href="#" style="background-color: pink">Link 1</a></li>
					<li style="float: left; margin-right: 30px; padding: 15px;"><a
						href="#" style="background-color: pink">Link 2</a></li>
					<li style="float: left; margin-right: 30px; padding: 15px;"><a
						href="#" style="background-color: pink">Link 3</a></li>
					<li style="float: left; margin-right: 30px; padding: 15px;"><a
						href="#" style="background-color: pink">Link 4</a></li>


				</ul>

			</c:if>

		</div>
				<div id="main">
			<c:if test="${hrtag eq 'Hrtag'}">

				<spring:message code="lable.hrmess" />
			</c:if>


			<c:if test="${adtag eq 'admintag' }">

				<spring:message code="lable.admess" />
			</c:if>

			<c:if test="${hoser eq 'hseval'}">


				<br>
				<br>
				<div align="center">

					<c:if test="${empty deptlv}">



						<form:form action="savedept" method="post"
							modelAttribute="deptpage">


							<table class="d" border="1px solid black" align="center">

								<tr>
									<th colspan="2.5" style="text-align: center"><font
										color="green"><spring:message code="lable.deptable" /></font></th>
									<th colspan="2.5" style="text-align: center"><a
										href="regDept"><spring:message code="lable.adddept" /></a></th>


								</tr>

								<tr>

									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptId" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptName" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptLoc" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.edit" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.delete" /></font></th>

								</tr>
								<tr>
									<td><form:input type="hidden" path="deptId" /></td>
									<td><form:input path="deptName"
											placeholder="Enter DeptName" />
										<form:errors path="deptName" cssClass="errors" /></td>
									<td><form:input path="deptLoc" placeholder="Enter DeptLoc" />
										<form:errors path="deptLoc" cssClass="errors" /></td>
									<td>



										<button type="submit" class="btn btn-info">
											<spring:message code="lable.save" />
										</button>


									</td>
									<td><button type="button" class="btn btn-warning">
											<a href="homeserv"><spring:message code="lable.cancel" /></a>
										</button></td>
								</tr>
							</table>
						</form:form>

					</c:if>


					<c:if test="${not empty deptlv}">




						

							<table class="d" border="1px solid black" align="center">

								<tr>
									<th colspan="3" style="text-align: center"><font
										color="green"><spring:message code="lable.deptable" /></font></th>
									<th colspan="2.5" style="text-align: center"><a
										href="regDept"><spring:message code="lable.adddept" /></a></th>


								</tr>

								<tr>

									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptId" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptName" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptLoc" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.edit" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.delete" /></font></th>
	
								</tr>
								<tbody>
								<c:forEach items="${deptlv}" var="dval">
									<form:form  action="updatedept/${dval.deptId}" method="get"
										modelAttribute="deptpage">
										<c:if test="${deptva eq dval.deptId}">


											<tr>
												<td>${dval.deptId}</td>
												<td><form:input path="deptName"
														value="${dval.deptName}" readonly="true" /></td>
												<td><form:input path="deptLoc" value="${dval.deptLoc}" /></td>
												<td>
													<button type="submit" class="btn btn-primary" >
														<spring:message code="lable.update" />
													</button>
												</td>
												<td><button type="button" class="btn btn-warning">
														<a href="homeserv"><spring:message code="lable.cancel" /></a>
													</button></td>
											</tr>

										</c:if>
									</form:form>
		
									<c:if test="${deptva ne dval.deptId}">


										<tr>
											<td style="vertical-align: top">${dval.deptId}</td>
											<td style="vertical-align: top">${dval.deptName}</td>
											<td style="vertical-align: top">${dval.deptLoc}</td>
											<td style="vertical-align: top"><a
												href="editdepartment?depId=${dval.deptId}"><img
													src="editimg.jpg" width="25" height="25" align="middle"></a></td>
											<td style="vertical-align: top"><a
											href="deledept?deptId=${dval.deptId}"><img src="delete.jpg" width="25" height="25" align="middle"></a></td>

											
										</tr>
									</c:if>
								</c:forEach>
</tbody>


<tbody>
								<c:if test="${adddept eq 'regdept'}">
									<form:form action="savedept" method="post"
										modelAttribute="deptpage">
										<tr>
										
											<td><form:input type="hidden" path="deptId" /></td>
											<td><form:input path="deptName"
													placeholder="Enter DeptName" />
												<form:errors path="deptName" cssClass="errors" /></td>
											<td><form:input path="deptLoc"
													placeholder="Enter DeptLoc" />
												<form:errors path="deptLoc" cssClass="errors" /></td>
											<td>



												<button type="submit" class="btn btn-info">
													<spring:message code="lable.save" />
												</button>


											</td>
											<td><button type="button" class="btn btn-warning">
													<a href="homeserv"><spring:message code="lable.cancel" /></a>
												</button></td>
										</tr>
									</form:form>
								</c:if></tbody>
							</table>
							
					
					</c:if>
					<c:if test="${deptlv.size() > 0 }">
					<div class="panel-footer">
             Showing ${number+1} of ${size+1} of ${totalElements}
            <ul class="pagination">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li class="page-item">
                        <a href="homeserv?page=${page}&size=${size}" class="page-link">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div></c:if>
					<div id="pagination">

						<c:url value="/homeserv" var="prev">
							<c:param name="page" value="${page-1}" />
						</c:url>
						<c:if test="${page > 1}">
							<a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
						</c:if>

						<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
							<c:choose>
								<c:when test="${page == i.index}">
									<span>${i.index}</span>
								</c:when>
								<c:otherwise>
									<c:url value="/homeserv" var="url">
										<c:param name="page" value="${i.index}" />
									</c:url>
									<a href='<c:out value="${url}" />'>${i.index}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:url value="/homeserv" var="next">
							<c:param name="page" value="${page + 1}" />
						</c:url>
						<c:if test="${page + 1 <= maxPages}">
							<a href='<c:out value="${next}" />' class="pn next">Next</a>
						</c:if>
					</div>


				</div>


			</c:if>
			<c:if test="${hom eq 'homep'}">

				<br>
				<div align="center">
					<c:if test="${empty val}">
						<c:if test="${newtab eq 'ntabl'}">
							<form:form action="saveemployee" method="post"
								modelAttribute="emppage">
								<table class="c" border="1px solid black">

									<tr>
										<th colspan="5" style="text-align: center"><font
											color="green"><spring:message code="lable.emptab" /></font></th>
										<th colspan="5" style="text-align: center"><a
											href="addemployee"><spring:message code="lable.addnewemp" /></a></th>


									</tr>

									<tr>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.empId" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.empName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.dob" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.mailId" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.deptName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.mobileNo" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.salary" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.comName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.edit" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.delete" /></font></th>
									</tr>
									<tr>
										<td><input type="hidden" name="empId" value=1 size="3" /></td>



										<td><form:input path="empName" size="9" /> <form:errors path="empName" cssClass="errors" /> </td>



										<td><form:input path="dateOfBirth" type="date" size="5" />
											<form:errors path="dateOfBirth" cssClass="errors"  /></td>
										<td><form:input path="mailId" size="16" /> <form:errors
												path="mailId" cssClass="errors" /></td>
										<td><select name="deptEmpNa" required="required">


												<c:forEach items="${lis}" var="depnt">



													<option>${depnt.deptName}</option>

												</c:forEach>
										</select></td>
										<td><form:input path="mobileNo" size="5" /> <form:errors
												path="mobileNo" cssClass="errors" /></td>
										<td><form:input path="salary" size="5" /> <form:errors
												path="salary" cssClass="errors" /></td>

										<td><form:input path="companyName" size="5" /> <form:errors
												path="companyName" cssClass="errors" /></td>

										<td><div align="center">
												<button type="submit" class="btn btn-info">
													<spring:message code="lable.save" />
												</button>
											</div></td>
										<td><button type="submit" class="btn btn-warning">
												<a href="listEmp?deptId=${depIdx}"><spring:message
														code="lable.back" /></a>
											</button></td>
									</tr>


								</table>
							</form:form>


						</c:if>

						<c:if test="${newtab ne 'ntabl'}">
							<div align="center">


								<h4>
									<spring:message code="lable.description" />
									<a href="addemployee?empId=0"><spring:message
											code="lable.addemp" /></a>
									<spring:message code="lable.tothis" />
								</h4>
							</div>
						</c:if>
					</c:if>
				</div>




				<div align="center">
					<c:if test="${not empty val }">



						

							<table class="c" border="1px solid black">

								<tr>
									<th colspan="6" style="text-align: center"><font
										color="green"><spring:message code="lable.emptab" /></font></th>
									<th colspan="5" style="text-align: center"><a
										href="addemployee"><spring:message code="lable.addnewemp" /></a></th>


								</tr>
								<tr>
								
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.empId" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.empName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.dob" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.mailId" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.deptName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.mobileNo" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.salary" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.comName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.edit" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.delete" />

									</font></th>
								</tr>

								<c:forEach var="emp" items="${val}">
								
								<tbody>
									<form:form action="updateemployee/${emp.empId}" method="get"
												modelAttribute="emppage">
									<c:if test="${mainemps eq 'checktableedit'}">
									
									

										<c:if test="${empl eq emp.empId}">

											
												<tr>
												
													<td style="width: 70px;">${emp.empId}<input type="" name="empId"
													value="${emp.empId}" size="3" disabled="true"
													style="background-color: lightgrey;" /></td>

													<td style="width: 250px;"><form:input path="empName"
															value="${emp.empName}" size="10" /></td>

													<td style="width: 200px;"><form:input
															path="dateOfBirth" type="date" value="${emp.dateOfBirth}"
															maxlength="4" /></td>
													<td style="width: 250px; border: none"><input type=""
														name="mailId" value="${emp.mailId}" size="19" readonly
														style="background-color: lightgrey;"></td>
													<td style="width: 290px;"><select name="deptEmpName"
														style="max-width: 100%;">
															<option>${deptName}</option>

															<c:forEach items="${lis}" var="depnt">
																<c:if test="${deptName ne depnt.deptName}">
																	<option>${depnt.deptName}</option>
																</c:if>


															</c:forEach>
													</select></td>
													<td style="width: 280px;"><form:input path="mobileNo"
															value="${emp.mobileNo}" size="6" /></td>
													<td style="width: 280px;"><form:input path="salary"
															value="${emp.salary}" size="6" /></td>

													<td style="width: 250px;"><form:input
															path="companyName" value="${emp.companyName}" size="6" /></td>

													<td style="width: 70px;">
														<button type="submit" class="btn btn-primary"
															style="width: 60px;" >
															<spring:message code="lable.update" />
														</button>
													</td>
													<td style="width: 70px;"><button type="submit"
															class="btn btn-warning" style="width: 50px;">
															<a href="listEmp?deptId=${emp.department.deptId}"><spring:message
																	code="lable.back" /></a>
														</button></td>


												</tr>
											</c:if>
											

										
									</c:if>
									</form:form></tbody>
									<c:if test="${empl ne emp.empId}">
										<tr>
										
											<td style="text-align: center; width: 100px;">${emp.empId}</td>
											<td style="width: 300px;">${emp.empName}</td>
											<td style="width: 900px;">${emp.dateOfBirth}</td>
											<td style="width: 500px;">${emp.mailId}</td>
											<c:forEach items="${lis}" var="dtn">
												<c:if test="${emp.department.deptId eq dtn.deptId}">
													<td style="width: 500px;">${dtn.deptName}</td>
												</c:if>
											</c:forEach>
											<td style="width: 500px;">${emp.mobileNo}</td>
											<td style="width: 500px;">${emp.salary}</td>
											<td style="width: 500px;">${emp.companyName}</td>


											<td style="width: 500px;"><a
												href="editemployee?empId=${emp.empId}&deptId=${emp.department.deptId}"><img
													src="editimg.jpg" width="25" height="25" align="middle"  ></a></td>
											<td style="width: 500px;"><a
												href="deleteemployee?empId=${emp.empId}&deptId=${emp.department.deptId}"><img
													src="delete.jpg" width="25" height="25" align="middle"  ></a>
											
											
											<!-- <img
												src="delete.jpg" width="25" height="25" align="middle"> --></td>
										</tr>
									</c:if>	
									<c:forEach var="emp" items="${val}" begin="1" end="1" step="1">
									</c:forEach>
									
									</c:forEach>
									
									
									
									
								
								


<tbody>
								
									<c:if test="${valcheck eq 'regemployee'}">
										<form:form id = "emppageadd" action="saveemployee" method="post"
									modelAttribute="emppage">
										<tr>



											<td><input type="hidden" name="empId" value=1 size="3" /></td>



											<td><form:input path="empName" size="9" />
												<form:errors path="empName" cssClass="errors" /></td>



											<td><form:input path="dateOfBirth" type="date" size="5" />
												<form:errors path="dateOfBirth" cssClass="errors" /></td>
											<td><form:input path="mailId" size="16" />
												<form:errors path="mailId" cssClass="errors" /></td>
											<td><select name="deptEmpNa" required="required">


													<c:forEach items="${lis}" var="depnt">





														<option>${depnt.deptName}</option>



													</c:forEach>
											</select></td>
											<td><form:input path="mobileNo" size="5" />
												<form:errors path="mobileNo" cssClass="errors" /></td>
											<td><form:input path="salary" size="5" />
												<form:errors path="salary" cssClass="errors" /></td>

											<td><form:input path="companyName" size="5" />
												<form:errors path="companyName" cssClass="errors" /></td>

											<td><div align="center">
													<button type="submit" class="btn btn-info" form="emppageadd">
														<spring:message code="lable.save" />
													</button>
												</div></td>
											<td><button type="submit" class="btn btn-warning">
													<a href="listEmp?deptId=${depIdx}"><spring:message
															code="lable.back" /></a>
												</button></td>
										</tr></form:form></c:if>
									
								


</tbody>

							</table>


							


						
					</c:if>
				</div>





			</c:if>




		</div>






		<c:if test="${not empty deleteDoneDept}">
			<script>
				alert("Department deleted");
			</script>
			<c:remove var="deleteDoneDept" scope="session" />
		</c:if>
		<c:if test="${not empty EditDept}">
			<script>
				alert("Department Details Updated");
			</script>
			<c:remove var="EditDept" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneEmp}">
			<script>
				alert("Employee Added");
			</script>
			<c:remove var="submitDoneEmp" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneDept}">
			<script>
				alert("Department Added");
			</script>
			<c:remove var="submitDoneDept" scope="session" />
		</c:if>

		<c:if test="${not empty deleteDone}">
			<script>
				alert("Employee deleted");
			</script>
			<c:remove var="deleteDone" scope="session" />
		</c:if>
		<c:if test="${not empty submitDone}">
			<script>
				alert("Employee Details Updated");
			</script>
			<c:remove var="submitDone" scope="session" />
		</c:if>


	</div>


	<div id="footer">
		<font color="white"><spring:message code="lable.fdes" /> :)</font>
	</div>
	</div>
</body>
</html>

		<div id="main">
			<c:if test="${hrtag eq 'Hrtag'}">

				<spring:message code="lable.hrmess" />
			</c:if>


			<c:if test="${adtag eq 'admintag' }">

				<spring:message code="lable.admess" />
			</c:if>

			<c:if test="${hoser eq 'hseval'}">


				<br>
				<br>
				<div align="center">

					<c:if test="${empty deptlv}">



						<form:form action="savedept" method="post"
							modelAttribute="deptpage">


							<table class="d" border="1px solid black" align="center">

								<tr>
									<th colspan="2.5" style="text-align: center"><font
										color="green"><spring:message code="lable.deptable" /></font></th>
									<th colspan="3" style="text-align: center"><a
										href="regDept"><spring:message code="lable.adddept" /></a></th>


								</tr>

								<tr>

									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptId" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptName" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptLoc" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.edit" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.delete" /></font></th>

								</tr>
								<tr>
									<td><form:input type="hidden" path="deptId" /></td>
									<td><form:input path="deptName"
											placeholder="Enter DeptName" />
										<form:errors path="deptName" cssClass="errors" /></td>
									<td><form:input path="deptLoc" placeholder="Enter DeptLoc" />
										<form:errors path="deptLoc" cssClass="errors" /></td>
									<td>



										<button type="submit" class="btn btn-info">
											<spring:message code="lable.save" />
										</button>


									</td>
									<td><button type="button" class="btn btn-warning">
											<a href="homeserv"><spring:message code="lable.cancel" /></a>
										</button></td>
								</tr>
							</table>
						</form:form>

					</c:if>


					<c:if test="${not empty deptlv}">




						<form:form action="deledept" method="get"
							modelAttribute="deptpage">

							<table class="d" border="1px solid black" align="center">

								<tr>
									<th colspan="2.5" style="text-align: center"><font
										color="green"><spring:message code="lable.deptable" /></font></th>
									<th colspan="3" style="text-align: center"><a
										href="regDept"><spring:message code="lable.adddept" /></a></th>


								</tr>

								<tr>

									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptId" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptName" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.deptLoc" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.edit" /></font></th>
									<th style="text-align: center"><font color="#EE8742"><spring:message
												code="lable.delete" /></font></th>

								</tr>

								<c:forEach items="${deptlv}" var="dval">
									<form:form action="updatedept/${dval.deptId}" method="get"
										modelAttribute="deptpage">
										<c:if test="${deptva eq dval.deptId}">


											<tr>
												<td>${dval.deptId}<form:input path="deptId" type="" value="${dval.deptId}"
													disabled="true" style="background-color: lightgrey;" /></td>
												<td><form:input path="deptName"
														value="${dval.deptName}" readonly="true" /></td>
												<td><form:input path="deptLoc" value="${dval.deptLoc}" /></td>
												<td>
													<button type="submit" class="btn btn-primary">
														<spring:message code="lable.update" />
													</button>
												</td>
												<td><button type="button" class="btn btn-warning">
														<a href="homeserv"><spring:message code="lable.cancel" /></a>
													</button></td>
											</tr>

										</c:if>
									</form:form>
									<c:if test="${deptva ne dval.deptId}">


										<tr>
											<td style="vertical-align: top">${dval.deptId}</td>
											<td style="vertical-align: top">${dval.deptName}</td>
											<td style="vertical-align: top">${dval.deptLoc}</td>
											<td style="vertical-align: top"><a
												href="editdepartment?depId=${dval.deptId}"><img
													src="editimg.jpg" width="25" height="25" align="middle"></a></td>
											<td style="vertical-align: top"><a
											href="deledept?deptId=${dval.deptId}"><img src="delete.jpg" width="25" height="25" align="middle"></a></td>

											<td><input type="checkbox" name="ids"
												value="${dval.deptId}"></td>
										</tr>
									</c:if>
								</c:forEach>




								<c:if test="${adddept eq 'regdept'}">
									<form:form action="savedept" method="post"
										modelAttribute="deptpage">
										<tr>
											<td><form:input type="hidden" path="deptId" /></td>
											<td><form:input path="deptName"
													placeholder="Enter DeptName" />
												<form:errors path="deptName" cssClass="errors" /></td>
											<td><form:input path="deptLoc"
													placeholder="Enter DeptLoc" />
												<form:errors path="deptLoc" cssClass="errors" /></td>
											<td>



												<button type="submit" class="btn btn-info">
													<spring:message code="lable.save" />
												</button>


											</td>
											<td><button type="button" class="btn btn-warning">
													<a href="homeserv"><spring:message code="lable.cancel" /></a>
												</button></td>
										</tr>
									</form:form>
								</c:if>
							</table>
							<input type="submit" value="Delete">
						</form:form>
					</c:if>
					<c:if test="${deptlv.size() > 0 }">
					<div class="panel-footer">
             Showing ${number+1} of ${size+1} of ${totalElements}
            <ul class="pagination">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li class="page-item">
                        <a href="homeserv?page=${page}&size=${size}" class="page-link">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div></c:if>
					<div id="pagination">

						<c:url value="/homeserv" var="prev">
							<c:param name="page" value="${page-1}" />
						</c:url>
						<c:if test="${page > 1}">
							<a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
						</c:if>

						<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
							<c:choose>
								<c:when test="${page == i.index}">
									<span>${i.index}</span>
								</c:when>
								<c:otherwise>
									<c:url value="/homeserv" var="url">
										<c:param name="page" value="${i.index}" />
									</c:url>
									<a href='<c:out value="${url}" />'>${i.index}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:url value="/homeserv" var="next">
							<c:param name="page" value="${page + 1}" />
						</c:url>
						<c:if test="${page + 1 <= maxPages}">
							<a href='<c:out value="${next}" />' class="pn next">Next</a>
						</c:if>
					</div>


				</div>


			</c:if>
			<c:if test="${hom eq 'homep'}">

				<br>
				<div align="center">
					<c:if test="${empty val}">
						<c:if test="${newtab eq 'ntabl'}">
							<form:form action="saveemployee" method="get"
								modelAttribute="emppage">
								<table class="c" border="1px solid black">

									<tr>
										<th colspan="5" style="text-align: center"><font
											color="green"><spring:message code="lable.emptab" /></font></b></th>
										<th colspan="5" style="text-align: center"><a
											href="addemployee"><spring:message code="lable.addnewemp" /></a></th>


									</tr>

									<tr>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.empId" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.empName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.dob" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.mailId" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.deptName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.mobileNo" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.salary" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.comName" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.edit" /></font></th>
										<th style="text-align: center;"><font color="#AB2F9A"><spring:message
													code="lable.delete" /></font></th>
									</tr>
									<tr>
										<td><input type="hidden" name="empId" size="3" /></td>



										<td><form:input path="empName" size="9" /> <form:errors
												path="empName" cssClass="errors" /></td>



										<td><form:input path="dateOfBirth" type="date" size="5" />
											<form:errors path="dateOfBirth" cssClass="errors" /></td>
										<td><form:input path="mailId" size="16" /> <form:errors
												path="mailId" cssClass="errors" /></td>
										<td><select name="deptEmpNa" required="required">


												<c:forEach items="${lis}" var="depnt">



													<option>${depnt.deptName}</option>

												</c:forEach>
										</select></td>
										<td><form:input path="mobileNo" size="5" /> <form:errors
												path="mobileNo" cssClass="errors" /></td>
										<td><form:input path="salary" size="5" /> <form:errors
												path="salary" cssClass="errors" /></td>

										<td><form:input path="companyName" size="5" /> <form:errors
												path="companyName" cssClass="errors" /></td>

										<td><div align="center">
												<button type="submit" class="btn btn-info">
													<spring:message code="lable.save" />
												</button>
											</div></td>
										<td><button type="submit" class="btn btn-warning">
												<a href="listEmp?deptId=${depIdx}"><spring:message
														code="lable.back" /></a>
											</button></td>
									</tr>


								</table>
							</form:form>


						</c:if>

						<c:if test="${newtab ne 'ntabl'}">
							<div align="center">


								<h4>
									<spring:message code="lable.description" />
									<a href="addemployee?empId=0"><spring:message
											code="lable.addemp" /></a>
									<spring:message code="lable.tothis" />
								</h4>
							</div>
						</c:if>
					</c:if>
				</div>




				<div align="center">
					<c:if test="${not empty val }">



						<form:form action="deleteemployee" method="get"
							modelAttribute="emppage">



							<table class="c" border="1px solid black">

								<tr>
									<th colspan="5" style="text-align: center"><font
										color="green"><spring:message code="lable.emptab" /></font></th>
									<th colspan="5" style="text-align: center"><a
										href="addemployee"><spring:message code="lable.addnewemp" /></a></th>


								</tr>
								<tr>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.empId" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.empName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.dob" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.mailId" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.deptName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.mobileNo" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.salary" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.comName" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.edit" />

									</font></th>
									<th style="vertical-align: top; text-align: center;"><font
										color="#AB2F9A"> <spring:message code="lable.delete" />

									</font></th>
								</tr>

								<c:forEach var="emp" items="${val}">
									
									<c:if test="${mainemps eq 'checktableedit'}">
									
									<form:form action="updateemployee/${emp.empId}" method="get"
												modelAttribute="emppage">

										<c:if test="${empl eq emp.empId}">

											
												<tr>
													<td style="width: 70px;">${emp.empId}<input type="" name="empId"
													value="${emp.empId}" size="3" disabled="true"
													style="background-color: lightgrey;" /></td>

													<td style="width: 350px;"><form:input path="empName"
															value="${emp.empName}" size="10" /></td>

													<td style="width: 300px;"><form:input
															path="dateOfBirth" type="date" value="${emp.dateOfBirth}"
															maxlength="4" /></td>
													<td style="width: 250px; border: none"><input type=""
														name="mailId" value="${emp.mailId}" size="19" readonly
														style="background-color: lightgrey;"></td>
													<td style="width: 290px;"><select name="deptEmpName"
														style="max-width: 100%;">
															<option>${deptName}</option>

															<c:forEach items="${lis}" var="depnt">
																<c:if test="${deptName ne depnt.deptName}">
																	<option>${depnt.deptName}</option>
																</c:if>


															</c:forEach>
													</select></td>
													<td style="width: 280px;"><form:input path="mobileNo"
															value="${emp.mobileNo}" size="6" /></td>
													<td style="width: 280px;"><form:input path="salary"
															value="${emp.salary}" size="6" /></td>

													<td style="width: 250px;"><form:input
															path="companyName" value="${emp.companyName}" size="6" /></td>

													<td style="width: 70px;">
														<button type="submit" class="btn btn-primary"
															style="width: 60px;">
															<spring:message code="lable.update" />
														</button>
													</td>
													<td style="width: 70px;"><button type="submit"
															class="btn btn-warning" style="width: 50px;">
															<a href="listEmp?deptId=${emp.department.deptId}"><spring:message
																	code="lable.back" /></a>
														</button></td>


												</tr>
											</c:if>
											
</form:form>
										
									</c:if>

									<c:if test="${empl ne emp.empId}">
										<tr>
											<td style="text-align: center; width: 100px;">${emp.empId}</td>
											<td style="width: 300px;">${emp.empName}</td>
											<td style="width: 900px;">${emp.dateOfBirth}</td>
											<td style="width: 500px;">${emp.mailId}</td>
											<c:forEach items="${lis}" var="dtn">
												<c:if test="${emp.department.deptId eq dtn.deptId}">
													<td style="width: 500px;">${dtn.deptName}</td>
												</c:if>
											</c:forEach>
											<td style="width: 500px;">${emp.mobileNo}</td>
											<td style="width: 500px;">${emp.salary}</td>
											<td style="width: 500px;">${emp.companyName}</td>


											<td style="width: 500px;"><a
												href="editemployee?empId=${emp.empId}&deptId=${emp.department.deptId}"><img
													src="editimg.jpg" width="25" height="25" align="middle"></a></td>
											<td style="width: 500px;"><input type="checkbox"
												name="idsemp" value="${emp.empId},${emp.department.deptId}"><img
												src="delete.jpg" width="25" height="25" align="middle"></a></td>
										</tr>
									</c:if>
								</c:forEach>



								<form:form action="saveemployee" method="post"
									modelAttribute="emppage">
									<c:if test="${valcheck eq 'regemployee'}">
										
										<tr>



											<td><input type="hidden" name="empId" value=0 size="3" /></td>



											<td><form:input path="empName" size="9" />
												<form:errors path="empName" cssClass="errors" /></td>



											<td><form:input path="dateOfBirth" type="date" size="5" />
												<form:errors path="dateOfBirth" cssClass="errors" /></td>
											<td><form:input path="mailId" size="16" />
												<form:errors path="mailId" cssClass="errors" /></td>
											<td><select name="deptEmpNa" required="required">


													<c:forEach items="${lis}" var="depnt">





														<option>${depnt.deptName}</option>



													</c:forEach>
											</select></td>
											<td><form:input path="mobileNo" size="5" />
												<form:errors path="mobileNo" cssClass="errors" /></td>
											<td><form:input path="salary" size="5" />
												<form:errors path="salary" cssClass="errors" /></td>

											<td><form:input path="companyName" size="5" />
												<form:errors path="companyName" cssClass="errors" /></td>

											<td><div align="center">
													<button type="submit" class="btn btn-info">
														<spring:message code="lable.save" />
													</button>
												</div></td>
											<td><button type="submit" class="btn btn-warning">
													<a href="listEmp?deptId=${depIdx}"><spring:message
															code="lable.back" /></a>
												</button></td>
										</tr></c:if></form:form>
									
								




							</table>


							<button type="submit">Delete</button>


						</form:form>
					</c:if>
				</div>





			</c:if>




		</div>






		<c:if test="${not empty deleteDoneDept}">
			<script>
				alert("Department deleted");
			</script>
			<c:remove var="deleteDoneDept" scope="session" />
		</c:if>
		<c:if test="${not empty EditDept}">
			<script>
				alert("Department Details Updated");
			</script>
			<c:remove var="EditDept" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneEmp}">
			<script>
				alert("Employee Added");
			</script>
			<c:remove var="submitDoneEmp" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneDept}">
			<script>
				alert("Department Added");
			</script>
			<c:remove var="submitDoneDept" scope="session" />
		</c:if>

		<c:if test="${not empty deleteDone}">
			<script>
				alert("Employee deleted");
			</script>
			<c:remove var="deleteDone" scope="session" />
		</c:if>
		<c:if test="${not empty submitDone}">
			<script>
				alert("Employee Details Updated");
			</script>
			<c:remove var="submitDone" scope="session" />
		</c:if>


	</div>


	<div id="footer">
		<font color="white"><spring:message code="lable.fdes" /> :)</font>
	</div>
	</div>
</body>
</html>




































<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dept Emp App</title>
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
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 85%;
	background-color: lightgray;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: black;
}

#sidebar-left, #main {
	min-height: 600px
}

input[type=text], input[type=date] {
	border: 1px solid black;
	background-color: lightgrey;
}

.container {
	position: absolute;
	top: 200px;
	right: 350px;
	margin: 20px;
	max-width: 500px;
	padding: 16px;
	background-color: white;
}

.container2 {
	position: absolute;
	top: 170px;
	right: 150px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

.container3 {
	position: absolute;
	top: 400px;
	right: 550px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container4 {
	position: absolute;
	top: 420px;
	right: 350px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container5 {
	position: absolute;
	top: 180px;
	right: 250px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

.container6 {
	width: 100%;
	height: 100%;
}

t {
	text-align: left;
}

.pl {
	float: right;
	text-align: right;
}

.p2 {
	float: left;
	text-align: left;
}

table.d, td {
	table-layout: fixed;
	width: 95%;
	height: 80px;
	padding: 16px;
}

table.c, td {
	table-layout: auto;
	width: 95%;
	height: 50px;
	
}

.pos_right {
  position: relative;
  top:15px;
  right: 600px;
 
}

.pos_left
{
position: relative;
  top:-18px;
  left: 600px;
}


</style>
</head>
<body>
	<%
		if (session.getAttribute("unam") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="container6">
		<div id="header">
			<div class="pos_right">
				<a href="homeserv" ><font color="white">Home</font></a>
			</div>
			<font color="white">Dept Emp App</font>
			<div class="pos_left">
				<a href="logout"><font color="white">Logout</font></a>
			</div>
		</div>
		<div id="sidebar-left">

			<form action="home">
				<br> &nbsp <input type="submit" value="+"> Department
			</form>

			<c:if test="${hom eq 'homep'}">
				<c:forEach var="dept" items="${lis}">
					<c:if test="${not empty dept}">

						<input type="hidden" name="deptId" value="${dept.deptId}">

						<br>
				&nbsp <a href="homeserv"><b>=></b></a>&nbsp <button type="button"
							class="btn btn-success" style="width:150px;">
							<a href="listEmp?deptId=${dept.deptId}"><font color="white">${dept.deptName}
							</font></a>
						</button>
						<br>

					</c:if>
				</c:forEach>

			</c:if>

		</div>

		<div id="main">


			<c:if test="${hoser eq 'hseval'}">

				
				<br>
				<br>
				<div align="center">
					<c:if test="${deptva.deptName != null}">
						<form action="updatedept" method="post">
					</c:if>
					<c:if test="${deptva.deptName == null}">
						<form action="savedept" method="post">
					</c:if>



					<table class="d" border="1px solid black" align="center">

						<tr>
							<th colspan="2.5" style="text-align: center"><font
								color="green">Department Table</font></th>
							<th colspan="3" style="text-align: center"><a href="regDept">Add
									new department</a></th>


						</tr>

						<tr>

							<th style="text-align: center"><font color="#EE8742">Dept
									Id</font></th>
							<th style="text-align: center"><font color="#EE8742">Dept
									Name</font></th>
							<th style="text-align: center"><font color="#EE8742">Dept
									Location</font></th>
							<th style="text-align: center"><font color="#EE8742">Edit</font></th>
							<th style="text-align: center"><font color="#EE8742">Delete</font></th>

						</tr>

						<c:forEach items="${deptlv}" var="dval">
							<c:if test="${deptva.deptId eq dval.deptId}">

								<tr>
									<td><input type="" name="deptId" value="${deptva.deptId}"
										disabled style="background-color: lightgrey;" /></td>
									<td><input type="text" name="deptName"
										value="${deptva.deptName}"></td>
									<td><input type="text" name="deptLoc"
										value="${deptva.deptLoc}"></td>
									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-primary">update
												dept</button>
										</div></td>
								</tr>
							</c:if>
							<c:if test="${deptva.deptId ne dval.deptId}">
								<tr>
									<td style="vertical-align: top">${dval.deptId}</td>
									<td style="vertical-align: top">${dval.deptName}</td>
									<td style="vertical-align: top">${dval.deptLoc}</td>
									<td style="vertical-align: top"><a
										href="editdepartment?depId=${dval.deptId}"><img src="/images/editimg.jpg"></a></td>
									<td style="vertical-align: top"><a
										href="deledept?deptId=${dval.deptId}"><img src="/images/delete.jpg"></a></td>
								</tr>
							</c:if>
						</c:forEach>
						<c:if test="${adddept eq 'regdept'}">

							<tr>
								<td><input type="hidden" name="deptId" /></td>
								<td><input type="text" name="deptName"
									placeholder="Enter DeptName" required /></td>
								<td><input type="text" name="deptLoc"
									placeholder="Enter DeptLoc" required /></td>
								<td colspan="2">


										<div align="center">
											<button type="submit" class="btn btn-info">save</button>
										</div>

									</td>
							</tr>
						</c:if>
					</table>
					</form>

				</div>

				
			</c:if>
			<c:if test="${hom eq 'homep'}">

				<br>
				<div align="center">
				<c:if test="${empty val}">
					<c:if test="${newtab eq 'ntabl'}">
						<form action="saveemployee" method="post">
							<table class="d" border="1px solid black" >

								<tr>
									<th colspan="5" style="text-align: center"><font color="green">Employee Table</font></b>
										</th>
									<th colspan="5" style="text-align: center"><a
										href="addemployee">Add new Employee</a></th>


								</tr>

								<tr>
									<th style="vertical-align: top">EmpId</th>
									<th style="vertical-align: top">Emp Name</th>
									<th style="vertical-align: top">DateOfBirth</th>
									<th style="vertical-align: top">Mail Id</th>
									<th style="vertical-align: top">DeptName</th>
									<th style="vertical-align: top">Mobile Number</th>
									<th style="vertical-align: top">Salary</th>
									<th style="vertical-align: top">Company Name</th>
									<th style="vertical-align: top">Edit</th>
									<th style="vertical-align: top">Delete</th>
								</tr>
								<tr>
									<td><input type="text" name="empId" size="5" disabled /></td>



									<td><input type="text" name="empName" size="5"></td>



									<td><input type="date" name="dob" maxlength="4"></td>
									<td><input type="text" name="mailId" size="5"></td>
									<td><select name="deptEmpNa" required>
											<option>select Deprtment Name</option>

											<c:forEach items="${lis}" var="depnt">

												<option>${depnt.deptName}</option>


											</c:forEach>
									</select></td>
									<td><input type="text" name="mobileNo" size="5"></td>
									<td><input type="text" name="salary" size="5"></td>

									<td><input type="text" name="companyName" size="5"></td>

									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-info">Add Employee</button>
										</div></td>
								</tr>



							</table>
						</form>


					</c:if>

					<c:if test="${newtab ne 'ntabl'}">
						<div align="center">


							<h4>
								No Employee Table Associated with This Department Kindly <a
									href="addemployee?empId=0">Add Employee</a> to this.
							</h4>
						</div>
					</c:if>
				</c:if></div>
				
				
				
				
			<div align="center">
				<c:if test="${not empty val }">

					<c:if test="${empl.empName != null}">
           <<form action="updateemployee" method="post">
					</c:if>
					<c:if test="${empl.empName == null}">
						<form action="saveemployee" method="post">
					</c:if>

					


						<table class="c" border="1px solid black">

							<tr>
								<th colspan="5" style="text-align: center"><font
									color="green">Employee Table</font></th>
								<th colspan="5" style="text-align: center"><a
									href="addemployee">Add new Employee</a></th>


							</tr>
							<tr>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">EmpId</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Emp Name</font></th>
								<th style="vertical-align: top;text-align: center ;" ><font color="#AB2F9A">Date Of Birth</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Mail Id</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Dept Name</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Mobile Number</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Salary</font></th>
								<th style="vertical-align: top;text-align: center ;"><font color="#AB2F9A">Company Name</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Edit</font></th>
								<th style="vertical-align: top;text-align: center ; "><font color="#AB2F9A">Delete</font></th>
							</tr>
							<c:forEach var="emp" items="${val}">
								<c:if test="${mainemps eq 'checktableedit'}">
									<c:if test="${empl.empId eq emp.empId}">
										<tr>
											<td style="vertical-align: top"><input type="text"
												name="empId" value="${empl.empId}" size="3" disabled /></td>

											<td style="vertical-align: top"><input type="text"
												name="empName" value="${empl.empName}" size="8"></td>

											<td><input type="date" name="dob"
												value="${empl.dateOfBirth}" maxlength="4"></td>
											<td><input type="text" name="mailId"
												value="${empl.mailId}" size="6" readonly></td>
											<td><select name="deptEmpName" style="max-width: 70%;">
													<option>${dfg.deptName}</option>

													<c:forEach items="${lis}" var="depnt">

														<option>${depnt.deptName}</option>


													</c:forEach>
											</select></td>
											<td><input type="text" name="mobileNo"
												value="${empl.mobileNo}" size="6"></td>
											<td><input type="text" name="salary"
												value="${empl.salary}" size="6"></td>

											<td><input type="text" name="companyName"
												value="${empl.companyName}" size="6"></td>

											<td colspan="2" style="text-align: center"><div align="center">
											<button type="submit" class="btn btn-primary">Update </button>
										</div></td>


										</tr>

									</c:if>
								</c:if>

								<c:if test="${empl.empId ne emp.empId}">
									<tr>
										<td style="text-align: center ;width:100px;">${emp.empId}</td>
										<td style="width:300px;">${emp.empName}</td>
										<td style="width:900px;">${emp.dateOfBirth}</td>
										<td style="width:500px;">${emp.mailId}</td>
										<c:forEach items="${lis}" var="dtn">
											<c:if test="${emp.department.deptId eq dtn.deptId}">
												<td style="width:500px;">${dtn.deptName}</td>
											</c:if>
										</c:forEach>
										<td style="width:500px;">${emp.mobileNo}</td>
										<td style="width:500px;">${emp.salary}</td>
										<td style="width:500px;"> ${emp.companyName}</td>


										<td style="width:500px;"><a
											href="editemployee?empId=${emp.empId}&deptId=${emp.department.deptId}"><img src="/images/editimg.jpg"></a></td>
										<td style="width:500px;"><a
											href="deleteemployee?empId=${emp.empId}&deptEmpId=${emp.department.deptId}"><img src="/images/delete.jpg"></a></td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${valcheck eq 'regemployee'}">
								<tr>
									<td><input type="hidden" name="empId" size="3" /></td>



									<td><input type="text" name="empName" size="5" required></td>



									<td><input type="date" name="dob" size="5" required></td>
									<td><input type="text" name="mailId" size="5" required></td>
									<td><select name="deptEmpNa" required>
											<option>select</option>

											<c:forEach items="${lis}" var="depnt">

												<option>${depnt.deptName}</option>


											</c:forEach>
									</select></td>
									<td><input type="text" name="mobileNo" size="5" required></td>
									<td><input type="text" name="salary" size="5" required></td>

									<td><input type="text" name="companyName" size="5" required></td>

									<td colspan="2"><div align="center">
											<button type="submit" class="btn btn-info">Add Employee</button>
										</div></td>
								</tr>
							</c:if>


						</table>
					</div>

					</form>

</c:if>
				</c:if>
				
			
			
			</div>






			<c:if test="${not empty deleteDoneDept}">
				<script>
					alert("Department deleted");
				</script>
				<c:remove var="deleteDoneDept" scope="session" />
			</c:if>
			<c:if test="${not empty EditDept}">
				<script>
					alert("Department Details Updated");
				</script>
				<c:remove var="EditDept" scope="session" />
			</c:if>

			<c:if test="${not empty submitDoneEmp}">
				<script>
					alert("Employee Added");
				</script>
				<c:remove var="submitDoneEmp" scope="session" />
			</c:if>

			<c:if test="${not empty submitDoneDept}">
				<script>
					alert("Department Added");
				</script>
				<c:remove var="submitDoneDept" scope="session" />
			</c:if>

			<c:if test="${not empty deleteDone}">
				<script>
					alert("Employee deleted");
				</script>
				<c:remove var="deleteDone" scope="session" />
			</c:if>
			<c:if test="${not empty submitDone}">
				<script>
					alert("Employee Details Updated");
				</script>
				<c:remove var="submitDone" scope="session" />
			</c:if>


		</div>


		<div id="footer">Department Employee Application :)</div>
	</div>
</body>
</html> --%>