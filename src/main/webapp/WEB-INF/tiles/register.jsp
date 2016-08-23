<script>
    $(document).ready(function () {
        $('#register-modal').modal();

        $('#register-form').bootstrapValidator({
            err: {
                container: '#messages'
            },
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: 'The name is required and cannot be empty'
                        },
                        regexp: {
                            regexp: /^[A-Za-z\s.'-]+$/,
                            message: "Alphabetical characters, hyphens and spaces"
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email address is required and cannot be empty'
                        },
                        emailAddress: {
                            message: 'The email address is not valid'
                        }
                    }
                },
                password1: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and cannot be empty'
                        }
                    }
                },
                password2: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and cannot be empty'
                        },
                        identical:{
                            field: 'password1',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                }
            }


        });
    });
</script>
<jsp:include page="home.jsp"/>
<div class="modal fade" id="register-modal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4><span class="glyphicon glyphicon-user"></span> Register</h4>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
                <div id="register-form">
                <form  action="${pageContext.request.contextPath}/login" method='post'>
                    <div class="form-group">
                        <label for="register-name"><span class="glyphicon glyphicon-user"></span> Name: </label>
                        <input type="text" class="form-control required" id="register-name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="register-email"><span class="glyphicon glyphicon-send"></span> Email: </label>
                        <input  class="form-control required" type='email' id="register-email" name="email">
                    </div>
                     <div class="form-group">
                        <label for="register-password"><span class="glyphicon glyphicon-eye-open"></span> Password: </label>
                        <input  class="form-control required" type='password' id="register-password" name="password1">
                    </div>
                     <div class="form-group">
                        <label for="register-password-confirm"><span class="glyphicon glyphicon-eye-open"></span> Confirm Password: </label>
                        <input  class="form-control required" type='password' id="register-password-confirm" name="password2" >
                    </div>
                    <div class="form-group">
                        <div id="massages"></div>
                    </div>
                    <input type="submit" id="register-submit" value="Register Me" class="btn btn-block">

                </form>
                </div>
            </div>
        </div>
    </div>
</div> 




