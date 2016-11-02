<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Bienvenue</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body>
<h1 style="color: aqua;"></h1>
	<div class="success">
		<a href="/user_dashboard" ><img src="<c:url value="/static/images/user.png"/>" /></a> <br/><br/>
		<a href="/admin_dashboard" ><img src="<c:url value="/static/images/admin.png"/>" /></a>  	
	</div>

</script>
</body>
</html>