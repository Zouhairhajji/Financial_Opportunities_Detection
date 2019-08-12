/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.customer;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author zouhairhajji
 */
public class TransactionEntity implements Serializable{
    
    @Id
    @Column(name = "id_transaction")
    @GenericGenerator(
            name = "id_transaction_seq",
            strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
            parameters = {
                @Parameter(name = "sequence_name", value = "id_transaction_seq")
                ,
                @Parameter(name = "id_transaction_seq", value = "1000")
                ,
                @Parameter(name = "increment_size", value = "1")
            }
    )
    private Long transactionId;
    
    
    @Column(name = "nbi")
    private float nbi;
    
    @Column(name = "rwa")
    private float rwa;
    
    @Column(name = "product_name")
    private String productName;
    
    @Column(name = "order_date")
    private Date order_date;
    
    
    @ManyToOne
    @JoinColumn
    private CustomerEntity customer;
    
}
