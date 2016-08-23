<script>
    var userId;
    userId = $('#id-user1').val();
    $.ajax({
        url: 'http://localhost:8080/orders/userId/'+ 2,
        success: function (data) {
            $('#my-orders-list').bootstrapTable({
                data: data
            });
        }, error: function(e) {
            console.log(e.responseText);
        }});
    alert(userId);
</script>

<div class="container">
    <table>
        <input type="hidden" value="${idUser}" id="id-user1">
    </table>

    <ul class="nav nav-tabs">
        <li><a href="/personalRoom">Goods list</a></li>
        <li class="active"><a href="/myOrders">My orders</a></li>
    </ul>


    <div class="my-orders">

        <table id="my-orders-list" class="table table-bordered"
               data-search="true"
               data-query-params="queryParams">
            <thead>
            <tr>
                <th data-field="goodsName" data-sortable="true">Name</th>
                <th data-field="quantity"  data-sortable="true">Quantity of orders</th>
                <th data-field="quantityGoods" data-sortable="true">Quantity of goods</th>
            </tr>
            </thead>
        </table>


    </div>










</div>