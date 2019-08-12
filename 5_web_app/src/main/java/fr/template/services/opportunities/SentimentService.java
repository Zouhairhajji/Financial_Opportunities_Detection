/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.services.opportunities;

import fr.template.models.opportunities.SentimentEntity;
import fr.template.repositories.opportunities.SentimentRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author zouhairhajji
 */
@Service("sentimentService")
public class SentimentService {

    @Autowired
    private SentimentRepository sentimentRepository;

    @Transactional
    public List<SentimentEntity> findAllSentiments() {
        return this.sentimentRepository.findAll();
    }
}
