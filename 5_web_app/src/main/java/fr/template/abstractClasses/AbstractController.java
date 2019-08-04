/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.abstractClasses;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

/**
 *
 * @author fqlh0717
 */
@Controller
public abstract class AbstractController {

    private final static Logger logger = Logger.getLogger(AbstractController.class);

    @Autowired
    protected MessageSource messageSource;

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpServletResponse response;

    protected Model model;

    protected String msg, css;

    protected Map<String, String> errors;

    protected Map<String, String> succes;

    protected String folderView;
    protected String fileView;

    public String getMessage(String localParmeter) {
        Locale locale = LocaleContextHolder.getLocale();
        String message = messageSource.getMessage(localParmeter, null, locale);
        return message;
    }

    public AbstractController(String folderView) {
        this.errors = new HashMap<String, String>();
        this.succes = new HashMap<String, String>();
        this.msg = "";
        this.css = "";
        this.folderView = folderView;
    }

    protected void init(String fileName, String title, Model model) {
        Calendar cal = Calendar.getInstance();
        this.fileView = fileName;
        this.model = model;
        this.errors.clear();
        this.succes.clear();
        this.model.addAttribute("title", title);
        this.model.addAttribute("errors", this.errors);
        this.model.addAttribute("succes", this.succes);
        this.model.addAttribute("current", cal.getTimeInMillis());

        //logger.info("USER=[" + getAuthentication().getName() + "], autorities=[" + getAuthentication().getAuthorities() + "], addr=[" + this.request.getRemoteAddr() + "], method=[" + this.request.getMethod() + "], uri=[" + this.request.getRequestURL() + "], param=[" + this.request.getQueryString() + "]");
    }

    protected String redirect(String redirectPath) {
        logger.info("Redirect user to " + redirectPath);
        return "redirect:" + redirectPath;
    }

    protected String getViewPath() {
        String filePath = this.folderView + System.getProperty("file.separator") + this.fileView;
        logger.info("The view {" + filePath + "} will be displayed.");
        return filePath;
    }

}
