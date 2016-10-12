package com.spring.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.User;
import com.spring.service.UserService;


//On definit que la classe est un controlleur
@Controller
public class UserController {

	private UserService userService;

	// Injection du service
	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setPersonService(UserService ps) {
		this.userService = ps;
	}
	
	//Test map
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String mapPage() {
		return "map";
	}
	//Test contact
		@RequestMapping(value = "/contact", method = RequestMethod.GET)
		public String contactPage() {
			return "contact";
		}

	
	//Test map
//		@RequestMapping(value = "/map2", method = RequestMethod.GET)
//		public String map2(ModelMap model) {
//			User user = new User();
//			model.addAttribute("user", user);
//			return "newuser";
//		}
		
	//Test map Ajax
		@RequestMapping(value = "/mapAjax", method = RequestMethod.GET)
		public String mapAjaxPage(Model m, ModelMap mp) {
			User user = new User();
			user.setFirstName("Abdoul");
			user.setLastName("DIALLO");
			user.setAge(29);
			user.setEmail("abdoul@email.com");
			user.setCountry("France");
			user.setLatitude(50.640266);
			user.setLongitude(3.074592);
			//On met l'objet créé dans notre ModeMap
			mp.put("abdoul", user);
			//On recupère la liste de tous les utilisateurs
			m.addAttribute("personnes", userService.listUsers());
			return "map_ajax";
		}
	//Test ok fontionne sur l'affichage données base/ Reste ajout ajax, random...
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String homePage(Model m) {
		m.addAttribute("personnes", userService.listUsers());
		return "spring_ajax";
	}

	@RequestMapping(value = "/persons" , method = RequestMethod.GET)
	public String listPersons(Model model) {
		User user = new User();
		user.setAge(18);
		model.addAttribute("person", user);
		model.addAttribute("listPersons", this.userService.listUsers());
		return "person";
	}

	// Ajouter et modifier une personne
	@RequestMapping(value = "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") User user) {

		if (user.getId() == 0) {
			// Si inexistant on ajoute
			this.userService.save(user);;
		} else {
			// sinon on met à jour
			this.userService.updateUser(user);;
		}

		return "redirect:/persons";

	}

	// On supprime une entrée
	@RequestMapping("/remove/{id}")
	public String removePerson(@PathVariable("id") int id) {

		this.userService.removeUser(id);;
		return "redirect:/persons";
	}

	@RequestMapping("/edit/{id}")
	public String editPerson(@PathVariable("id") int id, Model model) {
		model.addAttribute("person", this.userService.findById(id));
		model.addAttribute("listPersons", this.userService.listUsers());
		return "person";
	}

}
