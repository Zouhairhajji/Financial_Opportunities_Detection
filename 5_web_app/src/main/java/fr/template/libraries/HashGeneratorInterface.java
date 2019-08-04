/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.libraries;

/**
 *
 * @author fqlh0717
 */
public interface HashGeneratorInterface {

    /**
     *
     * @param userName
     * @return
     */
    byte[] generate(String userName);
}
