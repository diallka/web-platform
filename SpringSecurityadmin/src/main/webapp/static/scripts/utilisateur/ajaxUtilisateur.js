function ajaxUtilisateur(){
	var token = $( "meta[name='_csrf']" ).attr( "content" );
	var header = $( "meta[name='_csrf_header']" ).attr( "content" );

	var frm = $( '#formAjout' );

	var data = frm.serialize();
	
	$.ajax({	
			
			//type : frm.attr( 'method' ) ,
			method: 'POST',
			//url : frm.attr( 'action' ) + data,
			url: '/admin/ajouter?' + data,
			dataType : 'json' ,
			beforeSend : function ( xhr ) {
				xhr.setRequestHeader( header , token );
				xhr.setRequestHeader("Accept", "application/json");
		        xhr.setRequestHeader("Content-Type", "application/json");
			} ,
			success : function ( response ) {
//				console.log( "succees" );
//				$('#personFormResponse').text(response);
				
				
				
			} ,
			error : function () {
				console.log( this );
			}
			
		});
	//A changer
	$("#tab").html("/admin/lister");
}

function supprimerUtilisateur(){
	$("#btSupprimerUtilisateur").hide();
	$("#supprimerUtilisateur").click(function(){
		console.log("suppression utilisateur");
	});
}