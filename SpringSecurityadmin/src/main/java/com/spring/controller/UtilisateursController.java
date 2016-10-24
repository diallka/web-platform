package com.spring.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.UserService;

@Controller
@RequestMapping( "utilisateur" )
public class UtilisateursController {

    @Autowired
    UserService userService;

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

    @RequestMapping( value = "/supprimer" , method = RequestMethod.GET )
    public ModelAndView supprimerContact() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Page de suppression" );
        return mv;
    }

    public ModelAndView getModelAndView() {
        return new ModelAndView( "utilisateur/index" );
    }
}
