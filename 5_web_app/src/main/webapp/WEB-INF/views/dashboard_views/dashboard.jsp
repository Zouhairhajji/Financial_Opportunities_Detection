<%-- 
    Document   : dashboard
    Created on : 6 sept. 2018, 10:53:53
    Author     : fqlh0717
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/views/template/header.jsp" %>
    </head>
    <!-- ADD THE CLASS fixed TO GET A FIXED HEADER AND SIDEBAR LAYOUT -->
    <!-- the fixed layout is not compatible with sidebar-mini -->
    <body class="hold-transition skin-blue fixed sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">
            <%@include file="/WEB-INF/views/template/navbar.jsp" %>
            <%@include file="/WEB-INF/views/template/left_bar.jsp" %>

            <div class="content-wrapper">
                <section class="content">


                   


                </section>
            </div>
            <%@include file="/WEB-INF/views/template/footer.jsp" %>
            <%@include file="/WEB-INF/views/template/right_bar.jsp" %>
        </div>


        <%@include file="/WEB-INF/views/template/javascript.jsp" %>

    </body>
</html>