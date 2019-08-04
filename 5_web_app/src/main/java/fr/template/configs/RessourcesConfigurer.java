/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.configs;

import java.util.concurrent.TimeUnit;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.CacheControl;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *
 * @author QTKT2194
 */
@Component
class RessourcesConfigurer extends WebMvcConfigurerAdapter {

    @Value("${resources.path}")
    private String pathResources;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/")
                .setCacheControl(CacheControl.maxAge(365, TimeUnit.DAYS));

        registry.addResourceHandler("/resources/**")
                .addResourceLocations("file://" + pathResources)
                .setCacheControl(CacheControl.maxAge(365, TimeUnit.DAYS));
    }

}
