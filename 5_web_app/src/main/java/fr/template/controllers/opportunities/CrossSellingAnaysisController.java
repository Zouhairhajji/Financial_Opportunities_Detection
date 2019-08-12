/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.controllers.opportunities;

import fr.template.abstractClasses.AbstractController;
import fr.template.models.opportunities.CrossSellingEntity;
import fr.template.services.opportunities.CrossSellingService;
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
@RequestMapping(value = "opportunities/cross_selling")
@Controller
public class CrossSellingAnaysisController extends AbstractController{

    @Autowired
    private CrossSellingService crossSellingService;
    
    
    
    public CrossSellingAnaysisController() {
        super("cross_selling_analysis");
    }
    
    
    @GetMapping("list")
    public String listAllOpportunites(Model model){
        super.init("list_all", "Données externes", model);
        
        List<CrossSellingEntity> opportunities = this.crossSellingService.findAllCrossSellingOpportunities();
        super.model.addAttribute("list_opportunities", opportunities);
        
        return super.getViewPath();
    }
    
    
    
}
