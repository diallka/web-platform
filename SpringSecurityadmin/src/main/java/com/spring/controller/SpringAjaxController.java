package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.User;
import com.spring.service.UserService;


@Controller

//Reutilisé dans le context par la jsp
@RequestMapping("api")
public class SpringAjaxController {

	UserService userService;
    
    @Autowired
    public SpringAjaxController(UserService userService) {
        this.userService = userService;
    }
 
   
    @RequestMapping("person/random")
    @ResponseBody
    public User randomPerson() {
        return userService.getRandom();
    }
 
    @RequestMapping("person/{id}")
    @ResponseBody
    public User getById(@PathVariable int id) {
        return userService.findById(id);
    }
     
    // same as above method, just showing different URL mapping
    @RequestMapping(value="person", params="id")
    @ResponseBody
    public User getByIdFromParam(@RequestParam int id) {
        return userService.findById(id);
    }
     
    // On recupere les données du formulaire serialisées et on ajoute la personne
    @RequestMapping(value="person", method=RequestMethod.POST)
    @ResponseBody
    public String savePerson(User user) {
        userService.save(user);;
        //On retourne cette donnée à la JSP
        return "Personne ajoutée: " + user.toString();
    }
}
