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
		</div>
		<div>
			<%@ include file ="/WEB-INF/views/pages/newuser.jsp"%>
		</div>
		<div class="tab-container">
			<h3>Liste des Utilisateurs inscrits.</h3>
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NOM</th>
				<th width="120">PRENOM</th>
				<th width="120">AGE</th>
				<th width="120">EMAIL</th>
				<th width="120">PAYS</th>
			</tr>
			<c:forEach items="${listUsers}" var="user">
				<tr>
					<td>${user.id}</td>
					<td>${user.lastName}</td>
					<td>${user.firstName}</td>
					<td>${user.age}</td>
					<td>${user.email}</td>
					<td>${user.country}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div class="form-container">
 	
 	<h3>Ajout Nouvel Utilisateur via Ajax</h>
 	
	<form:form method="POST" modelAttribute="user" class="form-horizontal">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="lastName">Nom</label>
				<div class="col-md-7">
					<form:input type="text" path="lastName" id="lastName" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="lastName" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="firstName">Prénom</label>
				<div class="col-md-7">
					<form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="firstName" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="ssoId">Identifiant</label>
				<div class="col-md-7">
					<form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="ssoId" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="password">Mot de passe</label>
				<div class="col-md-7">
					<form:input type="password" path="password" id="password" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="password" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

	
		<!-- ********************************************************************************** -->
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="age">Age</label>
				<div class="col-md-7">
					<form:input type="number" path="age" id="age" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="age" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="country">Pays</label>
				<div class="col-md-7">
					<form:input type="text" path="country" id="country" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="country" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="latitude">Latitude</label>
				<div class="col-md-7">
					<form:input type="number" value="50.593643" path="latitude" id="latitude" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="latitude" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="longitude">Longitude</label>
				<div class="col-md-7">
					<form:input type="number" value="3.097422" path="longitude" id="longitude" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="longitude" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		<!-- ********************************************************************************** -->
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="email">Email</label>
				<div class="col-md-7">
					<form:input type="text" path="email" id="email" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="email" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="userProfiles">Role</label>
				<div class="col-md-7">
					<form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="userProfiles" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-actions floatRight">
				<input type="submit" value="Ajouter" class="btn btn-primary btn-sm">  <a href="<c:url value='/admin' />">Annuler</a>
			</div>
		</div>
	</form:form>
	</div>
</body>
</html>