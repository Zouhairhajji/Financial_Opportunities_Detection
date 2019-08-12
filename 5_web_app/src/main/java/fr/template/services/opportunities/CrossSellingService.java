/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.services.opportunities;

import fr.template.repositories.opportunities.CrossSellingRepository;
import fr.template.models.opportunities.CrossSellingEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author zouhairhajji
 */
@Service("crossSellingService")
public class CrossSellingService {
    
    @Autowired
    private CrossSellingRepository crossSellingRepository;
    
    public List<CrossSellingEntity> findAllCrossSellingOpportunities(){
        return this.crossSellingRepository.findAll();
    }
    
}
