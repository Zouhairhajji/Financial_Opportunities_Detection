<%-- 
    Document   : left_bar
    Created on : 6 sept. 2018, 17:00:47
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"> <spring:message code="app.small.name" /> </span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><spring:message code="app.name" /></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">



                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img height="160" width="160" src="data:image/png;base64, ${IMAGE_B64}" class="user-image" alt="User Image">
                        <span class="hidden-xs">${FULL_NAME}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img height="160" width="160" src="data:image/png;base64, ${IMAGE_B64}" class="img-user" alt="User Image">

                            <p>
                                <small>Bonjour, </small>
                                <small>Le(s) role(s) ${USER_LIST_ROLES}</small>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a  href="<c:url value="/login?logout" />" class="btn btn-default btn-flat" >Logout</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
