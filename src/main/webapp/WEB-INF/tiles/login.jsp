<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Olia
  Date: 29.06.2016
  Time: 2:17
  To change this template use File | Settings | File Templates.
--%>
<div class="container">
    <div>
        <h4><span class="glyphicon glyphicon-lock"></span>Login</h4>
    </div>
    <form  name='f' action="${pageContext.request.contextPath}/login" method='post'>
        <div class="form-group" style="padding:40px 50px;">
            <label for="login-email"><span class="glyphicon glyphicon-user"></span> Username</label>
            <input type="email" class="form-control" name='username' id="login-email" placeholder="Enter email">
        </div>
        <div class="form-group" style="padding:40px 50px;">
            <label for="login-password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
            <input  class="form-control" type='password' name='password' id="login-password" placeholder="Enter password">
        </div>
    <input name="submit" type="submit" class="btn btn-success btn-block" value="Login"/>

    <input name="_csrf" type="hidden" value="982d7ddb-3b5b-4480-8a39-ffae2f3dd875"/>
    </form>
</div>


