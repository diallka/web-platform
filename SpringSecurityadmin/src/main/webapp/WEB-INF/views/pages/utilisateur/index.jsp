<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page de contact</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
</head>
<body>

	<center>
		<h3>Page index contact...</h3>
		<br/>
		<!-- Inclure pade dynamique -->
		<jsp:include page="/WEB-INF/views/pages/utilisateur/modif.jsp" />
		<br />
		<!-- Inclure page static -->
		<%@include file="/WEB-INF/views/pages/utilisateur/modif.jsp"%>
	</center>
</body>
</html>