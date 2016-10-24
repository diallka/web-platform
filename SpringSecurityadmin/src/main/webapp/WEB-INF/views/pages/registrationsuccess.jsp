<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Registration Form</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="success">
		Confirmation : ${success}
		<br>
		Voulez vous <a href="<c:url value='/newUser' />">ajouter</a> d'autres utilisateurs?
		<br/>
		Retourner à la <a href="<c:url value='/admin' />">page d'administration</a> ou <a href="<c:url value="/logout" />">se déconnecter</a>	
	</div>
	
</body>
</html>