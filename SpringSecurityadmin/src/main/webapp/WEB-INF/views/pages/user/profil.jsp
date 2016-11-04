<!-- taglib a deplacer apres -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="page-wrapper">
	<br />
	<!-- Page Heading -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active  text-uppercase"><i class="fa fa-dashboard"></i> Modifier votre profil</li>

			</ol>
		</div>
	</div>
	<!-- /.row -->

	<!-- Page content -->
	<form:form id="formAjout" commandName="infos" class="form-horizontal">
		<div class="row">
			<div class="form-group col-md-4">
					<label class="col-md-3 control-lable" for="lastName"> <form:label path="id">
							<spring:message text="ID" />
						</form:label>
					</label>
					<div class="col-md-9">
						<form:input path="id" readonly="true" disabled="true" />
						<form:hidden path="id" />
					</div>

			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="lastName">Nom</label>
				<div class="col-md-9">
					<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="lastName" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="firstName">Prénom</label>
				<div class="col-md-9">
					<form:input type="text" path="firstName" id="firstName" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="firstName" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="ssoId">Identifiant</label>
				<div class="col-md-9">
					<form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="ssoId" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="password">Mot de passe</label>
				<div class="col-md-9">
					<form:input type="password" path="password" id="password" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="password" class="help-inline" />
					</div>
				</div>
			</div>
		</div>


		<!-- ********************************************************************************** -->
		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="age">Age</label>
				<div class="col-md-9">
					<form:input type="number" path="age" id="age" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="age" class="help-inline" />
					</div>
				</div>
			</div>
		</div>



		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="country">Pays</label>
				<div class="col-md-9">
					<form:input type="text" path="country" id="country" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="country" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="latitude">Latitude</label>
				<div class="col-md-9">
					<form:input type="text" path="latitude" id="latitude" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="latitude" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="longitude">Longitude</label>
				<div class="col-md-9">
					<form:input type="text" path="longitude" id="longitude" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="longitude" class="help-inline" />
					</div>
				</div>
			</div>
		</div>
		<!-- ********************************************************************************** -->
		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="email">Email</label>
				<div class="col-md-9">
					<form:input type="text" path="email" id="email" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="email" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4">
				<label class="col-md-3 control-lable" for="userProfiles">Role</label>
				<div class="col-md-9">
					<form:select path="userProfiles"  items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="userProfiles" class="help-inline" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-10">
				<input type="submit" value="<spring:message text="Modifier"/>" class="btn btn-primary btn-sm pull-left"> &nbsp;
				<button id="boutonAnnuler" type="button" class="btn btn-danger btn-sm pull-center">Annuler</button>
			</div>
		</div>
	</form:form>


	<!-- /.row -->

</div>
<!-- /#page-wrapper -->

<script type="text/javascript">
	$( document ).ready( function () {
		//e.preventDefault();
		initialiserProfil();

	} );
</script>
<script src="<c:url value="/static/scripts/profil/inisialiseForm.js"/>" type="text/javascript"></script>
<script src="<c:url value="/static/scripts/profil/ajaxFormulaire.js"/>" type="text/javascript"></script>
