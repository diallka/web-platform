package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping( value = "liste" , method = RequestMethod.GET )
    @ResponseBody
    public List< User > liste() {
        return this.userService.listUsers();
    }

    //Ajout utilisateur via Ajax
    @RequestMapping( value = "/ajouter" , method = RequestMethod.POST )
    //@ResponseBody
    public ModelAndView ajouterUser( final User user , final BindingResult result ) {
        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "Utilisateur ajouté" + user.toString() );
        //ajout bdd
        if ( user.getId() == 0 ) {
            // Si inexistant on ajoute
            this.userService.save( user );
        } else {
            // sinon on met � jour
            this.userService.updateUser( user );
        }
        //On affiche l'objet dans la console
        System.out.println( user );
        return mv;
    }

    @RequestMapping( value = "/recuperer/{id}" , method = RequestMethod.GET )
    public ModelAndView recupereUtilisateur( @PathVariable( "id" ) final int id , final User user , final BindingResult result ) {
        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "user", this.userService.findById( id ) );
        return mv;
    }

    // On supprime une entr�e
    @RequestMapping( value = "/supprimer/{id}" )
    public String supprimerUser( @PathVariable( "id" ) final int id , final User user , final BindingResult result ) {
        this.userService.removeUser( id );
        return "redirect:/admin/lister";
    }

    @ModelAttribute( "roles" )
    public List< ProfilUser > initializeProfiles() {
        return this.userProfileService.findAll();
    }

}
