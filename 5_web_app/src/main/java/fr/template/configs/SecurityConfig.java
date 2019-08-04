package fr.template.configs;

import fr.template.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author QTKT2194
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

    @Autowired
    private CustomAuthenticationFailureHandler customAuthenticationFailureHandler;

    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                
                .antMatchers("/register**").permitAll()
                .antMatchers("/login**").permitAll()
                .antMatchers("/users/**").authenticated()
                .antMatchers("/roles/**").authenticated()
                .antMatchers("/h2-console/**").permitAll()
                //.antMatchers("/**").authenticated()
                // STATICS STUFFS
                
                .and().csrf().ignoringAntMatchers("/h2-console/**")
                .and().formLogin().loginPage("/login")
                
                
                .failureUrl("/login?error").permitAll()
                .successHandler(this.customAuthenticationSuccessHandler)
                //.failureHandler(this.customAuthenticationFailureHandler)
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout").permitAll()
                .and().sessionManagement().maximumSessions(1).expiredUrl("/expired")
                .and()
                .and().exceptionHandling().accessDeniedPage("/403");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**"); // #3
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}
