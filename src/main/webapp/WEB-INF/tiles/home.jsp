<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    .carousel-inner img {
        padding-top: 0;
         width: 100%;
        margin: auto
    }
    .slide {
        animation-name: slide;
        -webkit-animation-name: slide;
        animation-duration: 1s;
        -webkit-animation-duration: 1s;
        visibility: visible;
    }
</style>
<table>
    <input type="hidden" value="${idUser}" id="id-user-home">
</table>

<div class="container-fluid">

    <div id="myHome" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#myHome" data-slide-to="0" class="active"></li>
            <li data-target="#myHome" data-slide-to="1"></li>
            <li data-target="#myHome" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<spring:url value="/static/img/main.jpg"/>">
            </div>
            <div class="item">
                <img src="<spring:url value="/static/img/dogs.jpg"/>">
            </div>
            <div class="item">
                <img src="<spring:url value="/static/img/join.jpg"/>">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myHome" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myHome" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<br/>

<div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
        <div class="panel panel-default text-center">
            <div class="panel-heading" style=" background-color: darkred; color: whitesmoke;">
                <h1>-75%</h1>
            </div>
            <div class="panel-body">
                <p id="name-75"></p>
                <p id="description-75"></p>
                <p id="quantity-75"></p>
            </div>
            <div class="panel-footer">
                <h2 id="price-75" style="color: darkred"></h2>
                <button class="btn btn-lg" type="submit" id="buy1">Buy</button>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-xs-12">
        <div class="panel panel-default text-center">
            <div class="panel-heading" style=" background-color: darkred; color: whitesmoke;">
                <h1>-50%</h1>
            </div>
            <div class="panel-body">
                <p id="name-50"></p>
                <p id="description-50"></p>
                <p id="quantity-50"></p>
            </div>
            <div class="panel-footer">
                <h2 id="price-50" style="color: darkred"></h2>
                <button class="btn btn-lg" type="submit" id="buy2">Buy</button>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-xs-12">
        <div class="panel panel-default text-center">
            <div class="panel-heading" style=" background-color: darkred; color: whitesmoke;">
                <h1>-35%</h1>
            </div>
            <div class="panel-body">
                <p id="name-35"></p>
                <p id="description-35"></p>
                <p id="quantity-35"></p>
            </div>
            <div class="panel-footer">
                <h2 style="color: darkred" id="price-35"></h2>
                <button class="btn btn-lg" type="submit" id="buy3">Buy</button>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="modal fade" id="order-modal-home" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Payment for goods</h4>
                </div>
                <div class="modal-body">
                    <table id="selected-goods-for-order-home" class="table table-bordered"></table>
                    <div class="form-group" >
                        <label for="quantity-home">Quantity</label>
                        <input class="form-control" type="number" id="quantity-home" value="1" min="1">
                    </div>
                    <div class="form-group">
                        <label for="money-home">Final price </label>
                        <p class="form-control" id="money-home"></p>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-block" id="order-it-home">Order goods</button>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>

<script>
    $(document).ready(function () {
        var idUser = $('#id-user-home').val();
        var counter = $('#page-load-counter').val();
        var saleGoodsList;
        $.ajax({
            url: 'http://localhost:8080/goods/',
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

                            if((finalQuantity > 0) && (finalQuantity <= quantity75)) {
                                var newOrder = {
                                    "userId": idUser,
                                    "goodsId": goodsId75,
                                    "quantity": finalQuantity
                                };
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:8080/orders/",
                                    contentType: 'application/json; charset=utf-8',
                                    data: JSON.stringify(newOrder)
                                });
                                window.location = '/myOrders';
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

                            if((finalQuantity > 0) && (finalQuantity <= quantity50)) {
                                var newOrder = {
                                    "userId": idUser,
                                    "goodsId": goodsId50,
                                    "quantity": finalQuantity
                                };
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:8080/orders/",
                                    contentType: 'application/json; charset=utf-8',
                                    data: JSON.stringify(newOrder)
                                });
                                window.location = '/myOrders';
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

                            if((finalQuantity > 0) && (finalQuantity <= quantity35)) {
                                var newOrder = {
                                    "userId": idUser,
                                    "goodsId": goodsId35,
                                    "quantity": finalQuantity
                                };
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:8080/orders/",
                                    contentType: 'application/json; charset=utf-8',
                                    data: JSON.stringify(newOrder)
                                });
                                window.location = '/myOrders';
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
</script>








