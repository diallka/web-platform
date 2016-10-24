package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.UserService;

@Controller
@RequestMapping( "administrateur" )
public class AdminController {

    @Autowired
    UserService userService;

    @RequestMapping( value = "/ad" , method = RequestMethod.GET )
    public ModelAndView admin() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Page ad" );
        return mv;
    }

    @RequestMapping( value = "/ajouter" , method = RequestMethod.GET )
    public ModelAndView adminAjout() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Page d'ajout" );
        return mv;
    }

    public ModelAndView getModelAndView() {
        return new ModelAndView( "administrateur/index" );
    }
}
