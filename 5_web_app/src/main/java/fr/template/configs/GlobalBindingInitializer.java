/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.configs;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

/**
 *
 * @author fqlh0717
 */
@ControllerAdvice
public class GlobalBindingInitializer {

    @InitBinder
    public void binder(WebDataBinder binder) {
        // will be used to trim all strings from all the forms
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }
}
