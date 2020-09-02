<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Hi Welcome to this page


<table border=1>
<tr><td>Dept Id</td><td>Dept Name</td><td>Dept Location</td>
<c:forEach items="${lisDept}" var="depts">
<tr><td>${depts.deptId}</td><td>${depts.deptName}<td>${depts.deptLoc}</td></tr>
</c:forEach>
</table>




</body>
</html>