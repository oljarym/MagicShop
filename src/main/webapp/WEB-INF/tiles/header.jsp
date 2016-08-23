<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
  Created by IntelliJ IDEA.
  User: Olia
  Date: 11.07.2016
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="<spring:url value="/static/style.css"/>" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css">
<!-- Latest compiled and minified JavaScript -->
<!--<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.js"></script>



<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
    <nav class="navbar navbar-inverse ">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand active" href="/">MAGIC SHOP</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/personalRoom"><span>Personal Room</span></a></li>
                <li><a href="${pageContext.request.contextPath}/allUsers"><span>Users</span></a> </li>
                <li><a href="${pageContext.request.contextPath}/allGoods"><span>Edit Goods List</span></a> </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout" ><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
             </ul>
         </div>
     </nav>
 </c:if>
<c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
    <nav class="navbar navbar-inverse ">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand active" href="/">MAGIC SHOP</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="/personalRoom"><span>Personal Room</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout" ><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            </ul>
        </div>
    </nav>
</c:if>
<c:if test="${empty pageContext.request.userPrincipal}">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand active" href="/">MAGIC SHOP</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
             <!--   <li><a href="/logout" ><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                <li><a href="/newGoods"><span>ADD NEW GOODS</span></a> </li>-->
                <li><a href="/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="/login" ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </nav>
</c:if>