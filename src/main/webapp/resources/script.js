/**
 * Created by Olia on 11.07.2016.
 */
$(document).ready(function () {

    
    //Register new user to DB via REST
    $("#register-submit").click(function () {

        var userName = $("#register-name").val();
        var userEmail = $("#register-email").val();
        var userPassword = $("#register-password").val();
        var  userPasswordConfirm = $("#register-password-confirm").val();

        if (userPassword == userPasswordConfirm) {
            var jsonObject = {
                "email": userEmail,
                "name": userName,
                "password": userPassword
            };
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/users/",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(jsonObject)
            });
            alert("New user was added!")
        } else {
            alert("Password is not the same!!!");
        }

    });

    
    //Add New Goods
    $("#new-goods-submit").click(function () {
        var goodsName = $("#new-goods-name").val();
        var goodsDescription = $("#new-goods-description").val();
        var goodsQuantity = $("#new-goods-quantity").val();
        var goodsPrice = $("#new-goods-price").val();

        var newGoods = {
            "name": goodsName,
            "description": goodsDescription,
            "quantity": goodsQuantity,
            "price": goodsPrice
        };

        if (goodsName == "" || goodsDescription == "" || goodsPrice == "" || goodsQuantity == "") {
            alert("Fill the fields");
        } else {
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/goods/",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(newGoods)
            }).then(function () {
                var info = document.getElementById("new-goods-added");
                info.innerHTML = "<h3>Goods has been added</h3>";
            });
        }
    });

    // All goods list
        $.ajax({
            url: 'http://localhost:8080/goods/',
            dataType: 'json',
            success: function (data) {
                $('#all-goods-list').bootstrapTable({
                    data: data
                });
                $('#admin-goods-list').bootstrapTable({
                    data: data
                });
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });

    // update and delete goods by admin
    $('#admin-goods-list').on('click-row.bs.table', function (e, row, $element) {
        $('#UD-modal-admin').modal({
            show: true
        });
        var goodsId = row.goodsId;
        $("#update-goods").click(function (goodsId) {
            $('#update-goods-modal').modal( {
                show: true
            })
        })

    });


    $('#all-goods-list').on('click-row.bs.table', function (e, row, $element) {
        $("#order-modal").modal({
                show: true
            }
        );
        var userId = $("#id-user").val();
        var goodsId = row.goodsId;
        $("#order-it").click(function () {
            var money = $("#money").val();
            if (money == row.price) {
                var newOrder = {
                    "userId": userId,
                    "goodsId": goodsId
                };
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/orders/",
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(newOrder)
                });
                $("#orderSuccess").show();

            } else {
                $("#orderError").show();
            }
        });

    });







    //Validation of register form
    //noinspection JSUnresolvedFunction
    $("#register-form").validate({
        rules: {
            name: {
                required: true,
                minlength: 4,
                maxlength: 50
            },
            email: {
                required: true,
                email: true
            },
            password1: {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            password2: {
                required: true,
                minlength: 4,
                maxlength: 20
            }
        }
    });
});











