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
        <link rel="stylesheet" href="<c:url value="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" />">
    </head>
    <body class="skin-blue sidebar-mini sidebar-collapse" style="height: auto; min-height: 100%;">
        <div class="wrapper">
            <jsp:include page="/WEB-INF/views/template/navbar.jsp" />
            <jsp:include page="/WEB-INF/views/template/left_bar.jsp" />
            <div class="content-wrapper">


                <section class="content">
                    <spring:message code="lang"  var="lang"/>
                    <div class="box">
                        <div class="box-body">


                            <jsp:include page="/WEB-INF/views/template/messages.jsp" />

                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th><spring:message code="as.label" /></th>
                                            <th><spring:message code="role.list.default" /></th>
                                            <th><spring:message code="role.list.createDate" /></th>
                                            <th><spring:message code="role.list.numUser" /></th>
                                            <th><spring:message code="role.list.numCom" /></th>
                                            <th><spring:message code="as.action" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>       
                                        <c:forEach var="role" items="${list_roles}">
                                            <tr>
                                                <td>${role.label}</td>
                                                <td>${role.defaultRole}</td>

                                                <td>${role.dateCreation}</td>
                                                <td>${fn:length(role.users)}</td>
                                                <td>${fn:length(role.useCases)}</td>
                                                <td>${fn:length(role.viewComponents)}</td>
                                                <td>
                                                    <a href="<c:url value="/roles/showdetail?idRole=${role.idRole}" />" class="btn btn-flat btn-xs bg-blue"><spring:message code="role.consult" /></a>
                                                    <a href="<c:url value="/roles/update?idRole=${role.idRole}" />" class="btn btn-flat btn-xs bg-blue"><spring:message code="role.modify" /></a>
                                                    <a href="#"
                                                       data-href="<c:url value="/roles/delete?idRole=${role.idRole}" />"
                                                       class="btn btn-flat btn-xs bg-danger"  
                                                       data-content="${role.label}" 
                                                       data-toggle="modal" 
                                                       data-target="#confirm-delete-modal"><spring:message code="role.remove" /></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="box-footer">
                            <div class="box-footer">
                                <div class="col-lg-6">
                                    <a href="<c:url value="/roles/list" />" class="btn btn-block btn-primary btn-flat"><spring:message code="as.refresh" /></a>
                                </div>
                                <div class="col-lg-6">
                                    <a href="<c:url value="/roles/add" />" class="btn btn-block btn-primary btn-flat"><spring:message code="role.add.nom" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="/WEB-INF/views/template/footer.jsp" />
            <jsp:include page="/WEB-INF/views/template/right_bar.jsp" />
        </div>
        <jsp:include page="/WEB-INF/views/template/javascript.jsp" />
        <jsp:include page="/WEB-INF/views/template/confirm-delete-modal.jsp" />
        <script src="<c:url value="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js" />"></script>
        <script src="<c:url value="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
        <script>
            $(function () {
                $('.table').DataTable({
                    'language': {
                        'url': '<c:url value="/resources/bower_components/datatables.net/langue_${lang}.json" />'
                    },
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': true
                })
                $('#confirm-delete-modal').on('show.bs.modal', function (e) {
                    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
                    $("#confirm-delete-modal .modal-body").html('<spring:message code="delete.modal.role" /> <strong>' + $(e.relatedTarget).data('content') + '</strong>');
                });
            })
        </script>
    </body>
</html>
