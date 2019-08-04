/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.repositories;


import fr.template.models.authentification.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author fqlh0717
 */
public interface UserRepository extends CrudRepository<User, Long> {

    @Override
    public List<User> findAll();

    public Optional<User> findUserByUsername(String username);

    @Modifying
    @Query("UPDATE User SET enabled = false where idUser = ?1")
    public int setLockFor(Long idUser);

    @Modifying
    @Query("UPDATE User SET enabled = true where idUser = ?1")
    public int setUnlockFor(Long idUser);

}
