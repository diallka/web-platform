package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {

    @RequestMapping( value = "/dashboard" , method = RequestMethod.GET )
    public ModelAndView admin() {

        final ModelAndView mv = this.getModelAndView();
        mv.addObject( "titre", "Dashboard Administrateur" );
        return mv;
    }

    public ModelAndView getModelAndView() {
        return new ModelAndView();
    }

}
