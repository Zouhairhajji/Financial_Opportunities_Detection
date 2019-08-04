/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.authentification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author fqlh0717
 */
@Entity
@Table(name = "users")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements Serializable, UserDetails {

    @Id
    @Column(name = "id_user")
    @GenericGenerator(
            name = "users_id_seq",
            strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
            parameters = {
                @Parameter(name = "sequence_name", value = "role_id_seq")
                ,
                @Parameter(name = "users_id_seq", value = "1000")
                ,
                @Parameter(name = "increment_size", value = "1")
            }
    )
    @GeneratedValue(generator = "users_id_seq")
    private Long idUser;

    @NotNull
    @Column(name = "user_name", unique = true)
    private String username;

    @NotNull
    @Size(min = 2, max = 124)
    @Column(name = "password")
    private String password;

    @NotNull
    @Size(min = 2, max = 15)
    @Column(name = "first_name")
    private String firstName;

    @NotNull
    @Size(min = 2, max = 15)
    @Column(name = "last_name")
    private String lastName;


    @NotNull
    @Size(min = 5, max = 50)
    @Column(name = "email")
    private String email;

    @NotNull
    @Size(min = 10, max = 15)
    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "isactive")
    private boolean enabled;

    @Column(name = "date_creation")
    private Timestamp dateCreation;

    @Column(name = "identicon", length = 2000)
    private String identicon;

    @JsonIgnore
    @ManyToMany()
    @JoinTable(name = "role_users",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_role")
    )
    private List<Role> roles;

    
    // OVERIDDED METHODS
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.getRoles().stream()
                .map(s -> new SimpleGrantedAuthority(s.getLabel()))
                .collect(Collectors.toList());
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }

}
