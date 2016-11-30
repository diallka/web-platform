package com.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.spring.model.ProfilUser;
import com.spring.service.ProfilUserService;

@Component
public class ConversionRoleProfilUser implements Converter< Object , ProfilUser > {

    @Autowired
    ProfilUserService userProfileService;

    /*
     * On recupere le profil de l'utilisateur par son Id
     * @voir org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
     */
    @Override
    public ProfilUser convert( final Object element ) {
        final Integer id = Integer.parseInt( (String) element );
        final ProfilUser profil = this.userProfileService.findById( id );
        System.out.println( "Profil : " + profil );
        return profil;
    }
}
