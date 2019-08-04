/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.services;

import fr.template.libraries.HashGeneratorInterface;
import fr.template.libraries.IdenticonGenerator;
import fr.template.libraries.MessageDigestHashGenerator;
import fr.template.models.authentification.Role;
import fr.template.models.authentification.User;
import fr.template.repositories.RoleRepository;
import fr.template.repositories.UserRepository;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.sql.Timestamp;
import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import javax.imageio.ImageIO;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

/**
 *
 * @author fqlh0717
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;


    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = this.userRepository.findUserByUsername(username);
        if (user.isPresent()) {
            return user.get();
        } else {
            throw new UsernameNotFoundException(MessageFormat.format("User:[{0}] not found", username));
        }
    }

    @Transactional
    public void registerUser(User user) throws Exception {
        String genPw = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10));
        Function<String, String> identiconGenerator = x -> {
            try {
                if (x == null || x.trim().equalsIgnoreCase("")) {
                    throw new Exception("not data found, default identicon ganna be assigned");
                }
                HashGeneratorInterface hashGenerator = new MessageDigestHashGenerator("MD5");
                BufferedImage bImage = IdenticonGenerator.generate(x, hashGenerator);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(bImage, "jpg", baos);
                baos.flush();
                byte[] imageInByteArray = baos.toByteArray();
                baos.close();
                return javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
            } catch (Exception e) {
                return "/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAyADIDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDgqK67+xdP/wCff/x9v8a5zVII7fUZYol2ouMDOewNI8+dGUFdlSitfQ7K3vPP8+Pft24+YjGc+n0q3qml2dvp0ssUO11xg7ie4HrQCoyceY52iiuu/sXT/wDn3/8AH2/xoFTpuexyNFdd/Yun/wDPv/4+3+NFBp9WmZ//AAkv/Tp/5E/+tR/Zv9sf6f53k+b/AAbd2Mcdcj0rBrotL1Szt9Oiilm2uucjaT3J9KAhPndqj0I/+Re/6ePP/wCAbdv5560f2l/bH+geT5Pm/wAe7djHPTA9Kg1y9t7zyPIk37d2flIxnHr9Kp6XPHb6jFLK21Fzk4z2IoBztLkT900/+Ea/6e//ACH/APXo/wCEl/6dP/In/wBatD+2tP8A+fj/AMcb/CuRoHUkqf8ADZvf8JL/ANOn/kT/AOtRWDRQZ+3qdwoorrtF/wCQRB/wL/0I0Cp0+d2ORore8S/8uv8AwP8ApVDRf+QvB/wL/wBBNASp2nyFCiu9rgqB1aXs7ahRRRQZBXXaL/yCIP8AgX/oRoooOjDfGZ/iX/l1/wCB/wBKoaL/AMheD/gX/oJoooCf8b7jrq4KiimViugUUUUjlP/Z";
            }
        };

        user.setPassword(genPw);
        user.setEnabled(false);
        user.setIdenticon(identiconGenerator.apply(user.getUsername()));

        user.setDateCreation(new Timestamp(System.currentTimeMillis()));

        List<Role> defaultRoles = this.roleRepository.findDefaultRoles();
        if (defaultRoles == null || defaultRoles.isEmpty()) {
            throw new Exception("No default groupe found");
        }
        user.setRoles(defaultRoles);

        this.userRepository.save(user);
    }

    @Transactional
    public List<Role> getAllRoles() {
        return this.roleRepository.findAll();
    }

    @Transactional
    public Role findRole(Integer idRole) {
        return this.roleRepository.findOne(idRole);
    }

    @Transactional
    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }
    
    @Transactional
    public long countUsers() {
        return this.userRepository.count();
    }

    @Transactional
    public long countRoles() {
        return this.roleRepository.count();
    }
    
    @Transactional
    public Role updateRole(Role role) {
        return this.roleRepository.save(role);
    }

    @Transactional
    public Role saveRole(Role formRole) {
        formRole.setDateCreation(new Timestamp(System.currentTimeMillis()));
        return this.roleRepository.save(formRole);
    }

    @Transactional
    public void deleteRole(Integer idRole) {
        this.roleRepository.delete(idRole);
    }

    @Transactional
    public User findUserById(Long idUser) {
        return this.userRepository.findOne(idUser);
    }

    @Transactional
    public void updateUser(User userForm) {
        this.userRepository.save(userForm);
    }

    @org.springframework.transaction.annotation.Transactional
    public void lockUser(Long idUser) {
        this.userRepository.setLockFor(idUser);
    }

    /**
     *
     * @param idUser
     */
    @org.springframework.transaction.annotation.Transactional
    public User unlockUser(Long idUser) {
        this.userRepository.setUnlockFor(idUser);
        User user = this.userRepository.findOne(idUser);
        return user;
    }

    @Transactional
    public void deleteUser(Long idUser) {
        User user = this.userRepository.findOne(idUser);
        this.userRepository.delete(user);
    }
}
