<script>
    $(document).ready(function () {

        $('#close-collapse').on('click', function () {
            $('.collapse').collapse('hide');
        });
        $('#UD-modal-admin').modal({
            show: false
        });
        $('#C-modal-admin').modal({
            show: false
        });

        $('.show-modal').click(function(){
            $("#C-modal-admin").modal({
                show: true
            });
        });

        $("#new-goods-form").bootstrapValidator({
            err: {
                container: '#message'
            },
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                goodsName: {
                    validators: {
                        notEmpty: {
                            message: 'The goods name is required and cannot be empty'
                        }
                    }
                },
                goodsDescription: {
                    validators: {
                        notEmpty: {
                            message: 'The goods description is required and cannot be empty'
                        },
                        stringLength: {
                            min: 5,
                            max: 200,
                            message: 'The goods description must contain 10-200 characters'
                        }
                    }
                },
                goodsQuantity: {
                    validators: {
                        notEmpty: {
                            message: 'The goods quantity is required and cannot be empty'
                        },
                        between: {
                            min: 0,
                            max: 2147483647,
                            message: 'The latitude must be between 0 and 2147483647'
                        }
                    }
                },
                goodsPrice: {
                    validators: {
                        notEmpty: {
                            message: 'The goods price is required and cannot be empty'
                        },
                        between: {
                            min: 1,
                            max: 2147483647,
                            message: 'The latitude must be between 1 and 2147483647'
                        }
                    }
                }
            }
        });
        $('#create-goods-form').bootstrapValidator({
            err: {
                container: '#messages'
            },
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                newGoodsName: {
                    validators: {
                        notEmpty: {
                            message: 'The goods name is required and cannot be empty'
                        }
                    }
                },
                newGoodsDescription: {
                    validators: {
                        notEmpty: {
                            message: 'The goods description is required and cannot be empty'
                        },
                        stringLength: {
                            min: 5,
                            max: 200,
                            message: 'The goods description must contain 10-200 characters'
                        }
                    }
                },
                newGoodsQuantity: {
                    validators: {
                        notEmpty: {
                            message: 'The goods quantity is required and cannot be empty'
                        },
                        between: {
                            min: 0,
                            max: 2147483647,
                            message: 'The latitude must be between 0 and 2147483647'
                        }
                    }
                },
                newGoodsPrice: {
                    validators: {
                        notEmpty: {
                            message: 'The goods price is required and cannot be empty'
                        },
                        between: {
                            min: 1,
                            max: 2147483647,
                            message: 'The latitude must be between 1 and 2147483647'
                        }
                    }
                }
            }
        });
        var $table = $('#admin-goods-list');
        var result;
        $.ajax({
            url: 'http://localhost:8080/goods/',
            dataType: 'json',
            success: function (data) {
                 $table.bootstrapTable({
                    data: data
                });
                result = data;
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
        var grepFunc;

        $('#ok').click(function () {
            var limit = $('#limit').val();
            var offset = $('#offset').val();

            if(limit == "" && offset == "") {
                grepFunc = function () {
                    return true;
                };
            } else if (limit != "" && offset == "") {
                grepFunc = function (goods) {
                    return goods.price >= limit;
                };

            } else if (limit == "" && offset != "") {
                grepFunc = function (goods) {
                    return goods.price <= offset;
                };
            } else if (limit != "" && offset != "")
            {
                grepFunc = function (goods) {
                    return (goods.price <= offset && goods.price >= limit);
                };
            }
            $table.bootstrapTable('load', $.grep(result, grepFunc));
        });
        $('#reset').click(function () {
            grepFunc = function () {
                return true;
            };
            $table.bootstrapTable('load', $.grep(result, grepFunc));
        });
    });
</script>

<style>


    .flat-butt {
        width: 400px;
        display: inline-block;
        margin: 0 5px;
        border-radius: 6px;
        font-family: "Lato", sans-serif;
        font-size: 16.5px;
        padding: 12px 20px;
        border: 0;
        background: #34495E;
        color: #FFF;
        cursor: pointer;
        outline: 0;
    }
    .flat-butt:hover {
        background: #005580;
    }
    .flat-primary-butt {
        background: #1abc9c;
    }
    .flat-primary-butt:hover {
        background: #2fe2bf;
    }
</style>



<div class="container">

    <br/>
    <center><input type="submit" class="flat-butt flat-primary-butt show-modal" id="createBTN" value="Create new goods"/></center>
    <br/>

    <div id="toolbar">

        <div class="form-inline" role="form">

            <div class="form-group">
                <span>Min price: </span>
                <input id="limit" class="form-control w70" type="number" value="0" min="1">
            </div>
            <div class="form-group">
                <span>Max price: </span>
                <input id="offset" class="form-control w70" type="number" value="100" min="1">
            </div>
            <button id="ok" type="submit" class="btn btn-default">OK</button>
            <button id="reset" type="submit" class="btn btn-default">Reset filter</button>
        </div>
    </div>
<table id="admin-goods-list"
       class="table table-sm"
       data-search="true"
       data-toolbar="#toolbar"
       data-pagination="true"
       data-show-footer="false">
    <thead>
    <tr>
        <th data-field="goodsId"  data-visible="true" data-sortable="true">ID</th>
        <th data-field="name" data-visible="true" data-sortable="true" data-sort-name="name" data-click-to-select="true">Name</th>
        <th data-field="description" data-visible="true">Description</th>
        <th data-field="quantity" data-visible="true" data-sortable="true">Quantity</th>
        <th data-field="price" data-visible="true" data-sortable="true">Price</th>
        <th data-field="salePrice" data-visible="true" data-sortable="true">Sale Goods</th>
    </tr>
    </thead>
</table>

    <div class="modal fade" id="C-modal-admin" tabindex="-1" style="display: none;" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Create new goods</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success fade in" id="action-success1" style="display:none;">
                    </div>
                    <div class="alert alert-danger fade in" id="action-error1" style="display:none;">
                    </div>
                    <div id="create-goods-form">
                            <form role="form" >
                                <div class="form-group">
                                    <label for="new-name">New Name</label>
                                    <input type="text" id="new-goods-name" name="newGoodsName" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="new-description">New Description</label>
                                    <input type="text" id="new-goods-description"  name="newGoodsDescription" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="new-quantity">Quantity</label>
                                    <input type="number" id="new-goods-quantity" name="newGoodsQuantity" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="new-price">Price</label>
                                    <input type="number" id="new-goods-price" name="newGoodsPrice" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <div id="massages"></div>
                                </div>
                                <button type="submit" class="btn btn-block"  id="new-goods-submit">CREATE GOODS</button>
                            </form>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



<div class="modal fade" id="UD-modal-admin" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Goods Editor</h4>
        </div>
        <div class="modal-body">
            <p>Please, make you`r choice</p>
            <table id="selected-goods" class="table table-bordered"></table>

            <div id="close-collapse">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button"  data-target="#update-goods" class="btn btn-primary toggle-btn" data-toggle="collapse" data-parent="#UD-modal-admin">Update goods</button>
            <button type="button"  data-target="#delete-goods" class="btn btn-danger toggle-btn" data-toggle="collapse" data-parent="#UD-modal-admin">Delete goods</button>
            </div>

            <div id="update-goods" class="collapse">
                <p>Please, enter ALL field for updating information about selected goods</p>
                <div id="new-goods-form">
                <form role="form">
                    <div class="form-group">
                        <label for="new-name">New Name</label>
                        <input type="text" id="new-name" name="goodsName" class="form-control">
                        </div>
                    <div class="form-group">
                        <label for="new-description">New Description</label>
                        <input type="text" id="new-description" name="goodsDescription" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="new-quantity">Quantity</label>
                        <input type="number" id="new-quantity" name="goodsQuantity" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="new-price">Price</label>
                        <input type="number" id="new-price" name="goodsPrice" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <div id="message"></div>
                    </div>
                        <button type="submit" class="btn btn-primary" id="update-goods-submit">UPDATE GOODS</button>
                </form>
            </div>
        </div>
            <div id="delete-goods" class="collapse">
                <h4>Are You sure?</h4>
                <button type="submit" class="btn btn-danger" id="delete-goods-submit">Yes&times;</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
        <div class="modal-footer"></div>

    </div>
</div>
</div>



</div>

