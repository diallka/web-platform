<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
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
		<center>
			<h3>${titre}</h3>
			${date}
		</center>
		<c:forEach items="${wrap}" var="user">
			<ul>
				<li>
					<strong>${user.id}</strong> 
					${user.lastName} 
					${user.firstName} 
					<a href="<s:url value='/modifier/${user.id}'></s:url>">modifier</a>
				</li>
			</ul>

		</c:forEach>

	</div>
</body>
</html>