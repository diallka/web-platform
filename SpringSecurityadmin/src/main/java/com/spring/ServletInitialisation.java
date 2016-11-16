package com.spring;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

public class ServletInitialisation extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure( final SpringApplicationBuilder application ) {
        return application.sources( StartApp.class );
    }

}
