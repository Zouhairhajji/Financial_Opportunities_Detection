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
    </head>
    <body class="skin-blue sidebar-mini sidebar-collapse" style="height: auto; min-height: 100%;">
        <div class="wrapper">
            <jsp:include page="/WEB-INF/views/template/navbar.jsp" />
            <jsp:include page="/WEB-INF/views/template/leftmenu.jsp" />
            <div class="content-wrapper">
                <section class="content">
                    <jsp:include page="/WEB-INF/views/template/messages.jsp" />
                    <form:form class="form-horizontal"  modelAttribute="formRole">
                        <div class="box-body">
                            <form:hidden path="idRole" />

                            <spring:bind path="label">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label class="col-sm-2 control-label"><spring:message code="as.label" /> :</label>
                                    <div class="col-sm-10">
                                        <form:input path="label" type="text" class="form-control" placeholder="Nom du label (Ex: ROLE_XXXX)" />
                                        <form:errors path="label" class="control-label" />
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="defaultRole">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label class="col-sm-2 control-label"><spring:message code="role.list.default" /> : </label>
                                    <div class="col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <form:checkbox path="defaultRole" id="defaultRole" />
                                            </label>
                                            <form:errors path="defaultRole" class="control-label" />
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>
                            
                            <spring:bind path="viewComponents">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label class="col-sm-2 control-label"><spring:message code="as.com" /> :</label>
                                    <div class="col-sm-5">
                                        <form:select path="viewComponents" items="${viewComponents}" itemLabel="label" itemValue="idViewComponent"
                                                     multiple="true" size="5" class="form-control" />
                                        <form:errors path="viewComponents" class="control-label" />
                                    </div>
                                    <div class="col-sm-5"></div>
                                </div>
                            </spring:bind>
                            
                        </div>
                        <div class="box-footer">
                            <div class="col-lg-6">
                                <button type="submit" class="btn btn-block btn-primary btn-flat"><spring:message code="as.add" /></button>
                            </div>
                            <div class="col-lg-6">
                                <a href="<c:url value="/roles/list" />" class="btn btn-block btn-primary btn-flat"><spring:message code="as.return" /></a>
                            </div>
                        </div>
                    </form:form>
                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="/WEB-INF/views/template/footer.jsp" />
            <jsp:include page="/WEB-INF/views/template/rightmenu.jsp" />
        </div>
        <jsp:include page="/WEB-INF/views/template/javascript.jsp" />
    </body>
</html>