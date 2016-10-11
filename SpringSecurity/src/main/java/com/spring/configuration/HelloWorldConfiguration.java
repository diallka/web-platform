package com.spring.configuration;

import java.text.SimpleDateFormat;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.spring")
public class HelloWorldConfiguration extends WebMvcConfigurerAdapter {
	
	@Autowired
	RoleToUserProfileConverter roleToUserProfileConverter;
	
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		registry.viewResolver(viewResolver);
	}
	
	//A configurer pour que Jackson mapper fonctionne
	 @Override
	    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	        final MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
	        final ObjectMapper objectMapper = new ObjectMapper();
	        //objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
	       //converter.setObjectMapper(objectMapper);
	        converters.add(converter);
	        super.configureMessageConverters(converters);
	    }
	
	/*
     * On configure le dossier source des resserces internes tel CSS/ Javascript etc...
     *
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }
    
    /*
     * Configure Converter to be used.
     * In our example, we need a converter to convert string values[Roles] to UserProfiles in newUser.jsp
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(roleToUserProfileConverter);
    }
    

}