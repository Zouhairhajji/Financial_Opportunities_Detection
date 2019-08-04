/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.configs;

import fr.template.models.authentification.Role;
import fr.template.models.authentification.User;
import fr.template.services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author zouhairhajji
 */
@Configuration
public class BootstrapConfig implements ApplicationListener<ApplicationReadyEvent> {

    @Autowired
    private UserService userService;

    private final static Logger logger = Logger.getLogger(BootstrapConfig.class);

    @Override
    public void onApplicationEvent(ApplicationReadyEvent e) {
        long countRoles = this.userService.countRoles();
        if (countRoles == 0) {
            this.userService.saveRole(Role
                    .builder()
                    .defaultRole(false)
                    .label("ROLE_ADMIN")
                    .build());
            this.userService.saveRole(Role
                    .builder()
                    .defaultRole(false)
                    .label("ROLE_DEV")
                    .build());
            this.userService.saveRole(Role
                    .builder()
                    .defaultRole(true)
                    .label("ROLE_USER")
                    .build());
            logger.info("3 roles was created ...");
        }else {
            logger.info("no need to create a default roles ...");
        }
        

        long countUsers = this.userService.countUsers();
        if (countUsers == 0) {
            // we need to create an admin account
            try {
                User adminUser = User
                        .builder()
                        .email("admin@admin.fr")
                        .firstName("admin")
                        .lastName("admin")
                        .username("admin")
                        .password("admin")
                        .phoneNumber("0000000000")
                        .build();
                this.userService.registerUser(adminUser);
                adminUser = this.userService.getAllUsers().stream().findAny().get();
                adminUser.setRoles(this.userService.getAllRoles());
                adminUser.setEnabled(true);
                this.userService.updateUser(adminUser);

                logger.info("default user created successfully ...");
                
            } catch (Exception ex) {
                logger.fatal("cannot create an admin account ...", ex);
            }
        }else {
            logger.info("no need to create a default user ...");
        }
    }

}
