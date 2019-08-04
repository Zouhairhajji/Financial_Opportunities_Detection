/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.authentification;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author FQLH0717
 */
@Entity
@Table(name = "roles")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Role implements Serializable {

    @Id
    @Column(name = "id_role")
    @GenericGenerator(
            name = "role_id_seq",
            strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
            parameters = {
                @Parameter(name = "sequence_name", value = "role_id_seq")
                ,
                @Parameter(name = "role_id_seq", value = "1000")
                ,
                @Parameter(name = "increment_size", value = "1")
            }
    )
    @GeneratedValue(generator = "role_id_seq")
    private Long idRole;

    @NotNull
    @Column(name = "role")
    private String label;

    @Column(name = "is_default")
    private boolean defaultRole;

    @Column(name = "date_creation")
    private Timestamp dateCreation;

    @ManyToMany()
    @JoinTable(name = "role_users",
            joinColumns = @JoinColumn(name = "id_role"),
            inverseJoinColumns = @JoinColumn(name = "id_user")
    )
    private List<User> users;

}
