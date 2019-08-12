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
@Table(name = "algo_rfm_analysis")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SegmentationEntity implements Serializable {

    @Id
    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_id")
    private String companyId;

    @Column(name = "country")
    private String country;

    @Column(name = "recency")
    private String recency;

    @Column(name = "frequency")
    private String frequency;

    @Column(name = "monetary")
    private String monetary;

    @Column(name = "rfm_score")
    private String rfm_score;
    
    @Column(name = "segment_name")
    private String segmentName;
    
     

}
