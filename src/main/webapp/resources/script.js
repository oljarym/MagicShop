
$(document).ready(function () {
    
    //Register new user to DB via REST
    $("#register-submit").click(function () {
        var userName = $("#register-name").val();
        var userEmail = $("#register-email").val();
        var userPassword = $("#register-password").val();
        $.ajax({
            url: "/users/email/" + userEmail,
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
                        url: "/users/",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify(jsonObject),
                        statusCode: {
                            201: function () {
                                alert("Account was created");
                                window.location = '/login'
                            },
                            400: function () {
                                alert("Failed. Please, try again!");
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
        url: '/users/',
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
                url: "/users/" + action + row.userId,
                statusCode: {
                    204: function () {
                        alert("User was " + massage);
                        location.reload(true);
                    },
                    400: function () {
                        alert("Internal error occurred");
                        location.reload(true);
                    }
                }
            });
        });
    });



    // All goods list
        $.ajax({
            url: '/goods/available',
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
                    url: '/goods/name/' + goodsName,
                    dataType: 'json',
                    statusCode: {
                        204: function () {
                            $.ajax({
                                type: "POST",
                                url: "/goods/",
                                contentType: 'application/json; charset=utf-8',
                                data: JSON.stringify(newGoods),
                                statusCode: {
                                    201: function () {
                                        alert('New goods with name: ' + goodsName + ' was created!');
                                        location.reload(true);
                                    },
                                    404: function () {
                                        alert('Error. Please, try again!');
                                        location.reload(true);
                                    }
                                }
                            });
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
                url: "/goods/goodsId/" + goodsId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(updatedGoods),
                statusCode: {
                    404: function () {
                        alert('Error! Goods was not updated');
                        location.reload(true);
                    },
                    204: function () {
                        alert('Success! Goods was updated!');
                        location.reload(true);
                    }
                }
            });

        });

        // Create new goods
        $('#delete-goods-submit').click(function () {
            $.ajax({
                type: "DELETE",
                url: "/goods/goodsId/" + row.goodsId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(currentGoods),
                statusCode: {
                    404: function () {
                        alert('Error');
                        location.reload(true);
                    },
                    204: function () {
                        alert('Success! Goods was deleted!');
                        location.reload(true);
                    }
                }
            });
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
                    url: "/orders/",
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(newOrder),
                    statusCode: {
                        201: function () {
                            alert('Operation completed successfully!');
                            location.reload(true);
                        },
                        204: function () {
                            alert('Error! Please, try again!');
                            location.reload(true);
                        }
                    }
                });
            } else {
                $("#orderError").show();
            }
        });
    });


    var idUser = $('#id-user-home').val();
    var counter = $('#page-load-counter').val();
    var saleGoodsList;
    $.ajax({
        url: '/goods/',
        dataType: 'json',
        success: function (data) {
            saleGoodsList = data;
            var filt = function (goods) {
                if(goods.salePrice != 0) {
                    goods.price = goods.salePrice;
                }
                return goods.quantity > 0;
            };
            saleGoodsList = $.grep(saleGoodsList, filt);

            var goodsId75 = saleGoodsList[0].goodsId;
            var name75 = saleGoodsList[0].name;
            var description75 = saleGoodsList[0].description;
            var quantity75 = saleGoodsList[0].quantity;
            var price75 = saleGoodsList[0].salePrice;

            var goodsId50 = saleGoodsList[1].goodsId;
            var name50 = saleGoodsList[1].name;
            var description50 = saleGoodsList[1].description;
            var quantity50 = saleGoodsList[1].quantity;
            var price50 = saleGoodsList[1].salePrice;

            var goodsId35 = saleGoodsList[2].goodsId;
            var name35 = saleGoodsList[2].name;
            var description35 = saleGoodsList[2].description;
            var quantity35 = saleGoodsList[2].quantity;
            var price35 = saleGoodsList[2].salePrice;

            $('#name-75').html("<strong>Name: </strong>" + name75);
            $('#description-75').html("<strong>Description: </strong>" + description75);
            $('#quantity-75').html("<strong>Quantity: </strong>" + quantity75);
            $('#price-75').html("<strong>$</strong>" + price75);

            $('#name-50').html("<strong>Name: </strong>" + name50);
            $('#description-50').html("<strong>Description: </strong>" + description50);
            $('#quantity-50').html("<strong>Quantity: </strong>" + quantity50);
            $('#price-50').html("<strong>$</strong>" + price50);

            $('#name-35').html("<strong>Name: </strong>" + name35);
            $('#description-35').html("<strong>Description: </strong>" + description35);
            $('#quantity-35').html("<strong>Quantity: </strong>" + quantity35);
            $('#price-35').html("<strong>$</strong>" + price35);

            var isInt = function isInt(n) {
                return n % 1 === 0;
            };


            $('#buy1').click(function () {
                if(idUser == "") {
                    window.location ='/login';
                } else {
                    var fillTable = '<thead><tr><th>Name</th>' +
                        '<th>Description</th><th>Quantity</th><th>Price</th>' +
                        '</tr></thead>'+'<tbody><tr><td>' +
                        name75 + '</td><td>' +
                        description75 + '</td><td>' +
                        quantity75+ '</td><td>' +
                        price75 + '</td></tr></tbody>';
                    $('#selected-goods-for-order-home').html(fillTable);
                    $('#money-home').html(price75);

                    $("#order-modal-home").modal({
                        show: true
                    });
                    document.getElementById("quantity-home").addEventListener("change", function () {
                        var quantity = $('#quantity-home').val();
                        $("#money-home").html( quantity * price75);
                    });

                    $("#order-it-home").click(function () {
                        var finalQuantity = $('#quantity-home').val();

                        if ((finalQuantity > 0) && (finalQuantity <= quantity75) && (isInt(finalQuantity))) {
                            var newOrder = {
                                "userId": idUser,
                                "goodsId": goodsId75,
                                "quantity": finalQuantity
                            };
                            $.ajax({
                                type: "POST",
                                url: "/orders/",
                                contentType: 'application/json; charset=utf-8',
                                data: JSON.stringify(newOrder)
                            });
                            window.location = '/my-orders';
                        } else {
                            location.reload(true);
                        }
                    });
                }

            });

            $('#buy2').click(function () {
                if(idUser == "") {
                    window.location ='/login';
                } else {
                    var fillTable = '<thead><tr><th>Name</th>' +
                        '<th>Description</th><th>Quantity</th><th>Price</th>' +
                        '</tr></thead>'+'<tbody><tr><td>' +
                        name50 + '</td><td>' +
                        description50 + '</td><td>' +
                        quantity50+ '</td><td>' +
                        price50 + '</td></tr></tbody>';
                    $('#selected-goods-for-order-home').html(fillTable);
                    $('#money-home').html(price50);


                    $("#order-modal-home").modal({
                        show: true
                    });
                    document.getElementById("quantity-home").addEventListener("change", function () {
                        var quantity = $('#quantity-home').val();
                        $("#money-home").html( quantity * price50);
                    });

                    $("#order-it-home").click(function () {
                        var finalQuantity = $('#quantity-home').val();

                        if((finalQuantity > 0) && (finalQuantity <= quantity50) && (isInt(finalQuantity))) {
                            var newOrder = {
                                "userId": idUser,
                                "goodsId": goodsId50,
                                "quantity": finalQuantity
                            };
                            $.ajax({
                                type: "POST",
                                url: "/orders/",
                                contentType: 'application/json; charset=utf-8',
                                data: JSON.stringify(newOrder)
                            });
                            window.location = '/my-orders';
                        } else {
                            location.reload(true);
                        }
                    });
                }

            });

            $('#buy3').click(function () {
                if(idUser == "") {
                    window.location ='/login';
                } else {
                    var fillTable = '<thead><tr><th>Name</th>' +
                        '<th>Description</th><th>Quantity</th><th>Price</th>' +
                        '</tr></thead>'+'<tbody><tr><td>' +
                        name35 + '</td><td>' +
                        description35 + '</td><td>' +
                        quantity35+ '</td><td>' +
                        price35 + '</td></tr></tbody>';
                    $('#selected-goods-for-order-home').html(fillTable);
                    $('#money-home').html(price35);


                    $("#order-modal-home").modal({
                        show: true
                    });
                    document.getElementById("quantity-home").addEventListener("change", function () {
                        var quantity = $('#quantity-home').val();
                        $("#money-home").html( quantity * price35);
                    });

                    $("#order-it-home").click(function () {
                        var finalQuantity = $('#quantity-home').val();

                        if((finalQuantity > 0) && (finalQuantity <= quantity35 && (isInt(finalQuantity)))) {
                            var newOrder = {
                                "userId": idUser,
                                "goodsId": goodsId35,
                                "quantity": finalQuantity
                            };
                            $.ajax({
                                type: "POST",
                                url: "/orders/",
                                contentType: 'application/json; charset=utf-8',
                                data: JSON.stringify(newOrder)
                            });
                            window.location = '/my-orders';
                        } else {
                            location.reload(true);
                        }
                    });
                }
            });
        },
        error: function(e) {
            console.log(e.responseText);
        }
    });


});











