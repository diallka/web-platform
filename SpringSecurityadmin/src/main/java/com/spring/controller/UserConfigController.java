package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.ProfilUser;
import com.spring.model.User;
import com.spring.service.ProfilUserService;
import com.spring.service.UserService;

@Controller
public class UserConfigController {

    @Autowired
    ProfilUserService userProfileService;

    @Autowired
    UserService       userService;

    @RequestMapping( value = "/espace_utilisateur" , method = RequestMethod.GET )
    public String UserPage( final ModelMap model , final Model m ) {
        model.addAttribute( "bienvenue", "Bienvenue dans ton espace personnel" );
        model.addAttribute( "utilisateur", this.getPrincipal() ); //Nous permet de r�cup�rer l'identifiant de la personne connect�e

        m.addAttribute( "test", this.getPrincipal() );
        return "espace_utilisateur";
    }

    @RequestMapping( value = "/admin" , method = RequestMethod.GET )
    public String adminPage( final ModelMap model , final Model m ) {
        model.addAttribute( "user", this.getPrincipal() );
        model.addAttribute( "listUsers", this.userService.listUsers() );
        return "admin";
    }

    @RequestMapping( value = "/db" , method = RequestMethod.GET )
    public String dbaPage( final ModelMap model ) {
        model.addAttribute( "user", this.getPrincipal() );
        return "db";
    }

    @RequestMapping( value = "/erreur_403" , method = RequestMethod.GET )
    public String accessRefuse( final ModelMap model ) {
        model.addAttribute( "user", this.getPrincipal() );
        return "erreur_403";
    }

    @RequestMapping( value = "/login" , method = RequestMethod.GET )
    public String loginPage() {
        return "login";
    }

    //On g�re la d�connexion et r�direction de l'utilisateur
    @RequestMapping( value = "/logout" , method = RequestMethod.GET )
    public String logoutPage( final HttpServletRequest request , final HttpServletResponse response ) {
        final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if ( auth != null ) {
            new SecurityContextLogoutHandler().logout( request, response, auth );
        }
        return "redirect:/?deconnecte";
    }

    @RequestMapping( value = "/newuser" , method = RequestMethod.GET )
    public String ajoutUtilisateur( final ModelMap model ) {
        final User user = new User();
        model.addAttribute( "user", user );
        return "newuser";
    }

    /*
     * This method will be called on form submission, handling POST request It
     * also validates the user input
     */
    @RequestMapping( value = "/newuser" , method = RequestMethod.POST )
    public String saveRegistration( @Valid final User user , final BindingResult result , final ModelMap model ) {

        if ( result.hasErrors() ) {
            System.out.println( "There are errors" );
            return "newuser";
        }
        this.userService.save( user );

        System.out.println( "First Name : " + user.getFirstName() );
        System.out.println( "Last Name : " + user.getLastName() );
        System.out.println( "SSO ID : " + user.getSsoId() );
        System.out.println( "Verification profil...." );
        if ( user.getUserProfiles() != null ) {
            for ( final ProfilUser profile : user.getUserProfiles() ) {
                System.out.println( "Profil : " + profile.getType() );
            }
        }

        model.addAttribute( "success", "L'utilisateur " + user.getFirstName() + " a été ajouté avec succès" );
        return "registrationsuccess";
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

    @ModelAttribute( "roles" )
    public List< ProfilUser > initializeProfiles() {
        return this.userProfileService.findAll();
    }

}
