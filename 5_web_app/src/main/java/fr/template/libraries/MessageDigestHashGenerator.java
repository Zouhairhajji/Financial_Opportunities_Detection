/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.libraries;

import java.security.MessageDigest;

/**
 *
 * @author fqlh0717
 */
public class MessageDigestHashGenerator implements HashGeneratorInterface {

    private MessageDigest messageDigest;

    /**
     *
     * @param algorithim
     */
    public MessageDigestHashGenerator(String algorithim) {
        try {
            this.messageDigest = MessageDigest.getInstance(algorithim);
        } catch (Exception e) {
            System.err.println("Error setting algorithim: " + algorithim);
        }
    }

    /**
     *
     * @param input
     * @return
     */
    public byte[] generate(String input) {
        return this.messageDigest.digest(input.getBytes());
    }
}
