package com.spring.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.spring.model.ProfilUser;
import com.spring.service.ProfilUserService;

@Component
public class ConversionRoleProfilUser implements Converter<Object, ProfilUser>{

	@Autowired
	ProfilUserService userProfileService;

	/*
	 * On recupere le profil de l'utilisateur par son Id
	 * @voir org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	public ProfilUser convert(Object element) {
		Integer id = Integer.parseInt((String)element);
		ProfilUser profil= userProfileService.findById(id);
		System.out.println("Profile : "+profil);
		return profil;
	}
}