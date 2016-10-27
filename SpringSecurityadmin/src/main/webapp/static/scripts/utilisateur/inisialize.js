// Initialise la vue principale
function initialiserUtilisateur () {

	$( "#formAjout" ).hide();
	$( "#btnCouleur" ).off();
	$( "#btnCouleur" ).click( function () {
		$( "p" ).css( "color" , "red" );
	} );
	$( "#btnAjout" ).click( function () {
		$( "#formAjout" ).show();
		$("#btnAjout").hide();
	} );

	// Ajouter une personne en utilisant AJAX
	$( '#formAjout' ).submit( function ( e ) {       
		var token = $( "meta[name='_csrf']" ).attr( "content" );
		var header = $( "meta[name='_csrf_header']" ).attr( "content" );
		
		

		var frm = $( '#formAjout' );
		e.preventDefault();

		var data = frm.serialize();
		$.ajax({	
				
				type : frm.attr( 'method' ) ,
				url : frm.attr( 'action' ) + data,
				dataType : 'json' ,
				beforeSend : function ( xhr ) {
					xhr.setRequestHeader( header , token );
					xhr.setRequestHeader("Accept", "application/json");
			        xhr.setRequestHeader("Content-Type", "application/json");
				} ,
				success : function ( response ) {
					console.log( "succees" );
					$('#personFormResponse').text(response);
				} ,
				error : function () {
					console.log( this );
				}
			});

	} );
}
