<%-- 
    Document   : commonJSP
    Created on : 6 sept. 2018, 17:02:00
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal modal-info fade in" id="confirm-delete-modal" role="dialog" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
                <h4 class="modal-title">Merci de valider</h4>
            </div> 
            <div class="modal-body">
                Vous voulez vraiment valider ?
            </div>   
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                <a class="btn btn-info btn-ok">Valider</a>
            </div> 
        </div>
    </div>
</div>
