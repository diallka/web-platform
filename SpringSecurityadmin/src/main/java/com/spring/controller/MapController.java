package com.spring.controller;

import java.util.List;

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
// Reutilisé dans le context par la jsp pour mapper les objets
@RequestMapping( "map" )
public class MapController {

    UserService userService;

    @Autowired
    public MapController( final UserService userService ) {
        this.userService = userService;
    }

    @RequestMapping( value = "users/liste" , method = RequestMethod.GET)
    @ResponseBody
    public List< User > liste() {
        return this.userService.listUsers();
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

    // On recupere les données du formulaire serialisées et on ajoute la
    // personne
    @RequestMapping( value = "person" , method = RequestMethod.POST )
    @ResponseBody
    public String saveUser( final User user ) {
        this.userService.save( user );
        // On retourne cette donnée à la JSP
        return "Personne ajoutée: " + user.toString();
    }
}
