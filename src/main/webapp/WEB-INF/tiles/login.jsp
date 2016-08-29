<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script>
    $(document).ready(function () {
        $('#login-modal').modal();
    })
</script>
<jsp:include page="home.jsp"/>
<div class="modal fade" id="login-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4><span class="glyphicon glyphicon-lock"></span> Log in</h4>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
                    <form  name='f' action="${pageContext.request.contextPath}/login" method='post'>
                    <div class="form-group">
                        <label for="login-email"><span class="glyphicon glyphicon-user"></span>User name</label>
                        <input type="email" class="form-control required" name='username' id="login-email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="login-password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                        <input  class="form-control required" type='password' name='password' id="login-password" placeholder="Enter password">
                    </div>
                    <input name="submit" type="submit" class="btn btn-block" value="Log in"/>

                    <input name="_csrf" type="hidden" value="982d7ddb-3b5b-4480-8a39-ffae2f3dd875"/>
                </form>

            </div>
        </div>
    </div>
</div>


