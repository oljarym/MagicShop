<script>
    $(document).ready(function () {
        $('#admin-user-modal').modal({
            show: false
        })
    });
</script>

<div class="container">

    <table id="admin-users-list" class="table table-hover"
           data-unique-id="userId"
           data-search="true"
           data-query-params="queryParams"
           data-pagination="true">
        <thead>
        <tr>
            <th data-field="userId">ID</th>
            <th data-field="name" data-sortable="true" data-sort-name="name" data-click-to-select="true">Name</th>
            <th data-field="email">Email</th>
            <th data-field="enabled">Enabled</th>
            <th data-field="authority">Authority</th>
        </tr>
        </thead>
    </table>

    <div class="modal fade" id="admin-user-modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 id="current-user"></h3>
                </div>
                <div class="modal-body">
                    <table id="selected-user-for-change" class="table table-bordered"></table>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" id="change-user-active-submit" class="btn btn-danger">Change user activity</button>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
</div>
