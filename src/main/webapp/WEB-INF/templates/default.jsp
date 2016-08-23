<%--
  Created by IntelliJ IDEA.
  User: justlex
  Date: 2/19/16
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>

<head>
    <title><tiles:insertAttribute name="title"/></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <!--  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script> -->
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/static/script.js"></script>
    <link href="${pageContext.request.contextPath}/static/style.css" rel="stylesheet" type="text/css"/>
    <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
<br/>
<div class="body">
    <style>
        body {
            font: 400 15px/1.8 Lato, sans-serif;
            color: #777;

        }

    </style>
    <tiles:insertAttribute name="body"/>
</div>
<hr>
<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>
</body>
<script>
</script>
</html>

