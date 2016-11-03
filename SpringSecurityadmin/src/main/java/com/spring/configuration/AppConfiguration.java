package com.spring.configuration;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan( basePackages = "com.spring" )
public class AppConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    ConversionRoleProfilUser roleToUserProfileConverter;

    /**
     * Configure TilesConfigurer.
     */
    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions( new String[]{ "/WEB-INF/views/**/tiles.xml" } );
        tilesConfigurer.setCheckRefresh( true );
        return tilesConfigurer;
    }

    /**
     * Configure ViewResolvers to deliver preferred views.
     */
    @Override
    public void configureViewResolvers( final ViewResolverRegistry registry ) {
        final TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver( viewResolver );
    }

    //A configurer pour que Jackson mapper fonctionne
    @Override
    public void configureMessageConverters( final List< HttpMessageConverter< ? >> converters ) {
        final MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        final ObjectMapper objectMapper = new ObjectMapper();
        //objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        //converter.setObjectMapper(objectMapper);
        converters.add( converter );
        super.configureMessageConverters( converters );
    }

    /*
     * On configure le dossier source des ressourrces internes tel CSS/ Javascript etc...
     *
     */
    @Override
    public void addResourceHandlers( final ResourceHandlerRegistry registry ) {
        registry.addResourceHandler( "/static/**" ).addResourceLocations( "/static/" );
    }

    /*
     * Configure Converter to be used.
     * In our example, we need a converter to convert string values[Roles] to UserProfiles in newUser.jsp
     */
    @Override
    public void addFormatters( final FormatterRegistry registry ) {
        registry.addConverter( this.roleToUserProfileConverter );
    }

}
