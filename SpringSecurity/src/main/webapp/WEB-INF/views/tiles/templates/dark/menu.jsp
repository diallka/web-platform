<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Gère largeur hauteur/epaisseur entre Navbar et page -->
<style type="text/css">
    .bs-example{
    	margin: 2%;
    }
   
</style>


<div class="bs-example">
    <nav role="navigation" class="navbar navbar-default">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/" class="navbar-brand"><img src="<c:url value="/static/images/logo.PNG"/>" /></a>
        </div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
<%--                 <li class="active"><a href="${pageContext.request.contextPath}/">Accueil</a></li> --%>
                <li ><a href="${pageContext.request.contextPath}/map">Map</a></li>
                
                <li><a href="${pageContext.request.contextPath}/contact/lister">Contact</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/contact/modifier">Modifier</a></li>
                <li><a href="${pageContext.request.contextPath}/contact/supprimer">Supprimer</a></li>
                </ul>
                </li>
            </ul>
            <form role="search" class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" placeholder="Rechercher..." class="form-control">
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                 <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Connexion <b class="caret"></b></a>
                    <ul role="menu" class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/espace_utilisateur">Utilisateur</a></li>
                        <li class="divider"></li>
                     <li><a href="${pageContext.request.contextPath}/admin">Administrateur</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

<!-- Gère le lien actif -->
<script>
$(document).ready(function () {
    $('.navbar-nav li a').click(function () {
    	 
        $('.navbar-nav li.active').removeClass('active');
		var $this = $(this);
		
 	  if (!$this.parent().hasClass('active')) {
 	     $this.parent().addClass('active');
 	   
 	    
 	   }  
 	 
 	// e.preventDefault(e);
    });  
    
});
</script>