function initialiserProfil () {
	$( '#formAjout' ).submit( function ( e ) {
		e.preventDefault();
		modifierProfil();
	} );
}
