<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE HTML>
<html>
  <head>
    <title>Spring MVC - Ajax</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <style>
      body { background-color: #eee; font: helvetica; }
      #container { width: 700px; background-color: #fff; margin: 30px auto; padding: 30px; border-radius: 5px; box-shadow: 5px; }
      .green { font-weight: bold; color: green; }
      .message { margin-bottom: 10px; }
      label { width:70px; display:inline-block;}
      .hide { display: none; }
      .error { color: red; font-size: 0.8em; }
    </style>
    <!-- Style pour le tableau listant les personnes depuis la bdd -->
    <style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
  </head>
  <body>
   
  <div id="container">
   
    <h1>Page Demo Spring Mvc Ajax</h1>
    <p>Cet exemple démontre la puissance de la fonctionnalité Ajax de Spring MVC. <br/>
    Retrouver une personne en utilisant la fonction Random, <br/>
    Retrouver une personne par son id, <br/>
    ou ajouter une nouvelle personne, tout cela sans actualiser la page.
    </p>
     
    <h2>Générer un Random depuis un tableau</h2>
    <input type="submit" id="randomPerson" value="C'est parti !" /><br/><br/>
    <div id="personResponse"> </div>
   
    <hr/>
     
    <h2>Retrouver par ID</h2>
    <form id="idForm">
      <div class="error hide" id="idError">Entrez un id valide compris entre (valeur_min_id, valeur_max_id)</div>
      <label for="personId">ID (.-...): </label><input name="id" id="personId" value="0" type="number" />
      <input type="submit" value="Valider" /> <br /><br/>
      <div id="personIdResponse"> </div>
      
    </form>
     
    <hr/>
     
    <h2>Ajouter une nouvelle personne</h2>
    <form id="newPersonForm">
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
    <!-- Essayer de rafraichir cette zone en utilisant Ajax pour recup données -->
    <h2>Liste des utilisateurs disponibles dans la bdd</h2>
    <table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">NOM</th>
		<th width="120">PRENOM</th>
		<th width="120">AGE</th>
		<th width="120">EMAIL</th>
		<th width="120">PAYS</th>
		<th width="120">LATITUDE</th>
		<th width="120">LONGITUDE</th>
	</tr>
	<c:forEach items="${personnes}" var="user">
		<tr>
			<td>${user.id}</td>
			<td>${user.lastName}</td>
			<td>${user.firstName}</td>
			<td>${user.age}</td>
			<td>${user.email}</td>
			<td>${user.country}</td>
			<td>${user.latitude}</td>
			<td>${user.longitude}</td>
		</tr>
		</c:forEach>
	</table>
  </div>
   
   
  <script type="text/javascript">
   
    $(document).ready(function() {
       
      // Faire un random par un request AJAX 
      $('#randomPerson').click(function() {
        $.getJSON('${pageContext.request.contextPath}/api/person/random', function(person) {
          $('#personResponse').text(person.name + ', age ' + person.age);
        });
      });
       
      // Retrouver une personne par son ID en utilisant  AJAX
      $('#idForm').submit(function(e) {
    	//On recupere la valeur de l'id depuis le formulaire
        var personId = +$('#personId').val();
        if(!validatePersonId(personId)) 
          return false;
        $.get('${pageContext.request.contextPath}/api/person/' + personId, function(person) {
          $('#personIdResponse').text(person.last_name + ', age ' + person.age);
        });
        e.preventDefault(); // évite le comportement par defaut du Submit---> qui pourrait reloader la page
      });
       
      // Ajouter une personne en utilisant  AJAX
      $('#newPersonForm').submit(function(e) {
        //On envoie les données du formulaire en utilisant la fonction Serialize de jQuery
        $.post('${pageContext.request.contextPath}/api/person', $(this).serialize(), function(response) {
          $('#personFormResponse').text(response);
        });
         
        e.preventDefault(); 
      });
       
    });
     
    function validatePersonId(personId) {
      console.log(personId);
      console.log("test");
      if(personId === undefined || personId < 0 || personId > personId.length) {
        $('#idError').show();
        return false;
      }
      else {
        $('#idError').hide();
        return true;
      }
    }
     
   
  </script>
   
  </body>
</html>