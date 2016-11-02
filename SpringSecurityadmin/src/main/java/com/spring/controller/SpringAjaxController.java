package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.User;
import com.spring.service.UserService;

@Controller
//Reutilis� dans le context par la jsp
@RequestMapping( "api" )
public class SpringAjaxController {

    UserService userService;

    @Autowired
    public SpringAjaxController( final UserService userService ) {
        this.userService = userService;
    }

    @RequestMapping( "person/random" )
    @ResponseBody
    public User randomPerson() {
        return this.userService.getRandom();
    }

    @RequestMapping( "person/{id}" )
    @ResponseBody
    public User getById( @PathVariable final int id ) {
        return this.userService.findById( id );
    }

    // same as above method, just showing different URL mapping
    @RequestMapping( value = "person" , params = "id" )
    @ResponseBody
    public User getByIdFromParam( @RequestParam final int id ) {
        return this.userService.findById( id );
    }

    // On recupere les donn�es du formulaire serialis�es et on ajoute la personne
    @RequestMapping( value = "person" , method = RequestMethod.POST )
    @ResponseBody
    public String savePerson( final User user ) {
        this.userService.save( user );;
        //On retourne cette donn�e � la JSP
        return "Personne ajout�e: " + user.toString();
    }
}
