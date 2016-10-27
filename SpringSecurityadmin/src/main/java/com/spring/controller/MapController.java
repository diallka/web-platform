package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.User;
import com.spring.service.UserService;

@Controller
//Reutilis�  context par la jsp
@RequestMapping( "map" )
public class MapController {

    UserService userService;

    @Autowired
    public MapController( final UserService personService ) {
        this.userService = personService;
    }

    // On recupere les donn�es du formulaire serialis�es et on ajoute la personne
    @RequestMapping( value = "person" , method = RequestMethod.POST )
    @ResponseBody
    public String savePerson( final User user ) {
        this.userService.save( user );
        //On retourne cette donn�e � la JSP
        return "Personne ajout�e: " + user.toString();
    }

}
