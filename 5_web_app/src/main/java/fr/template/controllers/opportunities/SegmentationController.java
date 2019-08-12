/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.controllers.opportunities;

import fr.template.abstractClasses.AbstractController;
import fr.template.models.opportunities.SegmentationEntity;
import fr.template.services.opportunities.SegmentationService;
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
@RequestMapping(value = "opportunities/segmentation")
@Controller
public class SegmentationController extends AbstractController{

    @Autowired
    private SegmentationService segmentationService;
    
    
    
    public SegmentationController() {
        super("segmentation_rfm_analysis");
    }
    
    
    @GetMapping("list")
    public String listAllOpportunites(Model model){
        super.init("list_all", "Données externes", model);
        
        List<SegmentationEntity> segmentations = this.segmentationService.listAllSegmentations();
        super.model.addAttribute("list_segmentations", segmentations);
        
        return super.getViewPath();
    }
    
    
    
}
