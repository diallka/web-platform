<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- ... -->


</head>

<script src="<c:url value="/static/scripts/utilisateur/inisialiseUtilisateur.js"/>" type="text/javascript"></script>
<script src="<c:url value="/static/scripts/utilisateur/ajaxUtilisateur.js"/>" type="text/javascript"></script>
<div id="page-wrapper">

	<div class="container-fluid">

		<em id="btnAjout" class="fa fa-user fa-5x">+</em>

		<%@ include file="/WEB-INF/views/pages/admin/recherche.jsp"%>
		<br />

		<!-- 			<h3>Liste utilisateurs:</h3> <br /> -->
		<%-- 			<%@ include file="/WEB-INF/views/pages/admin/resultatRecherche.jsp"%> --%>


		<%@ include file="/WEB-INF/views/pages/admin/ajout.jsp"%>

		<!-- Essayer de rafraichir cette zone en utilisant Ajax pour recup données -->
		<h2>Liste des utilisateurs</h2>
		<div id="tab">
			<table class="tg">
				<tr>
					<th width="40">ID</th>
					<th width="120">NOM</th>
					<th width="120">PRENOM</th>
					<th width="30">AGE</th>
					<th width="120">PAYS</th>
					<th>MODIFIER</th>
					<th>SUPPRIMER</th>
				</tr>
				<c:forEach items="${liste}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.lastName}</td>
						<td>${user.firstName}</td>
						<td>${user.age}</td>
						<td>${user.country}</td>
						<td><a href="/admin/recuperer/${user.id}">rec</a></td>
						<td><a href="/admin/supprimer/${user.id}">X</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="personFormResponse" class="green"></div>

		<script type="text/javascript">
			$( document ).ready( function () {
				//e.preventDefault();
				initialiserUtilisateur();
				supprimerUtilisateur();
				
			} );
		</script>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

