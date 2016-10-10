<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Bienvenue</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="success">
	<div style="float:right">
		<a href="<c:url value="/espace_perso_utilisateur" />">- Espace utilisateur</a>
		<br/>
		<a href="<c:url value="/admin" />">- Espace administrateur</a>
	</div>
		<h3><center>Bienvenue, Site qui est en cours de construction... Merci</center></h3>
	</div>
</body>
</html>