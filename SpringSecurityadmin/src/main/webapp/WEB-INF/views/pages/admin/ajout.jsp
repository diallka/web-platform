<!-- taglib a deplacer apres -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- commadName equivalent modelAttribute -->
<form:form id="formAjout" commandName="user" class="form-horizontal">
	<h3>Ajout utilisateur</h3>
	<div class="row">
		<div class="form-group col-md-4">
			<c:if test="${!empty user.lastName}">
				<label class="col-md-3 control-lable" for="lastName"> <form:label path="id">
						<spring:message text="ID" />
					</form:label>
				</label>
				<div class="col-md-9">
					<form:input path="id" readonly="true"  disabled="true" />
					<form:hidden path="id" />
				</div>

			</c:if>
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
				<form:input type="number" value="50.593643" path="latitude" id="latitude" class="form-control input-sm" />
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
				<form:input type="number" value="3.097422" path="longitude" id="longitude" class="form-control input-sm" />
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
				<form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="userProfiles" class="help-inline" />
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="form-group col-md-10">
			<c:if test="${!empty user.lastName}">
				<input type="submit" value="<spring:message text="Modifier"/>" class="btn btn-primary btn-sm pull-left"> &nbsp;
			</c:if>
			<c:if test="${empty user.lastName}">
				<input type="submit" value='<spring:message text='Ajouter'/>' class="btn btn-primary btn-sm pull-left"> &nbsp;
			</c:if>
			<button id="boutonAnnuler" type="button" class="btn btn-danger btn-sm pull-center">Annuler</button>
		</div>
	</div>
</form:form>
