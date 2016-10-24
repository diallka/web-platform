
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
		<h3><center>${titre}</center></h3>
		 <form:form modelAttribute="wrap">
            Nom: <form:input path="lastName" ></form:input>
                <br/>
                Prenom: <form:input path="firstName"></form:input>
               
            <input type="submit" value="ajouter"/>
        </form:form>
	</div>
</body>
</html>