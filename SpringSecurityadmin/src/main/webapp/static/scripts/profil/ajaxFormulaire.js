function modifierProfil () {

	var data = $( '#formAjout' ).serialize();

	$.ajax(
		{

			// type : frm.attr( 'method' ) ,
			method : 'POST' ,
			// url : frm.attr( 'action' ) + data,
			url : '/utilisateur/modifier/profil?' + data ,
			dataType : 'json' ,

			success : function ( response ) {
				console.log( "success" );
				// $('#personFormResponse').text(response);

			} ,
			error : function () {
				console.log( this );
			}

		} );
	
}

