<style>

   /* .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
        /* background-color: #F1C40F;
        background: #ec7063;
        cursor: pointer;
        color: #111111;
    } */

    .table tbody tr:hover td{

        color: #111111;
        cursor: default;
    }


</style>

<div class="container">
    <table>
        <input type="hidden" value="${idUser}" id="id-user1">
    </table>

    <ul class="nav nav-tabs">
        <li><a href="${pageContext.request.contextPath}/personal-room">Goods list</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/my-orders">My orders</a></li>
    </ul>


   <div class="my-orders">

       <table id="my-orders-list" class="table"
              data-search="true"
              data-query-params="queryParams">
           <thead>
           <tr>
               <th data-field="goodsName" data-sortable="true">Name</th>
               <th data-field="quantity"  data-sortable="true">Orders Quantity</th>
               <th data-field="quantityGoods" data-sortable="true">Goods Quantity</th>
           </tr>
           </thead>
       </table>


    </div>
<script>
    var userId = $('#id-user1').val();
    $.ajax({
        url: 'http://localhost:8080/orders/userId/' + userId,
        success: function (data) {
            $('#my-orders-list').bootstrapTable({
                data: data
            });
        }, error: function (e) {
            console.log(e.responseText);
        }
    });
</script>

</div>