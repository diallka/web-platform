<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc�s refus�</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>


	<!-- Indicates a dangerous or potentially negative action -->
	<button type="button" class="btn btn-danger col-md-offset-5">
		<strong>${user}</strong>, vous n'etes pas autoris� � acc�der � cette page page. <br /> 
		<a href="<c:url value="/" />">Retourner � l'accueil</a> <br /> 
		<a href="<c:url value="/logout" />">Se d�connecter</a> <br />
	</button>

</body>
</html>