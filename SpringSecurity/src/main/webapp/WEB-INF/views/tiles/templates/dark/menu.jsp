<nav>
    
    <ul id="menu">
        <li><a href="${pageContext.request.contextPath}/">Accueil</a></li>
       <li><a href="${pageContext.request.contextPath}/map">Map</a></li>
       <li><a href="${pageContext.request.contextPath}/contact">Contactez-nous</a></li>
       <!-- Spring security gère l'accès à cette page, du coup redirige vers la page d'authentification -->
        <li><a href="${pageContext.request.contextPath}/espace_utilisateur">Espace utilisateur</a></li>
        <li><a href="${pageContext.request.contextPath}/admin">Espace administrateur</a></li>
    </ul>
</nav>