package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.UserService;

@Controller
public class AjoutController {

    @Autowired
    private UserService userService;

    @RequestMapping( value = "/ajax" , method = RequestMethod.GET )
    public String AjouterGET( final Model m ) {
        m.addAttribute( "personnes", this.userService.listUsers() );
        return "ajax";
    }

}
