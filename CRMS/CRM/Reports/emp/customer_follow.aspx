﻿<%@ Page Language="C#" AutoEventWireup="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <link href="../../CSS/core.css" rel="stylesheet" type="text/css" />
    <link href="../../lib/ligerUI/skins/ext/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/Toolbar.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/input.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>

    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
   <script src="../../../lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="../../lib/json.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>

    <script src="../../JS/FusionCharts/FusionCharts.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager;
        var manager1;
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });


            $("#maingrid5").ligerGrid({
                columns: [
                    { display: '编号', width: 40, render: function (item, i) { return i + 1; } },
                    {
                        display: '员工姓名', name: 'name', width: 120, render: function (item) {
                            if (item.name == "")
                                item.name = "未分类";
                            return item.name;
                        },
                        totalSummary: { type: 'total' }
                    },
                    {
                        display: '一月', name: 'm1', width: 50, render: function (item) {
                            if (typeof (item.m1) == "number" && item.m1 != "0")
                                return item.m1;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '二月', name: 'm2', width: 50, render: function (item) {
                            if (typeof (item.m2) == "number" && item.m2 != "0")
                                return item.m2;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '三月', name: 'm3', width: 50, render: function (item) {
                            if (typeof (item.m3) == "number" && item.m3 != "0")
                                return item.m3;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '四月', name: 'm4', width: 50, render: function (item) {
                            if (typeof (item.m4) == "number" && item.m4 != "0")
                                return item.m4;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '五月', name: 'm5', width: 50, render: function (item) {
                            if (typeof (item.m5) == "number" && item.m5 != "0")
                                return item.m5;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '六月', name: 'm6', width: 50, render: function (item) {
                            if (typeof (item.m6) == "number" && item.m6 != "0")
                                return item.m6;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '七月', name: 'm7', width: 50, render: function (item) {
                            if (typeof (item.m7) == "number" && item.m7 != "0")
                                return item.m7;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '八月', name: 'm8', width: 50, render: function (item) {
                            if (typeof (item.m8) == "number" && item.m8 != "0")
                                return item.m8;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '九月', name: 'm9', width: 50, render: function (item) {
                            if (typeof (item.m9) == "number" && item.m9 != "0")
                                return item.m9;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '十月', name: 'm10', width: 40, render: function (item) {
                            if (typeof (item.m10) == "number" && item.m10 != "0")
                                return item.m10;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '十一月', name: 'm11', width: 50, render: function (item) {
                            if (typeof (item.m11) == "number" && item.m11 != "0")
                                return item.m11;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    },
                    {
                        display: '十二月', name: 'm12', width: 50, render: function (item) {
                            if (typeof (item.m12) == "number" && item.m12 != "0")
                                return item.m12;
                            else
                                return "0";
                        },
                        totalSummary: { type: 'sum' }
                    }
                ],
                url: '../../data/CRM_Follow.ashx',
                usePager: false,
                //dataAction: 'local', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                width: '100%', height: '100%',
                title: "年度统计表",
                heightDiff: -6
            });


            var items = [];
            items.push({ type: 'textbox', id: 'tree1', text: '部门：' });
            items.push({ type: 'textbox', id: 'syear', text: '年度：' });
            items.push({ type: 'button', text: '统计', icon: '../../images/search.gif', disable: true, click: function () { doserch() } });
            items.push({ type: 'button', text: '重置', icon: '../../images/edit.gif', disable: true, click: function () { $("#serchform").each(function () { this.reset(); }); } });

            $("#toolbar").ligerToolBar({
                items: items
            });

            initSelect();

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height() - 350);
            $("#pageloading").fadeOut(400);

            $("#maingrid5").ligerGetGridManager().onResize();
            //doserch();
        });

        function initSelect() {

            var d = new Date();
            var nowYear = +d.getFullYear();
            var syearData = [];
            for (var i = nowYear; i >= nowYear - 20; i--) {
                syearData.push({ 'text': i, 'id': i });
            }
            $("#syear").ligerComboBox({
                width: 100,
                data: syearData,
                initValue: nowYear
            })


            $('#tree1').ligerComboBox({
                width: 200,
                selectBoxWidth: 240,
                selectBoxHeight: 200,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: true,
                //checkbox: true,
                tree: {
                    url: '../../data/Base.ashx?Action=getUserTree&rnd=' + Math.random(),
                    idFieldName: 'id',
                    parentIDFieldName: 'pid',
                    checkbox: true
                },
                onSelected: function (newvalue, newtext, newid) {

                    //alert($("#tree1_val").val())

                }
            });



        }

        function test(GridData) {
            var chart_myNext = new FusionCharts("../../js/FusionCharts/FCF_MSColumn3DLineDY.swf", "myNext", "860", "280", "0", "0");
            var xmltext = "";
            xmltext += "<graph caption='员工客户跟进统计'   decimalPrecision='0' formatNumberScale='0' baseFontSize='12' yAxisMinValue='0' yAxisMaxValue='1'   showValues='0'>";
            xmltext += "   <categories>";
            xmltext += "        <category name='一月' /><category name='二月' /><category name='三月' /><category name='四月' /><category name='五月' /><category name='六月' /><category name='七月' /><category name='八月' /><category name='九月' /><category name='十月' /><category name='十一月' /><category name='十二月' />";
            xmltext += "   </categories>";

            var color = ['AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E', 'D64646', '8E468E', '588526', 'B3AA00', '008ED6', '9D080D', 'A186BE', 'AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E', 'D64646', '8E468E', '588526', 'B3AA00', '008ED6', '9D080D', 'A186BE', 'AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E', 'D64646', '8E468E', '588526', 'B3AA00', '008ED6', '9D080D', 'A186BE', 'AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E', 'D64646', '8E468E', '588526', 'B3AA00', '008ED6', '9D080D', 'A186BE', 'AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E', 'D64646', '8E468E', '588526', 'B3AA00', '008ED6', '9D080D', 'A186BE'];

            var mc1 = 0; mc2 = 0; mc3 = 0; mc4 = 0; mc5 = 0; mc6 = 0; mc7 = 0; mc8 = 0; mc9 = 0; mc10 = 0; mc11 = 0; mc12 = 0;
            for (var i = 0; i < GridData.Rows.length; i++) {
                var m1 = typeof (GridData.Rows[i].m1) != 'number' ? 0 : GridData.Rows[i].m1;
                var m2 = typeof (GridData.Rows[i].m2) != 'number' ? 0 : GridData.Rows[i].m2;
                var m3 = typeof (GridData.Rows[i].m3) != 'number' ? 0 : GridData.Rows[i].m3;
                var m4 = typeof (GridData.Rows[i].m4) != 'number' ? 0 : GridData.Rows[i].m4;
                var m5 = typeof (GridData.Rows[i].m5) != 'number' ? 0 : GridData.Rows[i].m5;
                var m6 = typeof (GridData.Rows[i].m6) != 'number' ? 0 : GridData.Rows[i].m6;
                var m7 = typeof (GridData.Rows[i].m7) != 'number' ? 0 : GridData.Rows[i].m7;
                var m8 = typeof (GridData.Rows[i].m8) != 'number' ? 0 : GridData.Rows[i].m8;
                var m9 = typeof (GridData.Rows[i].m9) != 'number' ? 0 : GridData.Rows[i].m9;
                var m10 = typeof (GridData.Rows[i].m10) != 'number' ? 0 : GridData.Rows[i].m10;
                var m11 = typeof (GridData.Rows[i].m11) != 'number' ? 0 : GridData.Rows[i].m11;
                var m12 = typeof (GridData.Rows[i].m12) != 'number' ? 0 : GridData.Rows[i].m12;
                m1 = (m1 == 0 ? 0.001 : m1); m2 = (m2 == 0 ? 0.001 : m2); m3 = (m3 == 0 ? 0.001 : m3); m4 = (m4 == 0 ? 0.001 : m4); m5 = (m5 == 0 ? 0.001 : m5); m6 = (m6 == 0 ? 0.001 : m6);
                m7 = (m7 == 0 ? 0.001 : m7); m8 = (m8 == 0 ? 0.001 : m8); m9 = (m9 == 0 ? 0.001 : m9); m10 = (m10 == 0 ? 0.001 : m10); m11 = (m11 == 0 ? 0.001 : m11); m12 = (m12 == 0 ? 0.001 : m12);
                xmltext += "   <dataset seriesName='" + GridData.Rows[i].name + "' color='" + color[i] + "'><set value='" + m1 + "' /><set value='" + m2 + "' /><set value='" + m3 + "' /><set value='" + m4 + "' /><set value='" + m5 + "' /><set value='" + m6 + "' /><set value='" + m7 + "' /><set value='" + m8 + "' /><set value='" + m9 + "' /><set value='" + m10 + "' /><set value='" + m11 + "' /><set value='" + m12 + "' /></dataset>";
                mc1 += m1; mc2 += m2; mc3 += m3; mc4 += m4; mc5 += m5; mc6 += m6; mc7 += m7; mc8 += m8; mc9 += m9; mc10 += m10; mc11 += m11; mc12 += m12;
            }
            xmltext += "   <dataset seriesName='总计' color='ff00ff' parentYAxis='S'><set value='" + mc1 + "' /><set value='" + mc2 + "' /><set value='" + mc3 + "' /><set value='" + mc4 + "' /><set value='" + mc5 + "' /><set value='" + mc6 + "' /><set value='" + mc7 + "' /><set value='" + mc8 + "' /><set value='" + mc9 + "' /><set value='" + mc10 + "' /><set value='" + mc11 + "' /><set value='" + mc12 + "' /></dataset>";

            xmltext += "</graph>"

            chart_myNext.setDataXML(xmltext);
            chart_myNext.render("graph");
        }
        function doserch() {
            var sendtxt = "&Action=emp_cusfollow&idlist=" + $("#tree1_val").val() + "&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            var manager = $("#maingrid5").ligerGetGridManager();

            top.$.ligerDialog.waitting('数据查询中,请稍候...');
            $.ajax({
                url: "../../data/CRM_Follow.ashx", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {
                    manager.showData({ Rows: [], Total: 0 });
                },
                success: function (responseText) {
                    manager.setURL("../../data/CRM_Follow.ashx?" + serchtxt);
                    manager.showData(responseText);
                    top.$.ligerDialog.closeWaitting();
                    test(responseText);
                },
                error: function () {
                    top.$.ligerDialog.closeWaitting();
                    top.$.ligerDialog.error('查询失败！请检查查询项。');
                }
            });
            //test();
        }
        function f_reload() {
            var manager = $("#maingrid5").ligerGetGridManager();
            manager.loadData(true);
        };
    </script>
</head>
<body>
    <div style="position: relative; z-index: 9999">
        <form id="serchform">
            <div id="toolbar"></div>
        </form>
    </div>

    <form id="form1">
        <div id="griddiv">
            <div id="graph" style="height: 280px; margin: 5px;"></div>
            <div class="l-loading" style="display: block" id="pageloading"></div>
            <div id="maingrid5" style="margin: -1px -1px;"></div>
        </div>
    </form>


</body>
</html>