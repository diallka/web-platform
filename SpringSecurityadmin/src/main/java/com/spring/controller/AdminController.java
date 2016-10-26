package com.spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.ProfilUser;
import com.spring.model.User;
import com.spring.service.ProfilUserService;
import com.spring.service.UserService;

@Controller
@RequestMapping( "admin" )
public class AdminController {

    @Autowired
    UserService       userService;

    @Autowired
    ProfilUserService userProfileService;

    public ModelAndView getModelAndView() {
        return new ModelAndView( "admin/index" );
    }

    @RequestMapping( value = "/lister" , method = RequestMethod.GET )
    public ModelAndView adminUtilisateursGET() {

        final ModelAndView mv = this.getModelAndView();
        final User user = new User();
        mv.addObject( "user", user );
        mv.addObject( "titre", "Page ad" );

        mv.addObject( "liste", this.userService.listUsers() );
        return mv;
    }

    @RequestMapping( value = "/lister" , method = RequestMethod.POST )
    public ModelAndView adminUtilisateursPOST( @ModelAttribute( "user" ) @Valid final User user , final BindingResult result ) {

        final ModelAndView mv = this.getModelAndView();
        if ( result.hasErrors() ) {
            System.out.println( "il y a des erreurs" );

        }
        this.userService.save( user );
        if ( user.getUserProfiles() != null ) {
            for ( final ProfilUser profile : user.getUserProfiles() ) {
                System.out.println( "Profile : " + profile.getType() );
            }
        }
        return mv;

    }

    @RequestMapping( value = "/ajouter" , method = RequestMethod.POST )
    @ResponseBody
    public ModelAndView adminAjoutUtilisateurs( final User user ) {
        this.userService.save( user );
        final ModelAndView mv = new ModelAndView( "admin/index" );
        return mv;
    }

    @ModelAttribute( "roles" )
    public List< ProfilUser > initializeProfiles() {
        return this.userProfileService.findAll();
    }

}
