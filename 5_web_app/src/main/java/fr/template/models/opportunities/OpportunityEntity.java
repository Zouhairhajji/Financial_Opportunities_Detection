/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.opportunities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author zouhairhajji
 */
@Entity
@Table(name = "financial_opportunity")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OpportunityEntity implements Serializable {
    
    @Id
    @Column(name = "id_opportunity")
    @GenericGenerator(
            name = "id_opportunity_seq",
            strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
            parameters = {
                @Parameter(name = "sequence_name", value = "id_opportunity_seq")
                ,
                @Parameter(name = "users_id_seq", value = "1000")
                ,
                @Parameter(name = "increment_size", value = "1")
            }
    )
    @GeneratedValue(generator = "id_opportunity_seq")
    private Long idOpportunity;
    
    
    
    
}
