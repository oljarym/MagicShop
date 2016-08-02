<%--
  Created by IntelliJ IDEA.
  User: Olia
  Date: 29.06.2016
  Time: 2:18
  To change this template use File | Settings | File Templates.
--%>

<div class="ui-widget">
    <div id="register">
        <h3>Sign up!</h3>
        <form id="register-form" action="${pageContext.request.contextPath}/login" method='post'>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="register-name" name="name"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" id="register-email" name="email"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" id="register-password" name="password1"></td>
                </tr>
                <tr>
                    <td>Confirm password:</td>
                    <td><input type="password" id="register-password-confirm" name="password2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" id="register-submit" value="Register"></td>
                </tr>
            </table>
        </form>
    </div>
</div>

