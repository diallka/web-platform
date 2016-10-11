package com.spring.controller;

import java.util.List;

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

// Reutilisé dans le context par la jsp pour mapper les objets
@RequestMapping("map")
public class MapController {

	UserService userService;

	@Autowired
	public MapController(UserService userService) {
		this.userService = userService;
	}

	 @RequestMapping(value="users/liste", method = RequestMethod.GET, produces="application/json")
	    @ResponseBody
	    public List<User> liste(){
			return userService.listUsers();
	    }

//	@RequestMapping(value="test", method =  RequestMethod.GET,
//            produces="application/json")
//	public @ResponseBody List<User> pay(@RequestParam("empid") int id, String firstName, String lastName) {
//
//	//get your employee list here
//	return userService.listUsers();
//	}


	@RequestMapping("person/{id}")
	@ResponseBody
	public User getById(@PathVariable int id) {
		return userService.findById(id);
	}

	// same as above method, just showing different URL mapping
	@RequestMapping(value = "person", params = "id")
	@ResponseBody
	public User getByIdFromParam(@RequestParam int id) {
		return userService.findById(id);
	}

	// On recupere les données du formulaire serialisées et on ajoute la
	// personne
	@RequestMapping(value = "person", method = RequestMethod.POST)
	@ResponseBody
	public String saveUser(User user) {
		userService.save(user);
		// On retourne cette donnée à la JSP
		return "Personne ajoutée: " + user.toString();
	}
}
