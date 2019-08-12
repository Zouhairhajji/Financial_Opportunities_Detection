<%-- 
    Document   : javascript
    Created on : 6 sept. 2018, 17:01:46
    Author     : fqlh0717
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery 3 -->
<script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>

<!-- Datatable -->
<script src="<c:url value="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>
<!-- SlimScroll -->
<script src="<c:url value="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/bower_components/fastclick/lib/fastclick.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/dist/js/adminlte.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/dist/js/demo.js"/> "></script>

<script>
    // seach in the left menu
    function native_filter_li(element) {
        var searchText = $("#_input_search_li").val().toUpperCase();
        $('.sidebar-menu li').each(function () {
            var currentLiText = $(this).text().toUpperCase();
            var showCurrentLi = currentLiText.indexOf(searchText) !== -1;
            $(this).toggle(showCurrentLi);
        });
    }
</script>
