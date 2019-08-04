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
                        <div class="box-body">

                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th><spring:message code="user.id" /></th>
                                            <th><spring:message code="user.nom" /></th>
                                            <th><spring:message code="user.prenom" /></th>
                                            <th><spring:message code="user.num" /></th>
                                            <th><spring:message code="user.activ" /></th>
                                            <th><spring:message code="as.role" /></th>
                                            <th><spring:message code="as.action" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${list_users}">
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>${user.firstName}</td>
                                                <td>${user.lastName}</td>
                                                <td>${user.phoneNumber}</td>
                                                <td>${user.enabled}</td>
                                                <td> 
                                                    <c:forEach var="role" items="${user.roles}">
                                                        <label class="label bg-black">${role.label}</label>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <a href="<c:url value="/users/lock?idUser=${user.idUser}" />" class="btn btn-flat btn-xs bg-blue"><spring:message code="as.lock" /></a>
                                                    <a href="<c:url value="/users/unlock?idUser=${user.idUser}" />" class="btn btn-flat btn-xs bg-blue"><spring:message code="as.delock" /></a>
                                                    <a href="<c:url value="/users/update?idUser=${user.idUser}" />" class="btn btn-flat btn-xs bg-blue"><spring:message code="as.update" /></a>
                                                    <a href="#"
                                                       data-href="<c:url value="/users/delete?idUser=${user.idUser}" />"
                                                       class="btn btn-flat btn-xs bg-danger"  
                                                       data-content="${user.idUser}" 
                                                       data-toggle="modal" 
                                                       data-target="#confirm-delete-modal"><spring:message code="as.delete" /></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </section>
            </div>
            <%@include file="/WEB-INF/views/template/footer.jsp" %>
            <%@include file="/WEB-INF/views/template/right_bar.jsp" %>
        </div>


        <%@include file="/WEB-INF/views/template/javascript.jsp" %>
        <%@include file="/WEB-INF/views/template/commonJSP.jsp" %>
        <script>

            $('#confirm-delete-modal').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
                $("#confirm-delete-modal .modal-body").html('fezfe');
            });
        </script>

    </body>
</html>
