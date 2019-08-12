/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.repositories.opportunities;

import fr.template.models.opportunities.CrossSellingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author zouhairhajji
 */
public interface CrossSellingRepository extends JpaRepository<CrossSellingEntity, String>{
    
    
    
}
