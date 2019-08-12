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
import lombok.ToString;

/**
 *
 * @author zouhairhajji
 */
@Entity
@Table(name = "algo_cross_selling_analysis")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class CrossSellingEntity  implements Serializable {
    
    @Id
    @Column(name = "company_name")
    private String companyName;
    
    
    @Column(name = "company_id")
    private String companyId;
    
    @Column(name = "country")
    private String country;
    
    @Column(name = "sector_name")
    private String sector;
    
    
    @Column(name = "product_bought")
    private String productBought;
    
    @Column(name = "all_product_group")
    private String productOfGroup;
    
    
    @Column(name = "unbought_products")
    private String unboductBought;
    
    @Column(name = "diff_count")
    private Integer diffCount;
    
}
