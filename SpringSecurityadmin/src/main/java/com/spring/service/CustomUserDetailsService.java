package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.ProfilUser;
import com.spring.model.User;

@Service( "customUserDetailsService" )
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    @Transactional( readOnly = true )
    public UserDetails loadUserByUsername( final String ssoId ) throws UsernameNotFoundException {
        final User user = this.userService.findBySso( ssoId );
        System.out.println( "User : " + user );
        if ( user == null ) {
            System.out.println( "Utilisateur introuvable" );
            throw new UsernameNotFoundException( "Login introuvable" );
        }
        return new org.springframework.security.core.userdetails.User(  user.getSsoId(), 
                                                                        user.getPassword(), 
                                                                        user.getState().equals( "Active" ), 
                                                                        true, true, true, this.getGrantedAuthorities( user ) 
                                                                      );
    }

    private List< GrantedAuthority > getGrantedAuthorities( final User user ) {
        final List< GrantedAuthority > authorities = new ArrayList< GrantedAuthority >();

        for ( final ProfilUser userProfile : user.getUserProfiles() ) {
            System.out.println( "UserProfile : " + userProfile );
            //On recupere le type d'utilisateur on lui met des droit: ROLE_USER, ROLE_ADMIN, ROLE_DBA
            //authorities.add( new SimpleGrantedAuthority( "ROLE_" + userProfile.getType() ) );
            authorities.add( new SimpleGrantedAuthority( userProfile.getType() ) );
        }
        System.out.println( "authorité :" + authorities  );
        return authorities;
    }

}
