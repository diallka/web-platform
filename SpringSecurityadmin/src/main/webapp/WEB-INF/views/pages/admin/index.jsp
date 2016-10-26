<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="<c:url value="/static/scripts/utilisateur/inisialize.js"/>" type="text/javascript"></script>

<div id="page-wrapper">

	<div class="container-fluid">

		<p>Test</p>
		<br />

		<button id="btnCouleur" type="submit" >couleur</button>
		<br/>
		<br/>
		<button id="btnAjout" type="submit" class="btn btn-g"><em class="fa fa-plus-circle">Ajouter </em>
		</button>
		<br />
		<br />
		   <form id="formAjout">
      <label for="nameInput">Nom: </label>
      <input type="text" name="last_name" id="nameInput" />
      <br/>
       
      <label for="ageInput">Age: </label>
      <input type="text" name="age" id="ageInput" />
      <br/>
      
      <label for="countryInput">Pays: </label>
      <input type="text" name="country" id="countryInput" />
      <br/>
      
      <input type="submit" value="Ajouter" /><br/><br/>
      <div id="personFormResponse" class="green"> </div>
    </form>
		<div id="personFormResponse" class="green"> Reponse:</div>

		<script type="text/javascript">
			$( document ).ready( function () {
				// $("#btnAjouterCollab").click(function(){
				// 	$("p").hide();
				// });
				//$("#btnAjouterCollab").hide();

				initialiserUtilisateur();

			} );
		</script>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

