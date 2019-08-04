
<%-- 
    Document   : login
    Created on : 27 avr. 2017, 15:30:10
    Author     : FQLH0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Page d'authentification</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

        <link rel="shortcut icon" href="/app_logo.png" type="image/x-icon" />
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />">
        <!-- Ionicons -->
        <link rel="stylesheet" href="<c:url value="/resources/bower_components/Ionicons/css/ionicons.min.css" />">
        <!-- Theme style -->
        <link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css" />">
        <!-- iCheck -->
        <link rel="stylesheet" href="<c:url value="/resources/plugins/iCheck/square/blue.css" />">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <!--link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"-->
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href=""><spring:message code="register.name" /></a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg"><spring:message code="register.createUser" /></p>

                <c:if test="${not empty msg}">
                    <div class="alert alert-${css} alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <strong>${msg}</strong>
                    </div>
                </c:if>

                <form:form  id="form_submit"  data-toggle="validator" role="form" method="post" modelAttribute="userForm"   >

                    <form:hidden path="idUser" />
                    <form:hidden path="enabled" />

                    <div class="row">
                        <spring:bind path="username">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <form:input path="username" class="form-control" id="username" placeholder="Code Alliance" required="required"/>
                                    <form:errors path="username" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>

                    <br />

                    <div class="row">
                        <spring:bind path="password">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <spring:message code="login.create.password" var="ph_pw" />
                                    <form:password path="password" 
                                                   id="inputPassword" 
                                                   data-minlength="6" 
                                                   placeholder="${ph_pw}" 
                                                   class="form-control" 
                                                   required="required" AUTOCOMPLETE='OFF' />
                                    <form:errors path="password" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <spring:message code="login.create.confirm.password" var="ph_pw_conf" />
                            <input  class="form-control"  
                                    type="password"
                                    placeholder="${ph_pw_conf}" 
                                    class="form-control" 
                                    id="inputPasswordConfirm" 
                                    data-match-error="Whoops, these don't match" 
                                    required="required" AUTOCOMPLETE='OFF' />
                        </div>
                    </div>


                    <div class="row">
                        <spring:bind path="firstName">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <spring:message code="login.create.lastname" var="lname" />
                                    <form:input path="firstName" class="form-control" id="firstName" placeholder="${lname}" required="required" />
                                    <form:errors path="firstName" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>

                    <br />

                    <div class="row">
                        <spring:bind path="lastName">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <spring:message code="login.create.firstname" var="fname" />
                                    <form:input path="lastName" class="form-control" id="lastName" placeholder="${fname}" required="required"  />
                                    <form:errors path="lastName" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>

                    <br />


                    <div class="row">
                        <spring:bind path="email">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <form:input path="email" class="form-control" id="email" placeholder="Email" required="required"/>
                                    <form:errors path="email" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>

                    <br />

                    <div class="row">
                        <spring:bind path="phoneNumber">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <div class="col-sm-12">
                                    <spring:message code="login.create.telnum" var="telnum" />
                                    <form:input path="phoneNumber" class="form-control" id="phoneNumber" placeholder="${telnum}" />
                                    <form:errors path="phoneNumber" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-sm-12">
                            <button type="submit"  class="btn btn-primary btn-block btn-flat"><spring:message code="register.create" /></button>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-sm-12">
                            <a href="<c:url value="/login" />"   class="btn btn-warning btn-block btn-flat" ><spring:message code="register.return" /></a>
                        </div>
                    </div>

                </form:form>


            </div>
            <!-- /.login-box-body -->
        </div> 
        <!-- /.login-box -->

        <!-- error modal -->
        <div class="modal modal-danger fade" id="modal-danger">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"><spring:message code="cluster.error.alert" /></h4>
                    </div>
                    <div class="modal-body">
                        <p id="error_message" > </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Fermer</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


        <!-- jQuery 2.2.3 -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />"></script>
        <!-- iCheck -->
        <script src="<c:url value='/resources/plugins/iCheck/icheck.min.js' />"></script>

        <script>


            $('#form_submit').submit(function (event) {
                verify_form();
            });

            function verify_form() {
                var password = $('#inputPassword').val();
                var confirm_password = $('#inputPasswordConfirm').val();
                if (password !== confirm_password) {
                    $('#inputPassword').val('');
                    $('#inputPasswordConfirm').val('');
                    $("#error_message").html("les deux mot de passes ne sont pas identiques, merci de bien recommencer .")

                    $("#modal-danger").modal();
                    event.preventDefault();
                }
            }


        </script>

    </body>
</html>
