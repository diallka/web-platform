package com.spring.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.User;
import com.spring.model.UserProfile;
import com.spring.service.UserProfileService;
import com.spring.service.UserService;

@Controller
public class UserConfigController {

	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	UserService userService;

	
	@RequestMapping(value = {"/", "/accueil"} , method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.addAttribute("bienvenue", "Bienvenue dans ton espace personnel");
		return "accueil";
	}
	
//	@RequestMapping(value = "/espace_perso_utilisateur" , method = RequestMethod.GET)
//	@ResponseBody
//	public String UserInformations(ModelMap model, Principal principal) {
//		return principal.getName();
//	}
	
//	@RequestMapping(value = "/espace_perso_utilisateur" , method = RequestMethod.GET)
//	public String UserPage(ModelMap model, Principal principal) {
//		model.addAttribute("bienvenue", "Bienvenue dans votre espace personnel");
//		model.addAttribute("utilisateur", getPrincipal()); //Nous permet de récupérer le prenom de la personne connectée
//		List<Object> principals = sessionRegistry.getAllPrincipals();
//		List<String> test = new ArrayList<String>();
//		for ( Object principal2: principals){
//			 if (principal2 instanceof User) {
//				 test.add(((User) principal).getLastName());
//			    }
//		}
//		model.addAttribute("test", test);
//		return "espace_utilisateur";
//	}

	@RequestMapping(value = "/espace_utilisateur" , method = RequestMethod.GET)
	public String UserPage(ModelMap model, Model m) {
		model.addAttribute("bienvenue", "Bienvenue dans ton espace personnel");
		model.addAttribute("utilisateur", getPrincipal()); //Nous permet de récupérer l'identifiant de la personne connectée
	
		m.addAttribute("test", getPrincipal());
		return "espace_utilisateur";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model, Model m) {
		model.addAttribute("user", getPrincipal());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "admin";
	}

	@RequestMapping(value = "/db", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "dba";
	}

	
	@RequestMapping(value = "/access_refuse", method = RequestMethod.GET)
	public String accessRefuse(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "access_refuse";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	//On gère la déconnexion et rédirection de l'utilisateur
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/accueil?deconnecte";
	}

	@RequestMapping(value = "/newuser", method = RequestMethod.GET)
	public String ajoutUtilisateur(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "newuser";
	}
	
	

	/*
	 * This method will be called on form submission, handling POST request It
	 * also validates the user input
	 */
	@RequestMapping(value = "/newUser", method = RequestMethod.POST)
	public String saveRegistration(@Valid User user,
			BindingResult result, ModelMap model) {
		
		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "newuser";
		}
		userService.save(user);
		
		System.out.println("First Name : "+user.getFirstName());
		System.out.println("Last Name : "+user.getLastName());
		System.out.println("SSO ID : "+user.getSsoId());
		System.out.println("Password : "+user.getPassword());
		System.out.println("Email : "+user.getEmail());
		System.out.println("Checking UsrProfiles....");
		if(user.getUserProfiles()!=null){
			for(UserProfile profile : user.getUserProfiles()){
				System.out.println("Profile : "+ profile.getType());
			}
		}
		
		model.addAttribute("success", "L'utilisateur " + user.getFirstName() + " a été ajouté avec succès");
		return "registrationsuccess";
	}

	
	
	//On recupère le prenom de la personne connecté qu'on renvoit
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
			
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	
	
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

}