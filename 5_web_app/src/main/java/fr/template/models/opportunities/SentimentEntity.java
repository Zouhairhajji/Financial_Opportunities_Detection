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
@Table(name = "algo_sentimental_analysis")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SentimentEntity implements Serializable {
    
    @Id
    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_id")
    private String companyId;
    
    @Column(name = "flag")
    private String flag;
    
    @Column(name = "flag_gravity")
    private Long flagGravity;
    
    @Column(name = "negative")
    private Float negSentiment;
    
    @Column(name = "positive")
    private Float posSentiment;
    
    @Column(name = "neutre")
    private Float neuSentiment;
    
    @Column(name = "neg_tweets")
    private String negTweets;
    
    
}
