<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link href="../../CSS/core.css" rel="stylesheet" type="text/css" />
    <link href="../../lib/ligerUI/skins/ext/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/Toolbar.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/input.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager;
        var manager1;
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });

            $("#maingrid4").ligerGrid({
                columns: [
                   { display: '序号', width: 30, render: function (item, i) { return i + 1; } },
                   { display: '订单编号', name: 'Serialnumber', width: 140, hide: true },
                   { display: '客户', name: 'Customer_name', width: 200, align: 'left' },

                   { display: '订单状态', name: 'Order_status', width: 70 },
                   {
                       display: '订单金额（￥）', name: 'Order_amount', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.Order_amount) + "</div>";
                       }
                   },
                   {
                       display: '已收总额（￥）', name: 'receive_money', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.receive_money) + "</div>";
                       }
                   },
                   {
                       display: '未收余额（￥）', name: 'arrears_money', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.arrears_money) + "</div>";
                       }
                   },
                   {
                       display: '已开票额（￥）', name: 'invoice_money', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.invoice_money) + "</div>";
                       }
                   },
                   {
                       display: '未开票额（￥）', name: 'arrears_invoice', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.arrears_invoice) + "</div>";
                       }
                   },
                   { display: '成交部门', name: 'F_dep_name', width: 80, hide: true },
                   { display: '成交人员', name: 'F_emp_name', width: 80 },
                   {
                       display: '成交时间', name: 'Order_date', width: 90, render: function (item) {
                           return formatTimebytype(item.Order_date, 'yyyy-MM-dd');
                       }
                   }
                ],
                //fixedCellHeight:false,
                onSelectRow: function (data, rowindex, rowobj) {
                    var manager = $("#maingrid5").ligerGetGridManager();
                    manager.showData({ Rows: [], Total: 0 });
                    var url = "../../data/CRM_receive.ashx?Action=grid&orderid=" + data.id;
                    manager.GetDataByURL(url);
                },
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "../../data/Crm_order.ashx?Action=grid&rnd=" + Math.random(),
                width: '100%', height: '65%',
                heightDiff: -1,
                onRClickToSelect: true,
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                },

                onDblClickRow: function (data, rowindex, rowobj) {
                    view();
                },
                detail: {
                    onShowDetail: function (r, p) {
                        for (var n in r) {
                            if (r[n] == null) r[n] = "";
                        }
                        var grid = document.createElement('div');
                        $(p).append(grid);
                        $(grid).css('margin', 3).ligerGrid({
                            columns: [
                                    { display: '序号', width: 30, render: function (item, i) { return i + 1; } },
                                    { display: '产品名', name: 'product_name', width: 120 },
                                    {
                                        display: '单价', name: 'price', width: 80, type: 'float', align: 'right', render: function (item) {
                                            return toMoney(item.price);
                                        }
                                    },
                                    { display: '数量', name: 'quantity', width: 40, type: 'int' },
                                    { display: '单位', name: 'unit', width: 40 },
                                    {
                                        display: '总价', name: 'amount', width: 100, type: 'float', align: 'right', render: function (item) {
                                            return toMoney(item.amount) + "元";
                                        }
                                    }

                            ],
                            //selectRowButtonOnly: true,
                            usePager: false,
                            checkbox: true,
                            url: "../../data/Crm_order_details.ashx?Action=grid&orderid=" + r.id,
                            width: '99%', height: '100',
                            heightDiff: 0
                        })

                    }
                }
            });
            $("#toolbar").ligerToolBar({
                items: [{
                    type: 'button',
                    text: '查看订单',
                    icon: '../../images/folder-open.gif',
                    disable: true,
                    click: function () {
                        view();
                    }
                },
                {
                    type: 'serchbtn',
                    text: '高级搜索',
                    icon: '../../images/search.gif',
                    disable: true,
                    click: function () {
                        serchpanel()
                    }
                }
                ]
            });
            menu = $.ligerMenu({
                width: 120, items:
                [
                    { text: '查看', click: view, icon: 'view' },
                ]
            });
            $("#maingrid5").ligerGrid({
                columns: [
                    { display: '序号', width: 50, render: function (item, i) { return i + 1; } },
                    { display: '凭证号码', name: 'Receive_num', width: 140 },
                    { display: '付款方式', name: 'Pay_type', width: 100 },
                    {
                        display: '收款金额(￥)', name: 'Receive_amount', width: 120, align: 'right', render: function (item) {
                            return toMoney(item.Receive_amount);
                        }
                    },
                    {
                        display: '收款人', width: 100, render: function (item) {
                            return item.C_depname + "." + item.C_empname;
                        }
                    },
                    {
                        display: '收款日期', name: 'Receive_date', width: 90, render: function (item) {
                            return formatTimebytype(item.Receive_date, 'yyyy-MM-dd');
                        }
                    },
                    { display: '录入人', name: 'create_name', width: 90 }

                ],
                dataAction: 'local', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                //checkbox:true,
                url: "../../data/CRM_receive.ashx?Action=grid&orderid=0&rnd=" + Math.random(),
                width: '100%', height: '100%',
                //title: "收款信息",
                heightDiff: -1,
                onRClickToSelect: true,
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu1.show({ top: e.pageY, left: e.pageX });
                    return false;
                }
            });

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());
            $("#pageloading").fadeOut(400);

            $('form').ligerForm();
            initSerchForm();

            //toolbar1();

        });



        $.getJSON("../../data/toolbar.ashx?Action=GetSys&mid=36&rnd=" + Math.random(), function (data, textStatus) {
            //alert(data);
            var items = [];
            var arr = data.Items;
            for (var i = 0; i < arr.length; i++) {
                items.push(arr[i]);
            }
            $("#toolbar1").ligerToolBar({
                items: items

            });
            menu1 = $.ligerMenu({
                width: 120, items: getMenuItems(data)
            });

            $("#maingrid4").ligerGetGridManager().onResize();
            $("#maingrid5").ligerGetGridManager().onResize();
        });

        function initSerchForm() {
            var d = $('#contact').ligerComboBox({ width: 120, url: "../../data/Param_SysParam.ashx?Action=combo&parentid=6&rnd=" + Math.random() });
            var e = $('#employee').ligerComboBox({ width: 96 });
            var f = $('#department').ligerComboBox({
                width: 97,
                selectBoxWidth: 240,
                selectBoxHeight: 200,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    url: '../../data/hr_department.ashx?Action=tree&rnd=' + Math.random(),
                    idFieldName: 'id',
                    parentIDFieldName: 'pid',
                    checkbox: false
                },
                onSelected: function (newvalue) {
                    $.get("../../data/hr_employee.ashx?Action=combo&did=" + newvalue + "&rnd=" + Math.random(), function (data, textStatus) {
                        e.setData(eval(data));
                    });
                }
            });
        }
        function serchpanel() {
            if ($(".az").css("display") == "none") {
                $("#grid").css("margin-top", $(".az").height() + "px");
                $("#maingrid4").ligerGetGridManager().onResize();
                $("#maingrid5").ligerGetGridManager().onResize();
            }
            else {
                $("#grid").css("margin-top", "0px");
                $("#maingrid4").ligerGetGridManager().onResize();
                $("#maingrid5").ligerGetGridManager().onResize();
            }
        }
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                doserch();
            }
        });
        function doserch() {
            var sendtxt = "&Action=grid&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.setURL("../../data/Crm_order.ashx?" + serchtxt);
            manager.loadData(true);
        }
        function doclear() {
            //var serchtxt = $("#serchform :input").reset();
            $("#serchform").each(function () {
                this.reset();
            });
        }

        var activeDialog = null;
        function f_openWindow(url, title, width, height) {
            var dialogOptions = {
                width: width, height: height, title: title, url: url, buttons: [
                        {
                            text: '保存', onclick: function (item, dialog) {
                                f_save(item, dialog);
                            }
                        },
                        {
                            text: '关闭', onclick: function (item, dialog) {
                                dialog.close();
                            }
                        }
                ], isResize: true, timeParmName: 'a'
            };
            activeDialog = top.jQuery.ligerDialog.open(dialogOptions);
        }

        function view() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                parent.jQuery.ligerDialog.open({ width: 770, height: 490, title: "查看订单", url: "CRM/sale/order_add.aspx?orderid=" + row.id, buttons: [{ text: '关闭', onclick: function (item, dialog) { dialog.close(); } }] });
            } else {
                $.ligerDialog.warn('请选择行！');
            }

        }

        function add() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow("CRM/finance/receive_add.aspx?orderid=" + row.id, "添加收款", 770, 490);
            }
            else {
                $.ligerDialog.warn('请选择订单！');
            }
        }

        function edit() {
            var manager = $("#maingrid5").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {

                f_openWindow('CRM/finance/receive_add.aspx?orderid=' + row.order_id + "&receiveid=" + row.id, "修改收款", 770, 490);

            }
            else {
                $.ligerDialog.warn('请选择收款！');
            }
        }

        function del() {
            var manager = $("#maingrid5").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                $.ligerDialog.confirm("您确定要删除吗？", function (yes) {
                    if (yes) {
                        $.ajax({
                            url: "../../data/CRM_receive.ashx", type: "POST",
                            data: { Action: "AdvanceDelete", id: row.id, rnd: Math.random() },
                            success: function (responseText) {
                                if (responseText == "true") {
                                    f_reload();
                                }
                                else {
                                    top.$.ligerDialog.error('删除失败！');
                                }

                            },
                            error: function () {
                                top.$.ligerDialog.error('删除失败！');
                            }
                        });
                    }
                })
            }
            else {
                $.ligerDialog.warn("请选择客户");
            }
        }


        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            if (issave) {
                dialog.close();
                $.ligerDialog.waitting('数据保存中,请稍候...');
                $.ajax({
                    url: "../../data/CRM_receive.ashx", type: "POST",
                    data: issave,
                    success: function (responseText) {
                        $.ligerDialog.closeWaitting();
                        f_reload();
                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error('操作失败！');
                    }
                });

            }

        }
        function f_reload() {
            $("#maingrid4").ligerGetGridManager().loadData(true);
            $("#maingrid5").ligerGetGridManager().loadData(true);
        };

    </script>
</head>
<body>
    <form id="form1">
        <div id="toolbar"></div>
        <div class="l-loading" style="display: block" id="pageloading"></div>
        <div id="grid">
            <div id="maingrid4" style="margin: -1px; min-width: 800px;"></div>
            <div id="toolbar1"></div>
            <div id="maingrid5" style="margin: -1px -1px;"></div>
        </div>


    </form>
    <div class="az">
        <form id='serchform'>
            <table style='width: 720px' class="bodytable1">
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>公司名称：</div>
                    </td>
                    <td>
                        <input type='text' id='company' name='company' ltype='text' ligerui='{width:120}' /></td>


                    <td>
                        <div style='width: 60px; text-align: right; float: right'>成交时间：</div>
                    </td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='startdate' name='startdate' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='enddate' name='enddate' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>订单状态：</div>
                    </td>
                    <td>
                        <input id='contact' name="contact" type='text' /></td>

                    <td>
                        <div style='width: 60px; text-align: right; float: right'>成交人员：</div>
                    </td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='department' name='department' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='employee' name='employee' />
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <input id='Button2' type='button' value='重置' style='width: 80px; height: 24px' onclick="doclear()" />
                        <input id='Button1' type='button' value='搜索' style='width: 80px; height: 24px' onclick="doserch()" />
                    </td>
                </tr>

            </table>
        </form>
    </div>
</body>
</html>
