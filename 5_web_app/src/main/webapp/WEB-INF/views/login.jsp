
<%-- 
    Document   : login
    Created on : 27 avr. 2017, 15:30:10
    Author     : FQLH0717
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a href="<c:url value="/" />">
                    
                    <img src="<c:url value="/resources/images/hhd_noir.png" />" alt="Logo"/>
                    <spring:message code="register.name" /> <br />
                </a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg"><spring:message code="login.rappel" /></p>

                <form name='loginForm' action="<c:url value='login' />" method='POST'>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible">${error}</div>
                    </c:if>
                    <c:if test="${not empty msg}">
                        <div class="alert alert-warning  alert-dismissible">${msg}</div>
                    </c:if>

                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="Identifiant" value="" name='username' />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Mot de passe" name='password' AUTOCOMPLETE='OFF' />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-primary btn-block btn-flat"><spring:message code="login.log" /></button>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-12">
                            <a href="<c:url value='/register' />" class="btn btn-primary btn-block btn-flat"><spring:message code="login.create" /></a>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-12">
                            <a href="mailto:developpeurs.equipehhd@orange.com?body=Message&subject=[Portail]: --> Objet <--" class="btn btn-primary btn-block btn-flat"><spring:message code="login.contact" /></a>
                        </div>
                    </div>
                </form>
                <br/>
                <div class="row" align="center">
                    <div class="col-xs-12">
                        <a href="<c:url value='login?lang=fr' />">(Français)</a>
                        &nbsp;&nbsp;
                        <a href="<c:url value='login?lang=en' />">(English)</a>
                    </div>
                </div>
            </div>
            <!-- /.login-box-body -->
        </div> 
        <!-- /.login-box -->

        <!-- jQuery 2.2.3 -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />"></script>
        <!-- iCheck -->
        <script src="<c:url value='/resources/plugins/iCheck/icheck.min.js' />"></script>

    </body>
</html>
