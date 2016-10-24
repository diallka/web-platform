package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.User;
import com.spring.service.UserService;

//On definit que la classe est un controlleur
@Controller
public class UserController {

    private UserService userService;

    // Injection du service
    @Autowired( required = true )
    @Qualifier( value = "userService" )
    public void setPersonService( final UserService ps ) {
        this.userService = ps;
    }

    //Test map
    @RequestMapping( value = "/map" , method = RequestMethod.GET )
    public String mapPage() {
        return "map";
    }

    //Test contact
    //		@RequestMapping(value = "/contact", method = RequestMethod.GET)
    //		public String contactPage() {
    //			return "contact";
    //		}

    //Test map
    //		@RequestMapping(value = "/map2", method = RequestMethod.GET)
    //		public String map2(ModelMap model) {
    //			User user = new User();
    //			model.addAttribute("user", user);
    //			return "newuser";
    //		}

    //Test map Ajax
    @RequestMapping( value = "/mapAjax" , method = RequestMethod.GET )
    public String mapAjaxPage( final Model m , final ModelMap mp ) {
        final User user = new User();
        user.setFirstName( "Abdoul" );
        user.setLastName( "DIALLO" );
        user.setAge( 29 );
        user.setEmail( "abdoul@email.com" );
        user.setCountry( "France" );
        user.setLatitude( 50.640266 );
        user.setLongitude( 3.074592 );
        //On met l'objet cr�� dans notre ModeMap
        mp.put( "abdoul", user );
        //On recup�re la liste de tous les utilisateurs
        m.addAttribute( "personnes", this.userService.listUsers() );
        return "map_ajax";
    }

    //Test ok fontionne sur l'affichage donn�es base/ Reste ajout ajax, random...
    @RequestMapping( value = "/ajax" , method = RequestMethod.GET )
    public String homePage( final Model m ) {
        m.addAttribute( "personnes", this.userService.listUsers() );
        return "spring_ajax";
    }

    @RequestMapping( value = "/persons" , method = RequestMethod.GET )
    public String listPersons( final Model model ) {
        final User user = new User();
        user.setAge( 18 );
        model.addAttribute( "person", user );
        model.addAttribute( "listPersons", this.userService.listUsers() );
        return "person";
    }

    // Ajouter et modifier une personne
    @RequestMapping( value = "/person/add" , method = RequestMethod.POST )
    public String addPerson( @ModelAttribute( "person" ) final User user ) {

        if ( user.getId() == 0 ) {
            // Si inexistant on ajoute
            this.userService.save( user );;
        } else {
            // sinon on met � jour
            this.userService.updateUser( user );;
        }

        return "redirect:/persons";

    }

    // On supprime une entr�e
    @RequestMapping( "/remove/{id}" )
    public String removePerson( @PathVariable( "id" ) final int id ) {

        this.userService.removeUser( id );;
        return "redirect:/persons";
    }

    @RequestMapping( "/edit/{id}" )
    public String editPerson( @PathVariable( "id" ) final int id , final Model model ) {
        model.addAttribute( "person", this.userService.findById( id ) );
        model.addAttribute( "listPersons", this.userService.listUsers() );
        return "person";
    }

}
