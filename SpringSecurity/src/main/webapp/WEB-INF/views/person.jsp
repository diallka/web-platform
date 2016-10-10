<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Person Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>

<h3>
	AJOUTER DES PERSONNES
</h3>

<c:url var="addAction" value="/person/add" ></c:url>

<form:form action="${addAction}" commandName="person">
<table>
	<c:if test="${!empty person.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name">
				<spring:message text="Nom"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="age">
				<spring:message text="Age"/>
			</form:label>
		</td>
		<td>
			<!-- On peut utiliser la balise input de Spring mais n'accepte pas de valeur numérique -->
			<input type="number" name="age"/>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="country">
				<spring:message text="Pays"/>
			</form:label>
		</td>
		<td>
			<form:input path="country" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty person.name}">
				<input type="submit"
					value="<spring:message text="Modifier"/>" />
			</c:if>
			<c:if test="${empty person.name}">
				<input type="submit"
					value="<spring:message text="Ajouter"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>
	LISTE DES PERSONNES
</h3>
<c:if test="${!empty listPersons}">
	<table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">NOM</th>
		<th width="120">AGE</th>
		<th width="120">PAYS</th>
		<th width="60">MODIFIER</th>
		<th width="60">SUPPRIMER</th>
	</tr>
	<c:forEach items="${listPersons}" var="person">
		<tr>
			<td>${person.id}</td>
			<td>${person.name}</td>
			<td>${person.age}</td>
			<td>${person.country}</td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Editer</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Effacer</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>

</body>
</html>
