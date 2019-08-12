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
                                <table class="table" id="opportunities_details">
                                    <thead>
                                        <tr>
                                            <th>Company name</th>
                                            <th>Potentiel</th>
                                            <th>Revenus théorique</th>
                                            <th>potentiel final</th>
                                            <th>Classement</th>
                                            <th>Segment</th>
                                            <th>Produit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="opp" items="${list_opportunities}">
                                            <tr>
                                                <td>${opp.companyName}</td>
                                                <td>
                                                    <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${opp.finalPotential}" /> 
                                                </td>
                                                <td>
                                                    <fmt:formatNumber maxFractionDigits="3" value = "${opp.forecastNbi}" /> ME
                                                </td>
                                                <td>${opp.finalPotentialNbi}</td>
                                                <td>${opp.finalRank}</td>
                                                <td>${opp.segmentName}</td>
                                                <td>${opp.productName}</td>
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
            $('#opportunities_details').DataTable({
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