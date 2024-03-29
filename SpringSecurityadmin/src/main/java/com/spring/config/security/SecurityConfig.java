package com.spring.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier( "customUserDetailsService" )
    UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobalSecurity( final AuthenticationManagerBuilder auth ) throws Exception {
        auth.userDetailsService( this.userDetailsService );
        auth.authenticationProvider( this.authenticationProvider() );
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        final DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService( this.userDetailsService );
        authenticationProvider.setPasswordEncoder( this.passwordEncoder() );
        return authenticationProvider;
    }

    //A RESOUDRE URGENT...............AJOUT'.' ex: /admin. ---> DONNE ACCES A LA PAGE DONC DONNEES BDD

    @Override
    protected void configure( final HttpSecurity http ) throws Exception {
        //Desactiver Cross Site Request Forgery (CSFR)
        //http.csrf().disable();
        http.authorizeRequests()
        //.antMatchers("/espace_perso").permitAll()  //ici on autorise tout le monde � y acc�der meme pas connect�
        //.antMatchers("/espace_perso").authenticated() //renvoit sur la page d'authentification quand on rentre l'url
        .antMatchers( "/", "/accueil" ).permitAll()  //ici on autorise tout le monde � y acc�der meme pas connect�
        //Pour le moment ajouter * aux url pour eviter un accès non authentifié
                .antMatchers( "/user_dashboard*", "/user*" ).access( "hasRole('USER')" ) //seulement USER
                .antMatchers( "/espace_utilisateur*" ).access( "hasRole('USER')" ) //Ne peuvent y acc�der que les utilisateurs avec leur role
                .antMatchers( "/admin*", "/lister*" ).access( "hasRole('ADMIN')" ) //seulement ADMIN
                .antMatchers( "/admin_dashboard*", "/newuser*" ).access( "hasRole('ADMIN')" ) //seulement ADMIN
                //.antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")
                .antMatchers( "/db*" ).access( "hasRole('ADMIN') or hasRole('DBA')" ) //etre ADMIN ou DBA
                .and().formLogin().loginPage( "/login" ).usernameParameter( "ssoId" ).passwordParameter( "password" ).and().csrf().and().exceptionHandling().accessDeniedPage( "/erreur_403" );
    }
}
