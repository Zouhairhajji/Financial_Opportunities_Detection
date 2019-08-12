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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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



                    <div class="box">
                        <div class="box-header">

                        </div>
                        <div class="box-body">
                            <div class="table table-responsive">
                                <table class="table" id="segmentation_details">
                                    <thead>
                                        <tr>
                                            <th>Company Id</th>
                                            <th>Company name</th>
                                            <th>Recency</th>
                                            <th>Frequency</th>
                                            <th>Monetary</th>
                                            <th>RFM Score</th>
                                            <th>Segment name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="opp" items="${list_segmentations}">
                                            <tr>
                                                <td>${opp.companyName}</td>
                                                <td>${opp.companyId}</td>
                                                <td><fmt:formatNumber value="${opp.recency}" maxFractionDigits="2"/></td>
                                                <td><fmt:formatNumber value="${opp.frequency}" maxFractionDigits="2"/></td>
                                                <td><fmt:formatNumber value="${opp.monetary}" maxFractionDigits="2"/></td>
                                                
                                                <td>${opp.rfm_score}</td>
                                                <td>${opp.segmentName}</td>
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
        <script>
            $('#segmentation_details').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        </script>

    </body>
</html>