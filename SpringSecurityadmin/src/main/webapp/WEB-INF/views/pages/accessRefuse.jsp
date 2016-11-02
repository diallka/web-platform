<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Accès refusé</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
Test
	Dear <strong>${user}</strong>, Vous n'etes pas autorisé à accéder à cette page page.
	<br/>
	<a href="<c:url value="/accueil" />">Retourner à l'accueil</a>
	<br/>
	<a href="<c:url value="/logout" />">Se déconnecter</a>
</body>
</html>