<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin page</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="success">
		<div style="float: right">
			<a href="<c:url value="/logout" />">Déconnexion</a>
		</div>
		Bonjour <strong>${user}</strong>, Bienvenue dans la page
		d'administration. <br /> <a href="<c:url value='/newuser' />">Ajouter
			utilisateurs</a> <br />


		<h2>Liste des Utilisateurs inscrits.</h2>
		<table class="tg">
			<tr>
				<th width="80">ID</th>
				<th width="120">NOM</th>
				<th width="120">PRENOM</th>
				<th width="120">AGE</th>
				<th width="120">EMAIL</th>
				<th width="120">PAYS</th>
				<th width="120">LATITUDE</th>
				<th width="120">LONGITUDE</th>
			</tr>
			<c:forEach items="${listUsers}" var="user">
				<tr>
					<td>${user.id}</td>
					<td>${user.lastName}</td>
					<td>${user.firstName}</td>
					<td>${user.age}</td>
					<td>${user.email}</td>
					<td>${user.country}</td>
					<td>${user.latitude}</td>
					<td>${user.longitude}</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>