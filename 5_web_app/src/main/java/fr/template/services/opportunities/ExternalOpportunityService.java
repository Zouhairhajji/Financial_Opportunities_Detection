/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.services.opportunities;

import fr.template.models.opportunities.ExternalOpportunity;
import fr.template.repositories.opportunities.ExternalOpportunityRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author zouhairhajji
 */
@Service("externalOpportunityService")
public class ExternalOpportunityService {

    @Autowired
    private ExternalOpportunityRepository externalOpportunityRepository;

    @Transactional
    public List<ExternalOpportunity> listAllOpprtunities() {
        return this.externalOpportunityRepository.findAll();
    }
}
