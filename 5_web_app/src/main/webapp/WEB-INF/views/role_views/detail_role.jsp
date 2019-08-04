<%-- 
    Document   : homePage
    Created on : 8 août 2017, 16:03:41
    Author     : fqlh0717
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    <div class="box">
                        <div class="box-body">
                            
                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="user.id" />  :</strong>
                                <p class="text-muted">
                                    <a> [ ${role_detail.idRole} ]</a>
                                </p>
                                </ul>
                            </div>

                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="as.label" />  :</strong>
                                <p class="text-muted">
                                    <a> [ ${role_detail.label} ]</a>
                                </p>
                                </ul>
                            </div>

                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="role.list.createDate" />  :</strong>
                                <p class="text-muted">
                                    <a> [ ${role_detail.defaultRole} ]</a>
                                </p>
                                </ul>
                            </div>

                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="role.list.default" />  :</strong>
                                <p class="text-muted">
                                    <a> [ ${role_detail.dateCreation} ]</a>
                                </p>
                                </ul>
                            </div>
                                
                      
                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="role.user" /> </strong>
                                <p class="text-muted">
                                    <c:forEach var="user" items="${role_detail.users}">
                                        <a> [ ${user.username} ]</a>
                                    </c:forEach>
                                </p>
                                </ul>
                            </div>


                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="as.uc" /> :</strong>
                                <p class="text-muted">
                                    <c:forEach var="useCase" items="${role_detail.useCases}">
                                        <a> [ ${useCase.useCase} ]</a>
                                    </c:forEach>
                                </p>
                                </ul>
                            </div>

                            <div class="form-group">
                                <strong><i class="fa fa-book margin-r-5"></i> <spring:message code="as.com" /> :</strong>
                                <p class="text-muted">
                                    <c:forEach var="component" items="${role_detail.viewComponents}">
                                        <a> [ ${component.label} ]</a>
                                    </c:forEach>
                                </p>
                                </ul>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-lg-12">
                                <a href="<c:url value="/roles/list" />" class="btn btn-block btn-primary btn-flat"><spring:message code="as.return" /></a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="/WEB-INF/views/template/footer.jsp" />
            <jsp:include page="/WEB-INF/views/template/rightmenu.jsp" />
        </div>
        <jsp:include page="/WEB-INF/views/template/javascript.jsp" />
    </body>
</html>