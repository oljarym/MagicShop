

<div class="container">

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="${pageContext.request.contextPath}/personal-room">Goods list</a></li>
        <li><a href="${pageContext.request.contextPath}/my-orders" id="user-orders">My orders</a></li>
    </ul>

    <table>
        <input type="hidden" value="${idUser}" id="id-user">
    </table>


    <div id="toolbar1">
        <div class="form-inline" role="form">
            <div class="form-group">
                <span>Limit: </span>
                <input id="limit1" class="form-control w70" type="number" value="0" min="1">
            </div>
            <div class="form-group">
                <span>Offset: </span>
                <input id="offset1" class="form-control w70" type="number" value="100" min="1">
            </div>
            <button id="ok1" type="submit" class="btn btn-default">OK</button>
            <button id="reset1" type="submit" class="btn btn-danger btn-default">Reset filter</button>
        </div>
    </div>
    <table id="all-goods-list" class="table table-sm"
           data-unique-id="goodsId"
           data-search="true"
           data-pagination="true"
           data-toolbar="#toolbar1">
        <thead>
        <tr>
            <th data-field="goodsId" data-visible="false">ID</th>
            <th data-field="name" data-sortable="true" data-sort-name="name" data-click-to-select="true">Name</th>
            <th data-field="description">Description</th>
            <th data-field="quantity"  data-sortable="true">Quantity</th>
            <th data-field="price" data-sortable="true">Price</th>
        </tr>
        </thead>
    </table>

    <div class="modal fade" id="order-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Payment for goods</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" id="orderError" style="display:none;">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Something wrong!!!</strong>
                </div>
                <table id="selected-goods-for-order" class="table table-bordered"></table>
                    <div class="form-group" >
                        <label for="quantity">Quantity</label>
                        <input class="form-control" id="quantity" value="1" min="1" pattern="[1-9][0-9]*">
                    </div>
                    <div class="form-group">
                        <label for="money">Final price </label>
                        <p class="form-control" id="money"></p>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-block" id="order-it">Order goods</button>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
</div>




