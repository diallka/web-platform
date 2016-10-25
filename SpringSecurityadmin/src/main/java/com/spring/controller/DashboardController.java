package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ProfilUserService;
import com.spring.service.UserService;

@Controller
public class DashboardController {

    @Autowired
    UserService       userService;

    @Autowired
    ProfilUserService userProfileService;

    @RequestMapping( value = "/dashboard" , method = RequestMethod.GET )
    public ModelAndView admin() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Dashboard Administrateur" );
        mv.addObject( "username", this.getPrincipal() );
        mv.addObject( "nombre", this.userService.count().get( 0 ) );
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
        return new ModelAndView();
    }

}
