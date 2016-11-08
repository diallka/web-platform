package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.User;
import com.spring.service.UserService;

@Controller
public class UseController {

    @Autowired
    UserService userService;

    @RequestMapping( value = "/users/map" , method = RequestMethod.GET )
    public String map( final Model m ) {
        //On renvoit le nom de la définition correspondante
        return "users_map";
    }

    @RequestMapping( value = "/user/profil" , method = RequestMethod.GET )
    public String profil( final Model m , User user ) {
        m.addAttribute( "infos", this.userService.findBySso( this.getPrincipal() ) );
        user = this.userService.findBySso( this.getPrincipal() );
        m.addAttribute( "firstname", user.getFirstName() );
        m.addAttribute( "role", user.getUserProfiles() );
        System.out.println( "***" + user.getUserProfiles() + "*****" );
        System.out.println( this.userService.findBySso( this.getPrincipal() ) );

        //Definition name
        return "user_profil";
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

}
