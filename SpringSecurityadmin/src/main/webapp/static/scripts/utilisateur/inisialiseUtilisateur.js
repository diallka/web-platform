// Initialise la vue principale
function initialiserUtilisateur () {
	$( "#formAjout" ).hide( "fast" );
	$( "#boutonAnnuler" ).hide( "fast" );

	$( "#btnAjout" ).click( function () {
		$( "#btnAjout" ).hide();
		$( "#formAjout" ).slideDown();
		$( "#boutonAnnuler" ).show();
		//setInterval(auto_load,10000);
	} );

	$( "#boutonAnnuler" ).click( function () {
		$( this ).hide();
		$( "#formAjout" ).slideUp();
		$( "#btnAjout" ).show( "fast" );
	} );
	// Ajouter une personne en utilisant AJAX
	$( '#formAjout' ).submit( function ( e ) {
		e.preventDefault();

		ajaxUtilisateur();
		
		
		$( "#formAjout" ).hide().trigger( "reset" );
		$( "#boutonAnnuler" ).hide();
		//$( "#personFormResponse" ).html( "utilisateur ajoute avec succes" );
		$( "#btnAjout" ).show();

	} );
}
