<%-- 
    Document   : dashboard
    Created on : 6 sept. 2018, 10:53:53
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/views/template/header.jsp" %>
    </head>

    <body class="hold-transition skin-blue fixed sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">
            <%@include file="/WEB-INF/views/template/navbar.jsp" %>
            <%@include file="/WEB-INF/views/template/left_bar.jsp" %>

            <div class="content-wrapper">
                <section class="content">


                    <div class="box">
                        <form:form class="form-horizontal"  modelAttribute="userForm">
                            <div class="box-body">

                                <form:hidden path="idUser" />
                                <form:hidden path="password" />
                                <form:hidden path="identicon" />
                                <form:hidden path="dateCreation" />

                                <spring:bind path="username">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="user.allname" /> :</label>
                                        <div class="col-sm-10">
                                            <form:input path="username" type="text" class="form-control"/>
                                            <form:errors path="username" class="control-label" />
                                        </div>
                                    </div>
                                </spring:bind>


                                <spring:bind path="firstName">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="user.prenom" /> :</label>
                                        <div class="col-sm-10">
                                            <form:input path="firstName" type="text" class="form-control"/>
                                            <form:errors path="firstName" class="control-label" />
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="lastName">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="user.nom" /> :</label>
                                        <div class="col-sm-10">
                                            <form:input path="lastName" type="text" class="form-control"/>
                                            <form:errors path="lastName" class="control-label" />
                                        </div>
                                    </div>
                                </spring:bind>


                                <spring:bind path="email">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label">Email :</label>
                                        <div class="col-sm-10">
                                            <form:input path="email" type="text" class="form-control"/>
                                            <form:errors path="email" class="control-label" />
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="phoneNumber">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="user.num" /> :</label>
                                        <div class="col-sm-10">
                                            <form:input path="phoneNumber" type="text" class="form-control"/>
                                            <form:errors path="phoneNumber" class="control-label" />
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="enabled">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="user.actif" /> : </label>
                                        <div class="col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <form:checkbox path="enabled" id="defaultRole" />
                                                </label>
                                                <form:errors path="enabled" class="control-label" />
                                            </div>
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="roles">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-sm-2 control-label"><spring:message code="as.role" /> :</label>
                                        <div class="col-sm-5">
                                            <form:select path="roles" items="${roles}" itemLabel="label" itemValue="idRole"
                                                         multiple="true" size="5" class="form-control" />
                                            <form:errors path="roles" class="control-label" />
                                        </div>
                                        <div class="col-sm-5"></div>
                                    </div>
                                </spring:bind>
                            </div>
                            <div class="box-footer">
                                <div class="col-lg-6">
                                    <button type="submit" class="btn btn-block btn-primary btn-flat"><spring:message code="as.update" /></button>
                                </div>
                                <div class="col-lg-6">
                                    <a href="<c:url value="/users/list" />" class="btn btn-block btn-primary btn-flat"><spring:message code="as.return" /></a>
                                </div>
                            </div>
                        </div>
                    </form:form>

                </section>
            </div>
            <%@include file="/WEB-INF/views/template/footer.jsp" %>
            <%@include file="/WEB-INF/views/template/right_bar.jsp" %>
        </div>


        <%@include file="/WEB-INF/views/template/javascript.jsp" %>
        <%@include file="/WEB-INF/views/template/commonJSP.jsp" %>

    </body>
</html>
