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
                                <table class="table" id="segntiments_details">
                                    <thead>
                                        <tr>
                                            <th>Company Id</th>
                                            <th>Company name</th> 
                                            <th>Flag</th> 
                                            <th>Reputation</th> 
                                            <th>negative sentiment</th> 
                                            <th>positive sentiment</th> 
                                            <th>neutre sentiment</th> 
                                            <th>negative tweets</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="opp" items="${list_sentiments}">
                                            <tr>
                                                <td>${opp.companyName}</td>
                                                <td>${opp.companyId}</td>
                                                <td>${opp.flag}</td>
                                                <td>${opp.flagGravity}</td>
                                                <td>${opp.negSentiment}</td>
                                                <td>${opp.posSentiment}</td>
                                                <td>${opp.neuSentiment}</td>
                                                <td><button onclick='show_neg_tweets("${opp.companyName}", "${fn:replace(opp.negTweets, '\'', ' ')}")'> <i class="fa fa-plus"></i></button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>




                    <!-- modal -->
                    <div class="modal fade" id="modal_details">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h3 id="modal_company_name"></h3>
                                </div>
                                <div class="modal-body" id="modal_neg_tweets">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                </div>
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
            $('#segntiments_details').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })

            function show_neg_tweets(company_name, tweets) {
                // make div empty
                $('#modal_neg_tweets').html('')
                $('#modal_company_name').html( 'Company : ' +  company_name )
                tweets = tweets.split("|").forEach(function (tweet) {
                    var template = '- ' + tweet + '<br /><br />'
                    $('#modal_neg_tweets').html($('#modal_neg_tweets').html() + template)
                })

                console.info(tweets)


                $('#modal_details').modal('show')
            }

        </script>

    </body>
</html>