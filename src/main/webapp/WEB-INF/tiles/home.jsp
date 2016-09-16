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
    .container-fluid {
        padding-top: 0;
        width: 100%;
    }
    .carousel-inner img {
        width: 100%;
        margin: auto
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
                        <input class="form-control" type="number" id="quantity-home" value="1" min="1" pattern="[1-9][0-9]*">
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









