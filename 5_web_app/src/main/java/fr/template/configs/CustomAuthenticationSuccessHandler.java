/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.configs;

import fr.template.models.authentification.Role;
import fr.template.models.authentification.User;
import fr.template.services.UserService;
import java.io.IOException;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 *
 * @author QTKT2194
 */
@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CustomAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final static Logger logger = Logger.getLogger(CustomAuthenticationSuccessHandler.class);

    @Autowired
    private UserService userService;

    public CustomAuthenticationSuccessHandler() {
        super();
        setUseReferer(true);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        logger.info("new AUTH SUCCESSFULL");

        HttpSession httpSession = request.getSession();
        User user = (User) authentication.getPrincipal();

        httpSession.setAttribute("LAST_NAME", user.getLastName());
        httpSession.setAttribute("FIRST_NAME", user.getFirstName());
        httpSession.setAttribute("FULL_NAME", user.getLastName() + " " + user.getFirstName());
        httpSession.setAttribute("IMAGE_B64", user.getIdenticon());
        
        httpSession.setAttribute("USER_LIST_ROLES", user.getRoles().stream()
                .map(Role::getLabel)
                .collect(Collectors.toList()));
        
        
        getRedirectStrategy().sendRedirect(request, response, "/");
    }

}
