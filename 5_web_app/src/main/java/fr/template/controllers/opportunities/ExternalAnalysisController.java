/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.controllers.opportunities;

import fr.template.abstractClasses.AbstractController;
import fr.template.models.opportunities.ExternalOpportunity;
import fr.template.services.opportunities.ExternalOpportunityService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author zouhairhajji
 */
@RequestMapping(value = "opportunities/external_data")
@Controller
public class ExternalAnalysisController extends AbstractController{

    @Autowired
    private ExternalOpportunityService externalOpportunityService;
    
    
    public ExternalAnalysisController() {
        super("external_data_analysis");
    }
    
    
    @GetMapping("list")
    public String listAllOpportunites(Model model){
        super.init("list_all", "Données externes", model);
        
        List<ExternalOpportunity> opportunities = this.externalOpportunityService.listAllOpprtunities();
        super.model.addAttribute("list_opportunities", opportunities);
        
        return super.getViewPath();
    }
    
    
    
}
