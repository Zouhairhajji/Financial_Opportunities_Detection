/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.controllers.opportunities;

import fr.template.abstractClasses.AbstractController;
import fr.template.models.opportunities.SentimentEntity;
import fr.template.services.opportunities.SentimentService;
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
@RequestMapping(value = "opportunities/sentiment")
@Controller
public class SentimentController extends AbstractController{

    @Autowired
    private SentimentService sentimentService;
    
    
    
    public SentimentController() {
        super("sentiment_analysis");
    }
    
    
    @GetMapping("list")
    public String listAll(Model model){
        super.init("list_all", "Données externes", model);
        
        List<SentimentEntity> sentiments = this.sentimentService.findAllSentiments();
        super.model.addAttribute("list_sentiments", sentiments);
        
        return super.getViewPath();
    }
    
    
    
}
