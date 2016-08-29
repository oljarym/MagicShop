
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>

<head>
    <title><tiles:insertAttribute name="title"/></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/static/script.js"></script>
    <link href="${pageContext.request.contextPath}/static/style.css" rel="stylesheet" type="text/css"/>
    <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

]    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
    <tiles:insertAttribute name="header"/>
</div>

<div class="body">
    <tiles:insertAttribute name="body"/>
</div>
<br/>
<br/>
<br/>
<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>
</body>
<script>
</script>
</html>

