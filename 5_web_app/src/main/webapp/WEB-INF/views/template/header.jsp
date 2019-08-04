<%-- 
    Document   : header
    Created on : 6 sept. 2018, 17:01:33
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="icon" href="/app_logo.png" sizes="16x16" type="image/png">
<title>${title} |  <spring:message code="app.title" /></title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet" href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css"/>">
<!-- Ionicons -->
<link rel="stylesheet" href="<c:url value="/resources/bower_components/Ionicons/css/ionicons.min.css"/>">
<!-- Theme style -->
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>">

<!-- load angularjs lib -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

<!-- AdminLTE Skins. Choose a skin from the css/skins
     folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/skin-blue.css"/>">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
