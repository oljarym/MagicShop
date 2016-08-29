/**
 * Created by Olia on 11.07.2016.
 */
$(document).ready(function () {

    
    //Register new user to DB via REST
    $("#register-submit").click(function () {
        var userName = $("#register-name").val();
        var userEmail = $("#register-email").val();
        var userPassword = $("#register-password").val();
            $.ajax({
                url: "http://localhost:8080/users/email/" + userEmail,
                dataType: 'json',
                statusCode: {
                    406: function () {
                        var jsonObject = {
                            "email": userEmail,
                            "name": userName,
                            "password": userPassword
                        };
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:8080/users/",
                            contentType: 'application/json; charset=utf-8',
                            data: JSON.stringify(jsonObject),
                            statusCode: {
                                201: function () {
                                    alert("Account was created");

                                },
                                400: function () {
                                    alert("Something is wrong. Failed");
                                }
                            }
                        });

                    },
                    200: function () {
                        alert("User with this email is already exist");
                    }
                }

            });
    });

    
    $.ajax({
        url: 'http://localhost:8080/users/',
        dataType: 'json',
        success: function (data) {
            $('#admin-users-list').bootstrapTable({
                data: data
            });
        },
        error: function (e) {
            console.log(e.responseText);
        }
    });

    $('#admin-users-list').on('click-row.bs.table', function (e, row, $element) {
        document.getElementById('current-user').innerHTML = '<span class="glyphicon glyphicon-user"></span> ' + row.name;
        var fillTable = '<thead><tr><th>ID</th><th>Name</th>' +
            '<th>Email</th><th>Enabled</th><th>Authority</th>' +
            '</tr></thead>'+'<tbody><tr><td>'+ row.userId + '</td><td>' +
            row.name + '</td><td>' +
            row.email + '</td><td>' +
            row.enabled + '</td><td>' +
            row.authority + '</td></tr></tbody>';
        $('#selected-user-for-change').html(fillTable);
        $('#admin-user-modal').modal({
            show: true
        });
        $('#change-user-active-submit').click(function () {
            var action;
            var massage;
            if(row.enabled == true) {
                action = "disable/id/";
                massage = "disabled";
            } else {
                action = "activate/id/";
                massage = "activated";
            }
            $.ajax({
                type: "PUT",
                url: "http://localhost:8080/users/" + action + row.userId,
                statusCode: {
                    204: function () {
                        alert("User was " + massage);
                    },
                    400: function () {
                        alert("Error occurred");
                    }
                }
            });
            location.reload(true);
        });
    });



    // All goods list
        $.ajax({
            url: 'http://localhost:8080/goods/available',
            dataType: 'json',
            success: function (data) {
                var $table1 = $('#all-goods-list').bootstrapTable({
                    data: data
                });
                var grepFunc1 = function () {
                    return true;
                };
                $('#ok1').click(function () {
                    var limit1 = $('#limit1').val();
                    var offset1 = $('#offset1').val();

                    if (limit1 == "" && offset1 == "") {
                        grepFunc1 = function () {
                            return true;
                        };
                    } else if (limit1 != "" && offset1 == "") {
                        grepFunc1 = function (goods) {
                            return goods.price >= limit1;
                        };
                    } else if (limit1 == "" && offset1 != "") {
                        grepFunc1 = function (goods) {
                            return goods.price <= offset1;
                        };
                    } else if (limit1 != "" && offset1 != "") {
                        grepFunc1 = function (goods) {
                            return (goods.price <= offset1 && goods.price >= limit1);
                        };
                    }
                    $table1.bootstrapTable('load', $.grep(data, grepFunc1));
                });
                $('#reset1').click(function () {
                    grepFunc = function () {
                        return true;
                    };
                    $table1.bootstrapTable('load', $.grep(data, grepFunc));
                });
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });

    // new goods
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
                $('#action-error1').html('<p>Please, fill the field</p>').show();
                return false;
            } else if (goodsPrice < 0 || goodsQuantity < 1) {
                $('#action-error1').html('<p>Please, enter correct data</p>').show();
                return false;
            } else {

                $.ajax({
                    url: 'http://localhost:8080/goods/name/' + goodsName,
                    dataType: 'json',
                    statusCode: {
                        204: function () {
                            $.ajax({
                                type: "POST",
                                url: "http://localhost:8080/goods/",
                                contentType: 'application/json; charset=utf-8',
                                data: JSON.stringify(newGoods)
                            });
                            location.reload(true);
                        },
                        200: function () {
                            $('#action-error1').html('<p>Goods with this name is already exist</p>').show();
                        }
                    }
                });
            }
        });


    // update and delete goods by admin
    $('#admin-goods-list').on('click-row.bs.table', function (e, row, $element) {
        var fillTable = '<thead><tr><th>ID</th><th>Name</th>' +
            '<th>Description</th><th>Quantity</th><th>Price</th>' +
            '</tr></thead>'+'<tbody><tr><td>'+ row.goodsId + '</td><td>' +
                row.name + '</td><td>' +
                row.description + '</td><td>' +
                row.quantity + '</td><td>' +
                row.price + '</td></tr></tbody>';
        $('#selected-goods').html(fillTable); // show row with selected goods
        // filing  field current values
        document.getElementById('new-name').value = row.name;
        document.getElementById('new-description').value = row.description;
        document.getElementById('new-quantity').value = row.quantity;
        document.getElementById('new-price').value = row.price;
        $('#UD-modal-admin').modal({
            show: true
        });
        var currentGoods = {
            "goodsId": row.goodsId,
            "name": row.name,
            "description": row.description,
            "quantity":  row.quantity,
            "price": row.price
        };

        $('#update-goods-submit').click(function () {
            var goodsId = row.goodsId;
            var newGoodsName = $('#new-name').val();
            var newGoodsDescription = $('#new-description').val();
            var newGoodsQuantity = $('#new-quantity').val();
            var newGoodsPrice = $('#new-price').val();

            var updatedGoods = {
                "name": newGoodsName,
                "description": newGoodsDescription,
                "quantity": newGoodsQuantity,
                "price": newGoodsPrice
            };
            $.ajax({
                type: "PUT",
                url: "http://localhost:8080/goods/goodsId/" + goodsId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(updatedGoods)
            });
            $('#action-success').html('<sprong>Success!</sprong>' + '<p>Goods was updated!</p>' +
                '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>').show();
            location.reload(true);

        });

        // Create new goods
        $('#delete-goods-submit').click(function () {
            $.ajax({
                type: "DELETE",
                url: "http://localhost:8080/goods/goodsId/" + row.goodsId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(currentGoods)
            });
            $('#action-success').html('<sprong>Success!</sprong>' + '<p>Goods was deleted!</p>' +
                '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>').show();
            location.reload(true);
        });

    });

    //Order goods for users
    $('#all-goods-list').on('click-row.bs.table', function (e, row, $element) {
        var fillTable = '<thead><tr><th>ID</th><th>Name</th>' +
            '<th>Description</th><th>Quantity</th><th>Price</th>' +
            '</tr></thead>'+'<tbody><tr><td>'+ row.goodsId + '</td><td>' +
            row.name + '</td><td>' +
            row.description + '</td><td>' +
            row.quantity + '</td><td>' +
            row.price + '</td></tr></tbody>';
        $('#selected-goods-for-order').html(fillTable); // show row with selected goods

        var quantity = $('#quantity').val();
        var money = $("#money").html(quantity*row.price);
        // create order
        $("#order-modal").modal({
                show: true
            }
        );

        document.getElementById("quantity").addEventListener("change", function () {
            var quantity = $('#quantity').val();
            $("#money").html( quantity * row.price);
        });

        $("#order-it").click(function () {
            var userId = $("#id-user").val();
            var goodsId = row.goodsId;
            var finalQuantity = $('#quantity').val();

            if((finalQuantity > 0) && (finalQuantity <= row.quantity)) {
                var newOrder = {
                    "userId": userId,
                    "goodsId": goodsId,
                    "quantity": finalQuantity
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
            location.reload(true);
        });

    });

});









