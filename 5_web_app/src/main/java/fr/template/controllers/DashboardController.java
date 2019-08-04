package fr.template.controllers;

import fr.template.abstractClasses.AbstractController;
import fr.template.models.authentification.User;
import fr.template.services.UserService;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author fqlh0717
 */
@Controller
public class DashboardController extends AbstractController {

    private final static Logger logger = Logger.getLogger(DashboardController.class);

    @Autowired
    private UserService userService;

    public DashboardController() {
        super("dashboard_views");
    }

    @RequestMapping(value = {"/", "dashboard"})
    public String showDashboard(Model model) {
        super.init("dashboard", "Le DashBoard", model);
        return super.getViewPath();
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            HttpServletResponse response) {

        ModelAndView model = new ModelAndView();
        response.addHeader("auth-failed", "auth-failed");

        if (error != null) {
            model.addObject("error", " L'identifiant ou le mot de passe est incorrect !!");
            logger.info("error hhd");
            model.setViewName("login");
        }

        if (logout != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null) {
                new SecurityContextLogoutHandler().logout(this.request, this.response, auth);
                logger.info("logout ok");
            }

            model.addObject("msg", this.getMessage("login.logout"));
            model.setViewName("login");
        }

        return model;
    }

    @RequestMapping(value = {"register", "register/"}, method = RequestMethod.GET)
    public String register_page(Model model) {
        User user = new User();
        user.setEnabled(false);
        model.addAttribute("userForm", user);
        return "register";
    }

    @RequestMapping(value = {"register", "register/"}, method = RequestMethod.POST)
    public String register(@ModelAttribute("userForm") @Validated User user, BindingResult result, Model model, final RedirectAttributes redirectAttributes) {

        if (!result.hasErrors()) {
            try {
                this.userService.registerUser(user);
                model.addAttribute("css", "success");
                model.addAttribute("msg", "Le compte a été correctement créé. Merci d’attendre l’activation de votre compte par les administrateurs. Un mail vous sera envoyé!");
            } catch (Exception e) {
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "Error : " + e.getLocalizedMessage());
                logger.error(e.getStackTrace(), e);
            }
        } else {
            logger.info("form not set correctly : " + user);
        }

        model.addAttribute("userForm", user);
        return "register";
    }

}
