package com.spring.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.User;
import com.spring.service.ProfilUserService;
import com.spring.service.UserService;

@Controller
@RequestMapping( "utilisateur" )
public class UtilisateursController {

    @Autowired
    UserService       userService;

    @Autowired
    ProfilUserService userProfileService;

    @RequestMapping( value = "/lister" , method = RequestMethod.GET )
    public ModelAndView listerContatcs() {
        final ModelAndView mv = this.getModelAndView();

        mv.addObject( "wrap", this.userService.listUsers() );
        mv.addObject( "titre", "Liste Utilisateurs" );
        mv.addObject( "date", new Date() );
        return mv;
    }

    @RequestMapping( value = "/modifier" , method = RequestMethod.GET )
    public ModelAndView modifiererContact() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Page de modification" );
        return mv;
    }

    @RequestMapping( value = "/modifier/profil" , method = RequestMethod.POST )
    public ModelAndView ajouterUser( final User user , final BindingResult result ) {
        final ModelAndView mv = this.getModelAndView();
        this.userService.updateUser( user );
        return mv;
    }

    @RequestMapping( value = "/supprimer" , method = RequestMethod.GET )
    public ModelAndView supprimerContact() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Page de suppression" );
        return mv;
    }

    //On recup�re l'identifiant de la personne connect� qu'on renvoit
    private String getPrincipal() {
        String userLogin = null;
        final Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if ( principal instanceof UserDetails ) {
            userLogin = ( (UserDetails) principal ).getUsername();

        } else {
            userLogin = principal.toString();
        }
        return userLogin;
    }

    public ModelAndView getModelAndView() {
        return new ModelAndView( "utilisateur/index" );
    }
}
