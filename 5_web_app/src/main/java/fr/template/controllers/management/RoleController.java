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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping("roles")
public class RoleController extends AbstractController {

    @Autowired
    private UserService userService;

    public RoleController() {
        super("role_views");
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String listAllRoles(Model model) throws IOException {
        super.init("list_roles", "Liste des roles", model);
        List<Role> roles = this.userService.getAllRoles();
        super.model.addAttribute("list_roles", roles);
        return super.getViewPath();
    }

    @RequestMapping(value = "showdetail", method = RequestMethod.GET)
    public String getRoleDetail(
            @RequestParam(value = "idRole", required = true) Long idRole,
            Model model) throws IOException {

        super.init("detail_role", "Affichage des details", model);

        Role role = this.userService.findRole(idRole);
        super.model.addAttribute("role_detail", role);
        return super.getViewPath();
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String showUpdateRoleForm(
            @RequestParam(value = "idRole", required = true) Long idRole,
            Model model) throws IOException {
        super.init("update_role", "Affichage des details", model);

        Role role = this.userService.findRole(idRole);
        super.model.addAttribute("role", role);
        super.model.addAttribute("users", this.userService.getAllUsers());
        return super.getViewPath();
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateRole(
            @ModelAttribute("role") @Validated Role role,
            BindingResult result,
            Model model) throws IOException {
        super.init("update_role", "Affichage des details", model);

        if (result.hasErrors()) {
            super.errors.put("form", "le formulaire n'est pas valide");
        } else {
            this.userService.updateRole(role);
            super.succes.put("form", "La sauvegarde a été prise en charge");
        }
        super.model.addAttribute("users", this.userService.getAllUsers());
        super.model.addAttribute("role", role);
        return super.getViewPath();
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String showAddRole(Model model) {
        super.init("add_role", "Insertion d'un role", model);
        super.model.addAttribute("formRole", new Role());
        return super.getViewPath();
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addRole(@ModelAttribute("formRole") @Validated Role formRole,
            BindingResult result,
            Model model) throws IOException {
        super.init("add_role", "Insertion d'un role", model);

        if (result.hasErrors()) {
            super.errors.put("form", "le formulaire n'est pas valide");
        } else {
            this.userService.saveRole(formRole);
            super.succes.put("form", "La sauvegarde a été prise en charge");
        }
        super.model.addAttribute("formRole", formRole);
        return super.getViewPath();
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "idRole", required = true) Long idRole, Model model) {
        try {
            this.userService.deleteRole(idRole);
            return super.redirect("/roles/list");
        } catch (Exception ex) {
            super.init("list_roles", "Liste des roles", model);
            List<Role> roles = this.userService.getAllRoles();
            super.model.addAttribute("list_roles", roles);
            super.errors.put("integrity", ex.getMessage());
            return super.getViewPath();
        }
    }

    
    @InitBinder
    public void dataBinding(WebDataBinder binder) {
        binder.registerCustomEditor(List.class, "users", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                String[] ids = text.split(",");
                List<User> users = new ArrayList<User>();
                for (String id : ids) {
                    Long idUser = Long.parseLong(id);
                    users.add(userService.findUserById(idUser));
                }
                setValue(users);
            }
        });
    }
}
