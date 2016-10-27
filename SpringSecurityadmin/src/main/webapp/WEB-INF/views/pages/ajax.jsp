<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Spring MVC - Ajax</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style>
body {
	background-color: #eee;
	font: helvetica;
}

#container {
	width: 500px;
	background-color: #fff;
	margin: 30px auto;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 5px;
}

.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

label {
	width: 70px;
	display: inline-block;
}

.hide {
	display: none;
}

.error {
	color: red;
	font-size: 0.8em;
}
</style>
<!-- Style pour le tableau listant les personnes depuis la bdd -->
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
</head>
<body>
	

		<h2>Ajouter une nouvelle personne</h2>
		<form id="newPersonForm">
			<label for="nameInput">Nom: </label> <input type="text" name="name"
				id="nameInput" /> <br /> <label for="ageInput">Age: </label> <input
				type="text" name="age" id="ageInput" /> <br /> <label
				for="countryInput">Pays: </label> <input type="text" name="country"
				id="countryInput" /> <br /> <label for="latitudeInput">Latitude:
			</label> <input type="text" name="latitude" id="latitudeInput" /> <br /> <label
				for="longitudeInput">Longitude: </label> <input type="text"
				name="longitude" id="longitudeInput" /> <br /> <input
				type="submit" value="Ajouter" /><br /> <br />
			<div id="personFormResponse" class="green"></div>
		</form>
		<!-- Essayer de rafraichir cette zone en utilisant Ajax pour recup données -->
		
	
	<!-- *************************************************************************** -->

	<!-- ***************************************************************************** -->
	<script type="text/javascript">
   
    $(document).ready(function() {
       
      // Faire un random par un request AJAX 
      $('#randomPerson').click(function() {
        $.getJSON('${pageContext.request.contextPath}/map/person/random', function(person) {
          $('#personResponse').text(person.name + ', age ' + person.age);
        });
      });
       
      // Retrouver une personne par son ID en utilisant  AJAX
      $('#idForm').submit(function(e) {
    	//On recupere la valeur de l'id depuis le formulaire
        var personId = +$('#personId').val();
        if(!validatePersonId(personId)) 
          return false;
        $.get('${pageContext.request.contextPath}/map/person/' + personId, function(person) {
          $('#personIdResponse').text(person.name + ', age ' + person.age);
        });
        e.preventDefault(); // évite le comportement par defaut du Submit---> qui pourrait reloader la page
      });
       
      // Ajouter une personne en utilisant  AJAX
      $('#newPersonForm').submit(function(e) {
        //On envoie les données du formulaire en utilisant la fonction Serialize de jQuery
        $.post(
               '${pageContext.request.contextPath}/map/person', 
               $(this).serialize(), function(response) {
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