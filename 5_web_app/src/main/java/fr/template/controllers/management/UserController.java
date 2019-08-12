/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.controllers.management;



import fr.template.abstractClasses.AbstractController;
import fr.template.models.authentification.Role;
import fr.template.models.authentification.User;
import fr.template.services.UserService;
import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author fqlh0717
 */
@Controller
@RequestMapping("/users")
public class UserController extends AbstractController {

    private final static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    
    
    public UserController() {
        super("user_views");
    }

    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String listAllUsers(Model model) {
        super.init("list_users", "Liste des utilisateurs", model);
        List<User> users = this.userService.getAllUsers();
        super.model.addAttribute("list_users", users);
        return super.getViewPath();
    }

    
    @RequestMapping(value = "showdetail", method = RequestMethod.GET)
    public String getRoleDetail(
            @RequestParam(value = "idUser", required = true) Long idUser,
            Model model) {

        super.init("detail_user", "Affichage des details", model);

        User user = this.userService.findUserById(idUser);
        super.model.addAttribute("user_detail", user);
        return super.getViewPath();
    }

    
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String showUpdateRoleForm(
            @RequestParam(value = "idUser", required = true) Long idUser,
            Model model) {
        super.init("update_user", "Modification de l'utilisateur", model);

        User user = this.userService.findUserById(idUser);
        List<Role> roles = this.userService.getAllRoles();

        super.model.addAttribute("roles", roles);
        super.model.addAttribute("userForm", user);
        return super.getViewPath();
    }

    
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateRole(
            @ModelAttribute("userForm") @Validated User userForm,
            BindingResult result,
            Model model) {
        super.init("update_user", "Modification de l'utilisateur", model);

        if (result.hasErrors()) {
            super.errors.put("form", "le formulaire n'est pas valide");
        } else {
            this.userService.updateUser(userForm);
            super.succes.put("form", "La sauvegarde a été prise en charge");
        }
        super.model.addAttribute("roles", this.userService.getAllRoles());
        super.model.addAttribute("userForm", userForm);
        return super.getViewPath();
    }

    @RequestMapping(value = "changepassword", method = RequestMethod.GET)
    public String changePassword(Model model) {

        super.init("change_password", "Changer mot de passe", model);
        return super.getViewPath();
    }

    

    @RequestMapping(value = "lock", method = RequestMethod.GET)
    public String lockUser(@RequestParam(value = "idUser", required = true) Long idUser, Model model) {
        this.userService.lockUser(idUser);
        return super.redirect("/users/list");
    }

    
    @RequestMapping(value = "unlock", method = RequestMethod.GET)
    public String unlockUser(@RequestParam(value = "idUser", required = true) Long idUser, Model model) {
        this.userService.unlockUser(idUser);
        return super.redirect("/users/list");
    }

    
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "idUser", required = true) long idUser, Model model) {
        this.userService.deleteUser(idUser);
        return super.redirect("/users/list");

    }

    
    @InitBinder
    public void dataBinding(WebDataBinder binder) {
        binder.registerCustomEditor(List.class, "roles", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                String[] ids = text.split(",");
                List<Role> roles = new ArrayList<>();
                for (String id : ids) {
                    roles.add(userService.findRole(Long.parseLong(id)));
                }
                setValue(roles);
            }
        });
    }

}
