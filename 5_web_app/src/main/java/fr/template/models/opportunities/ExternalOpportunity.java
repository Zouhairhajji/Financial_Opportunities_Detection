/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.opportunities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author zouhairhajji
 */
@Entity
@Table(name = "algo_external_data_analysis")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExternalOpportunity  implements Serializable {
    
    @Id
    @Column(name = "company_name")
    private String companyName;
    
    
    @Column(name = "final_potential")
    private Float finalPotential;
    
    @Column(name = "forecast_nbi")
    private Float forecastNbi;
    
    @Column(name = "final_potential_nbi")
    private Float finalPotentialNbi;
    
    @Column(name = "final_rank")
    private Integer finalRank;
    
    @Column(name = "segment_name")
    private String segmentName;
    
     @Column(name = "product_name")
    private String productName;
    
    @Column(name = "state_banker")
    private String state;
    
    
    
    
    
    
    
    
    
}
