<%-- 
    Document   : homePage
    Created on : 8 août 2017, 16:03:41
    Author     : fqlh0717
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/views/template/header.jsp" />
        <link rel="stylesheet" href="<c:url value="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" />">
    </head>
    <body class="skin-blue sidebar-mini sidebar-collapse" style="height: auto; min-height: 100%;">
        <div class="wrapper">
            <jsp:include page="/WEB-INF/views/template/navbar.jsp" />
            <jsp:include page="/WEB-INF/views/template/leftmenu.jsp" />
            <div class="content-wrapper">
                <section class="content">
                    <jsp:include page="/WEB-INF/views/template/messages.jsp" />
                    <div class="login-box">
                        <div class="login-logo">
                            <a href=""><b>Mod</b>ification <spring:message code="login.create.password" /></a>
                        </div>
                        <form:form class="form-horizontal" >
                            <!-- /.login-logo -->
                            <div class="login-box-body">
                                

                                <div class="row">
   
                                
                                            <div class="col-sm-12">
                                                <spring:message code="password.modification.placehodler.newpw" var="ph_pw_new" />
                                                <input  class="form-control" minlength="6"   
                                                        type="text"
                                                        placeholder="${ph_pw_new}" 
                                                        class="form-control" 
                                                        id="inputPassword" 
                                                        name="inputPassword"
                                                        required="required" AUTOCOMPLETE='OFF' />

                                            </div>
                                     
                             
                                </div>

                                <br />

                                
                                
                                
                                <div class="row">
                                    <div class="col-sm-12">
                                        <spring:message code="login.create.confirm.password" var="ph_pw_conf" />
                                        <input  class="form-control"  
                                                type="text"
                                                placeholder="${ph_pw_conf}" 
                                                class="form-control" 
                                                id="inputPasswordConfirm" 
                                                name="inputPasswordConfirm"
                                                required="required" onpaste="return false;" AUTOCOMPLETE='OFF'/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <button type="submit"  class="btn btn-primary btn-block btn-flat"><spring:message code="password.modification.bouton.modify" /></button>
                                    </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col-sm-12">
                                        <a href="<c:url value="/users" />"   class="btn btn-warning btn-block btn-flat" ><spring:message code="password.modification.bouton.return" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>            
                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="/WEB-INF/views/template/footer.jsp" />
            <jsp:include page="/WEB-INF/views/template/rightmenu.jsp" />
        </div>
        <div class="modal modal-danger fade" id="modal-danger">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"><spring:message code="cluster.error.alert" /></h4>
                    </div>
                    <div class="modal-body">
                        <p id="error_message" > </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Fermer</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <jsp:include page="/WEB-INF/views/template/javascript.jsp" />
    </body>
</html>
