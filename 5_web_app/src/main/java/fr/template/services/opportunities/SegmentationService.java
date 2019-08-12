/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.services.opportunities;

import fr.template.models.opportunities.SegmentationEntity;
import fr.template.repositories.opportunities.SegmentationRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author zouhairhajji
 */
@Service("segmentationService")
public class SegmentationService {

    @Autowired
    private SegmentationRepository segmentationRepository;

    @Transactional
    public List<SegmentationEntity> listAllSegmentations() {
        return this.segmentationRepository.findAll();
    }
}
