


<div class="container">

  <!-- <input type="text" id="money"> -->
    <table>
        <input type="hidden" value="${idUser}" id="id-user">
    </table>
    <div class="alert alert-success" id="orderSuccess" style="display:none;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success</strong>
    </div>
    <div class="alert alert-danger" id="orderError" style="display:none;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Something wrong!!!</strong>
    </div>

    <table id="all-goods-list" class="table table-bordered"
           data-unique-id="goodsId"
           data-show-columns="true"
           data-search="true"
           data-query-params="queryParams"
           data-toolbar=".toolbar">
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



    <!-- Modal -->
    <div class="modal fade" id="order-modal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <input type="number" id="money" style="text-align:right;">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="order-it">Order goods</button>
                </div>
            </div>

        </div>
    </div>



</div>





