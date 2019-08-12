<%-- 
    Document   : left_bar
    Created on : 6 sept. 2018, 17:00:47
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="true" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img height="160" width="160" src="data:image/png;base64, ${IMAGE_B64}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${FULL_NAME}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" id="_input_search_li" onkeyup="native_filter_li($(this))" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button type="button" name="search" onclick="native_filter_li($(this))" class="btn btn-flat"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>



        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
                
            <sec:authorize access="hasRole('ROLE_USER')">
                <li class="header">MAIN NAVIGATION</li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>Admin</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/users/list" />"><i class="fa fa-circle-o text-red"></i> Gest Users</a></li>
                        <li><a href="<c:url value="/roles/list" />"><i class="fa fa-circle-o text-red"></i> Gest Roles</a></li>
                    </ul>
                </li>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_BANKER')">
                <li class="header">Financial Analysis</li>
                <li><a href="<c:url value="/opportunities/external_data/list" />"><i class="fa fa-circle-o text-yellow"></i>External Data Analysis</a></li>
                <li><a href="<c:url value="/opportunities/cross_selling/list" />"><i class="fa fa-circle-o text-red"></i>Cross Selling Analysis</a></li>
                <li><a href="<c:url value="/opportunities/segmentation/list" />"><i class="fa fa-circle-o text-aqua"></i>Segmentation Analysis</a></li>
                <li><a href="<c:url value="/opportunities/sentiment/list" />"><i class="fa fa-circle-o text-muted"></i>Sentimental Analysis</a></li>
            </sec:authorize>

                
        </ul>
    </section>
</aside>


