/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.repositories;

import fr.template.models.authentification.Role;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author fqlh0717
 */
public interface RoleRepository extends CrudRepository<Role, Integer> {

    
    @Override
    public List<Role> findAll();

    @Query("FROM Role WHERE defaultRole = true")
    public List<Role> findDefaultRoles();

}
