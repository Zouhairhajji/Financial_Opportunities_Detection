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
                    <spring:message code="lang"  var="lang"/>
                    <jsp:include page="/WEB-INF/views/template/messages.jsp" />
                    <spring:message code="pv.title.authorized" var="authYes"/>
                    <spring:message code="pv.title.nonauthorized" var="authNo"/>
                    <div class="row">
                        <div class="col-sm-6 ">
                            <div class="info-box">
                                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text"><spring:message code="pv.title.list.favorite" /></span>
                                    <span class="info-box-number"><a href="<c:url value="/favorites/list" />" class="btn btn-default btn-flat" ><spring:message code="pv.action.list.favorite" /></a></small></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2 ">
                            <a class="btn btn-app" href="<c:url value="/users/changepassword/"/>">
                                <i class="fa fa-edit"></i> <spring:message code="pv.action.midifaction.password" /> 
                            </a>
                        </div>
                        <div class="col-sm-2 ">
                            <button class="btn btn-app" id="refresh_context">
                                <i class="fa fa-refresh"></i> <spring:message code="pv.action.refresh.context" /> 
                            </button>
                        </div>
                    </div>
                    <br />


                    <div class="row">

                        <div class="col-sm-6 ">
                            <div class="box collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><spring:message code="pv.title.history.selflogin" /></h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-hover" id="histoire">
                                            <thead>
                                                <tr>
                                                    <th>Date</th>
                                                    <th>Authentification</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${sessionScope.USER_LIST_AUTHENTIFICATION}" var="auth">
                                                    <tr>
                                                        <td>${auth.authDate}</td>
                                                        <td>
                                                            <span class="label label-${auth.successed == true ? 'success' : 'warning'}">${auth.successed == true ? authYes : authNo}</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <c:if test="${fn:containsIgnoreCase(sessionScope.USER_LIST_ROLES, 'ROLE_ADMIN')}" >
                            <div class="col-sm-6 ">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"><spring:message code="pv.title.history.login" /></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="box-body table-responsive no-padding">
                                            <table class="table table-hover" id="histoireGlobal">
                                                <thead>
                                                    <tr>
                                                        <th><spring:message code="user.allname" /></th>
                                                        <th><spring:message code="user.nom" /></th>
                                                        <th><spring:message code="user.prenom" /></th>
                                                        <th>Date</th>
                                                        <th>Authentification</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach  items="${auths}" var="auth">

                                                        <tr class="table-${auth.successed == true ? 'danger' : 'success'}">
                                                            <td><c:out value="${auth.username}" /></td>
                                                            <td><c:out value="${auth.nom}" /></td>
                                                            <td><c:out value="${auth.prenom}" /></td>
                                                            <td><c:out value="${auth.authDate}" /></td>
                                                            <td>
                                                                <span class="label label-${auth.successed == true ? 'success' : 'warning'}">${auth.successed == true ? authYes : authNo}</span>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if> 
                    </div>


                    <div class="row">

                        <div class="col-sm-4 ">
                            <div class="box collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><spring:message code="pv.title.list.workflow" /></h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-hover" id="workFlow">
                                            <thead>
                                                <tr>
                                                    <th><spring:message code="pv.title.name" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${sessionScope.USER_LIST_WORKFLOW}" var="workflow">
                                                    <tr>
                                                        <td>${workflow}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-4 ">
                            <div class="box collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><spring:message code="pv.title.list.bundle" /></h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-hover" id="bundle">
                                            <thead>
                                                <tr>
                                                    <th><spring:message code="pv.title.name" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${sessionScope.USER_LIST_BUNDLE}" var="bundle">
                                                    <tr>
                                                        <td>${bundle}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-4 ">
                            <div class="box collapsed-box">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><spring:message code="pv.title.list.usecase" /></h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-hover" id="useCase">
                                            <thead>
                                                <tr>
                                                    <th><spring:message code="pv.title.name" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${sessionScope.USER_LIST_USE_CASE}" var="entry">
                                                    <tr>
                                                        <td>${entry.key}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
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
        <jsp:include page="/WEB-INF/views/template/javascript_helper.jsp" />
        <jsp:include page="/WEB-INF/views/template/commonJSP.jsp" />
        <script src="<c:url value="/resources/bower_components/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
        <script src="<c:url value="/resources/bower_components/bootstrap-datepicker/locales/bootstrap-datepicker.fr.min.js" />"></script>
        <script src="<c:url value="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js" />"></script>
        <script src="<c:url value="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
    </body>
</html>
<script>
    $(function () {
        $('table').DataTable({
            'language': {
                'url': '<c:url value="/resources/bower_components/datatables.net/langue_${lang}.json" />'
            },
            'paging': true,
            'lengthChange': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': true
        });
        $('#refresh_context').on('click', function () {
            show_loading_frame()
            var content = make_call('/ajax/auth/refresh');
            hide_loading_frame()
        })
    });








</script>