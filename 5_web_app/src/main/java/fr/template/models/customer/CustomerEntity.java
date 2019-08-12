/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.models.customer;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author zouhairhajji
 */
public class CustomerEntity  implements Serializable{

    @Id
    @Column(name = "id_customer")
    @GenericGenerator(
            name = "id_customer_seq",
            strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
            parameters = {
                @Parameter(name = "sequence_name", value = "id_customer_seq")
                ,
                @Parameter(name = "id_customer_seq", value = "1000")
                ,
                @Parameter(name = "increment_size", value = "1")
            }
    )
    private Long idCustomer;

    
    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "customer_sector")
    private String customerSector;
    
    
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private List<TransactionEntity> transactions;

}
