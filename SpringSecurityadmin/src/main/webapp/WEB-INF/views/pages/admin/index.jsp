<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- ... -->
<script type="text/javascript">
var contexPath = "<%=request.getContextPath() %>";
</script>
<style type="text/css">
label {
	width: 70px;
	display: inline-block;
}
</style>
</head>

<script src="<c:url value="/static/scripts/utilisateur/inisialize.js"/>" type="text/javascript"></script>

<div id="page-wrapper">

	<div class="container-fluid">

		<p>Test</p>
		<br />

		<button id="btnCouleur" type="submit">couleur</button>
		<br /> <br />
		<button id="btnAjout" type="submit" class="btn btn-g">
			<em class="fa fa-plus-circle">Ajouter </em>
		</button>
		<br /> <br />
		<form id="formAjout" method="post" action= "/admin/ajouter?">
			<label>Nom: </label> <input type="text" name="lastName" id="lastName"/> <br /> 
			<label>Prenom: </label> <input type="text" name="firstName" id="firstName"/> <br /> 
			<label>Identifiant: </label> <input type="text" name="ssoId" id="ssoId"/> <br /> 
			<label>Mot de passe: </label> <input type="text" name="password" id="password"/> <br />
			<label>Age: </label> <input type="text" name="age" id="age" /> <br /> 
			<label>Pays: </label> <input type="text" name="country" id="country" /> <br /> 
			<label>Latitude:</label> <input type="number" value="50.593643"  name="latitude" id="latitude" /> <br /> 
			<label>Longitude: </label> <input type="number" value="3.097422" name="longitude" id="longitude"/> <br />
			<label>Email: </label> <input type="text" name="email" id="email"/> <br />
			<label>Role: </label> <input type="text" value="USER" name="userProfiles" id="userProfiles"/> <br /> 
			<input type="submit" value="Ajouter" /><br /> <br /><br /> <br />
			
<!-- 						<input type="hidden" -->
<%-- 								name="${_csrf.parameterName}" --%>
<%-- 								value="${_csrf.token}"/> --%>
		</form>
		<div id="personFormResponse" class="green">Reponse:</div>

		<script type="text/javascript">
			$( document ).ready( function () {

				initialiserUtilisateur();

			} );
		</script>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

