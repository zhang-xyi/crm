<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <%--翻页插件--%>
    <link href="${pageContext.request.contextPath}/js/jquery/bs_pagination/jquery.bs_pagination.min.css" type="text/css"
          rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bs_pagination/en.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bs_pagination/jquery.bs_pagination.min.js"></script>

    <%--日历插件--%>
    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <%--日历引入中文--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

    <%--表单绑定插件--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/form_bind.js"></script>

    <%--自动补全插件--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>

    <script>
        $(function () {

            //客户名称自动补全
            $("#create-accountName").typeahead({
                source: function (value, process) {

                    $.post("${pageContext.request.contextPath}/customer/ajaxList",
                        {"name": value},
                        function (data) {
                            process(data);
                        },
                        "json");

                    /*$.get("/complete_data", function (data) {
						process(data);
					},"json");*/

                }, //end source
                //欲显示的文本
                displayText: function (item) {
                    //return "名称:" + item.deptName + ",id:" + item.deptId + ",code:" + item.deptCode;
                    return item.custName
                },
                afterSelect: function (item) {
                    var custId = item.custId;
                    //发送Ajax请求查询此客户的所有联系人
                    getlinkman(custId)
                    return $("#create-custId").val(custId);
                }
            })//end typeahead

            //市场活动自动补全
            $("#create-activitySrc").typeahead({
                source: function (value, process) {

                    $.post("${pageContext.request.contextPath}/activity/ajaxList",
                        {"name": value},
                        function (data) {
                            process(data);
                        },
                        "json");

                    /*$.get("/complete_data", function (data) {
						process(data);
					},"json");*/

                }, //end source
                //欲显示的文本
                displayText: function (item) {
                    //return 市场活动[2020/10/10-2020/10/10]
                    return item.activityName + "[" + item.activityStartDate + "-" + item.activityEndDate + "]"
                },
                afterSelect: function (item) {
                    $("#create-activityId").val(item.activityId)
                    return $("#create-activitySrc").val(item.activityName);
                }
            })//end typeahead

            //日期绑定
            $(".dealDate").datetimepicker({
                language: 'zh-CN',//使用中文语言，默认语言是英文(en)
                autoclose: true,
                minuteStep: 10,
                format: 'yyyy-mm-dd hh:ii:00'
            })//end datetimepicker

            //清除日期
            $("[name=\"clearDate\"]").click(function () {
                $(this).prev().val("")
            })

            //线索源弹窗
            $(".searchClue").focus(function () {
                $("#findMarketActivity").modal("show")
            })

            var historyVal = ""
            //线索搜索
            $("#clueKey").keyup(function () {

                var currentVal = $(this).val()
                if (historyVal != currentVal && currentVal) {
                    historyVal = currentVal

                    var key = $("#clueKey").val()

                    //发送ajax请求获取数据
                    $.post("${pageContext.request.contextPath}/clue/ajaxSearch",
                        {"key": key},
                        function (data) {
                            var clueTableBody = $("#clueTableBody")
                            //清空表格中的旧数据
                            clueTableBody.empty()

                            //追加新数据
                            var htmlContent = ""
                            $(data).each(function () {
                                var clueId = this.clueId
                                var clueTitle = this.clueTitle
                                var activityName = "市场活动名称"
                                //this.marketActivity.activityName
                                var cluePurposeName = this.cluePurposeName
                                var clueName = this.clueName
                                var createTime = this.createTime
                                htmlContent += ("<tr ondblclick=\"checkedClueTr(this)\">\n" +
                                    "              <td><input type=\"radio\" name=\"clueId\" value=\"" + clueId  + "\"  onclick=\"checkedClue(this);\"/></td>\n" +
                                    "              <td>" + clueTitle + "</td>\n" +
                                    "              <td>" + activityName + "</td>\n" +
                                    "              <td>" + cluePurposeName + "</td>\n" +
                                    "              <td>" + clueName + "</td>\n" +
                                    "              <td>" + createTime + "</td>\n" +
                                    "            </tr>")
                            })
                            clueTableBody.append(htmlContent)


                        },//end ajax function
                        //需指定返回的数据类型
                        "json")//end post
                }//end if
            })//end keyup function

            //提交表单
            $("#submitBtn").click(function () {
                $("#dealForm").submit()
            })

            //返回按钮
            $("#back").click(function () {
                window.location.href="${pageContext.request.contextPath}/deal/list"
            })

            //编辑时自动补全下拉框
            <c:if test="${not empty deal.dealNo}">
            getlinkman(${deal.customer.custId})
            </c:if>


        })//end ready

//——————————————————————————————————————————————————————————————————————————————————————————————————————————
        //function部分

        //获取级联目录的联系人
        function getlinkman(custId) {
            $.getJSON("${pageContext.request.contextPath}/customerLinkman/ajaxList",
                {"custId": custId},
                function (data) {
                    //迭代联系人，放到下拉框中
                    /*$(data).each(function (i,e) {
                        data[i].linkmanName
                        e.linkmanId
                    })*/
                    var createLinkman = $("#create-linkman")

                    //清空之前的option
                    //createLinkman.children().remove(":not(:first)")
                    createLinkman.children().remove("[value!='']")

                    $(data).each(function () {
                        //用拼接字符串的方式追加
                        //$("#create-linkman").append("<option value=\""+ this.linkmanId+"\">"+this.linkmanName+"</option>")
                        createLinkman.append(new Option(this.linkmanName, this.linkmanId))//(text,value)

                    })

                    //编辑时自动回显联系人
                    <c:if test="${not empty deal.dealNo}">
                    <!-- 如果是修改交易，则选中联系人-->
                    createLinkman.val(${deal.linkmanId});
                    </c:if>

                })
        }//end function getlinkman

        //重新计数
        function resetOrder() {

            var stageOrderDivs = $(".stage_order");
            //迭代此类div
            stageOrderDivs.each(function (i) {

                //拥有class=stage——order的div
                var stageOrderDiv = $(this)

                //查找div内部的input标签

                stageOrderDiv.find("[name$=\"]\.stageName\"]").attr("name","dealStages[" + i + "].stageName");
                stageOrderDiv.find("[name$=\"]\.stageAmont\"]").attr("name","dealStages[" + i + "].stageAmont");
                stageOrderDiv.next().find("[name$=\"]\.stagePlanDate\"]").attr("name","dealStages[" + i + "].stagePlanDate");
                stageOrderDiv.next().find("[name$=\"]\.isCurrent\"]").attr("name","dealStages[" + i + "].isCurrent");
                //选中当前div中的label下的所有span，选取第一个
                stageOrderDiv.children("label:first").children("span:first").html("阶段" + ++i)

            })
        }

        //绑定新增div的事件
        function insertNewDiv(btn) {

            $(btn).parents("div.form-group").after(
                "    <div class=\"form-group stage_order\">\n" +
                "        <label class=\"col-sm-2 control-label\"><span>阶段2</span><span style=\"font-size: 15px; color: red;\">*</span></label>\n" +
                "\n" +
                "        <div class=\"col-sm-10\" style=\"width: 300px;\">\n" +
                "            <input type=\"text\" class=\"form-control\" name=\"[].stageName\">\n" +
                "        </div>\n" +
                "\n" +
                "        <label class=\"col-sm-2 control-label\">金额<span style=\"font-size: 15px; color: red;\">*</span></label>\n" +
                "\n" +
                "        <div class=\"col-sm-10\" style=\"width: 300px;\">\n" +
                "            <input type=\"text\" class=\"form-control\" name=\"[].stageAmont\">\n" +
                "        </div>\n" +
                "    </div>\n" +
                "\n" +
                "    <div class=\"form-group\">\n" +
                "        <label class=\"col-sm-2 control-label\">现处阶段<span style=\"font-size: 15px; color: red;\">*</span></label>\n" +
                "\n" +
                "        <div class=\"col-sm-10\" style=\"width: 45px;height:45px;\">\n" +
                "            <input type=\"radio\" class=\"form-control\" name=\"[].isCurrent\" value=\"1\" onclick=\"currentGroup(this);\">\n" +
                "        </div>\n" +
                "        <label class=\"col-sm-2 control-label\" style=\"margin-left: 255px\">预计成交日期<span style=\"font-size: 15px; color: red;\">*</span></label>\n" +
                "\n" +
                "        <div class=\"col-sm-10 input-group\" style=\"width: 270px;margin-left: 845px\">\n" +
                "            <input type=\"text\" class=\"form-control dealDate1\" name=\"[].stagePlanDate\" readonly>\n" +
                "            <span name=\"clearDate1\" class=\"input-group-addon\"\n" +
                "                  style=\"cursor: pointer;width: 10px\"><span\n" +
                "                    class=\"glyphicon glyphicon-remove\"></span></span>"+
                "        </div>\n" +
                "\n" +
                "    </div>\n" +
                "\n" +
                "    <div class=\"form-group\">\n" +
                "        <label class=\"col-sm-2 control-label\"></label>\n" +
                "        <div class=\"col-sm-10\">\n" +
                "            <button type=\"button\" class=\"btn btn-primary\" title=\"在此位置插入新阶段\" onclick=\"insertNewDiv(this);\">\n" +
                "                <span class=\"glyphicon glyphicon-plus\"></span>\n" +
                "            </button>\n" +
                "\n" +
                "            <button type=\"button\" class=\"btn btn-danger\" title=\"删除阶段\" onclick=\"deleteDiv(this);\">\n" +
                "                <span class=\"glyphicon glyphicon-remove\"></span>\n" +
                "            </button>\n" +
                "        </div>\n" +
                "    </div>"
            )
            resetOrder()
            dateBound()
            clearDate()
        }//end function insertNewDiv

        //删除div
        function deleteDiv(btn) {
            var div3 = $(btn).parents("div.form-group")
            var div2 = div3.prev()
            var div1 = div2.prev()
            div1.remove()
            div2.remove()
            div3.remove()
            //重新排序
            resetOrder()
        }

        //为新增div添加日期插件
        function dateBound() {
            $(".dealDate1").datetimepicker({
                language: 'zh-CN',//使用中文语言，默认语言是英文(en)
                autoclose: true,
                minuteStep: 10,
                format: 'yyyy-mm-dd hh:ii:00'
            })
        }

        //为新增div添加清除日期
        function clearDate() {
            $("[name=\"clearDate1\"]").click(function () {
                $(this).prev().val("")
            })
        }

        //点击模态窗获取线索
        function checkedClue(radioBtn) {
            //1.为线索源的框中显示线索名称
            $("[name=\"clueName\"]").val($(radioBtn).parent().next().html())
            //2.为隐藏域隐藏id
            $("[name=\"clueId\"]").val($(radioBtn).val())
            //3.关闭当前模态窗
            $("#findMarketActivity").modal("hide")
            //4.模态窗内容清空
            $("#clueTableBody").empty()
            $("#clueKey").val("")

        }

        //双击获取线索
        function checkedClueTr(tr) {
            //1.为线索源的框中显示线索名称
            $("[name=\"clueName\"]").val($(tr).children("td:first").next().html())
            //2.为隐藏域隐藏id
            $("[name=\"clueId\"]").val($(tr).children("td:first").children().val())
            //3.关闭当前模态窗
            $("#findMarketActivity").modal("hide")
            //4.模态窗内容清空
            $("#clueTableBody").empty()
            $("#clueKey").val("")
        }

        //radio的单击选中函数
        function currentGroup(radioInput) {
            //1.取消所有的处于现阶段的选中状态
            $("[name^=\"dealStages[\"]").prop("checked",false)

            //2.选中当前被点击的
            $(radioInput).prop("checked",true)

        }

        //格式化日期
        /*function fmtDate(date) {
            return date.getFullYear()+"/"+date.getMonth()+"/"+date.getData();
        }*/

    </script>
</head>
<body>

<!-- 查找线索 -->
<div class="modal fade" id="findMarketActivity" role="dialog">
    <div class="modal-dialog" role="document" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">查找线索</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                    <form class="form-inline" role="form">
                        <div class="form-group has-feedback">
                            <input id="clueKey" type="text" class="form-control" style="width: 300px;"
                                   placeholder="请输入市场活动名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
                <table id="activityTable3" class="table table-hover"
                       style="width: 900px; position: relative;top: 10px;">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td></td>
                        <td>名称</td>
                        <td>市场活动名称</td>
                        <td>意向人</td>
                        <td>提供人</td>
                        <td>日期</td>
                    </tr>
                    </thead>
                    <tbody id="clueTableBody">
                    <c:forEach var="clue" items="${clueList}">
                        <tr ondblclick="checkedClueTr(this)">
                            <td><input type="radio"  name="clueId" value="${clue.clueId}" onclick="checkedClue(this)"/></td>
                            <td>${clue.clueTitle}</td>
                            <td>${clue.marketActivity.activityName}</td>
                            <td>${clue.cluePurposeName}</td>
                            <td>${clue.clueName}</td>
                            <td><fmt:formatDate value="${clue.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 查找联系人 -->
<%--<div class="modal fade" id="findContacts" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">查找联系人</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                    <form class="form-inline" role="form">
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" style="width: 300px;" placeholder="请输入联系人名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
                <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td></td>
                        <td>名称</td>
                        <td>邮箱</td>
                        <td>手机</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@bjpowernode.com</td>
                        <td>12345678901</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@bjpowernode.com</td>
                        <td>12345678901</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>--%>


<div style="position:  relative; left: 30px;">
    <h3>
        <c:if test="${empty deal.dealNo}">
            创建交易
        </c:if>
        <c:if test="${not empty deal.dealNo}">
            交易号：【${deal.dealNo}】
        </c:if>
    </h3>
    <div style="position: relative; top: -40px; left: 70%;">
        <button type="button" class="btn btn-primary" id="submitBtn">保存</button>
        <button type="button" class="btn btn-default" id="back" >取消</button>
    </div>
    <hr style="position: relative; top: -40px;">
</div>

<form id="dealForm" action="${pageContext.request.contextPath}/deal/save" method="post" class="form-horizontal" role="form" style="position: relative; top: -30px;" >
    <div class="form-group">
        <label for="create-transactionName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input name="dealName" value="${deal.dealName}" type="text" class="form-control" id="create-transactionName">
            <input type="hidden" name="dealId" value="${deal.dealId}">
        </div>
        <label for="create-amountOfMoney" class="col-sm-2 control-label">金额<span style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input name="dealAmont" value="${deal.dealAmont}" type="text" class="form-control" id="create-amountOfMoney">
        </div>
    </div>

    <div class="form-group">
        <label for="create-accountName" class="col-sm-2 control-label">客户名称<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" value="${deal.customer.custName}" class="form-control" id="create-accountName" placeholder="支持自动补全，输入客户不存在则新建" autocomplete="off">
            <input type="hidden" id="create-custId" value="${deal.customer.custId}">
        </div>

        <label for="create-dealPlanDate" class="col-sm-2 control-label">预计成交日期<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10 input-group" style="width: 270px;margin-left: 845px">
            <fmt:formatDate value="${deal.dealPlanDate}" var="dealPlanDate" pattern="yyyy-MM-dd HH:mm:ss"/>
            <input type="text" name="dealPlanDate" value="${dealPlanDate}" class="form-control dealDate" id="create-dealPlanDate" readonly>
            <span name="clearDate" class="input-group-addon"
                  style="cursor: pointer;width: 10px"><span
                    class="glyphicon glyphicon-remove"></span></span>
        </div>

    </div>

    <div class="form-group">

        <label for="create-linkman" class="col-sm-2 control-label">联系人</label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="linkmanId" id="create-linkman">
                <option value="">请选择联系人</option>
            </select>
        </div>

        <label for="create-dealActualDate" class="col-sm-2 control-label">实际成交日期<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10 input-group" style="width: 270px;margin-left: 845px">
            <fmt:formatDate value="${deal.dealActualDate}" var="dealActualDate" pattern="yyyy-MM-dd HH:mm:ss"/>
            <input name="dealActualDate" value="${dealActualDate}" type="text" class="form-control dealDate" id="create-dealActualDate" readonly>
            <span name="clearDate" class="input-group-addon"
                  style="cursor: pointer;width: 10px"><span
                    class="glyphicon glyphicon-remove"></span></span>
        </div>

    </div>

    <!-- 阶段开始 -->
    <hr style="position: relative;width:80%">

    <%--如果是添加--%>
    <c:if test="${empty deal.dealNo}">
    <%--阶段1开始--%>
    <div class="form-group stage_order">
        <label class="col-sm-2 control-label"><span>阶段1</span><span
                style="font-size: 15px; color: red;">*</span></label>

        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="dealStages[0].stageName">
        </div>

        <label class="col-sm-2 control-label">金额<span
                style="font-size: 15px; color: red;">*</span></label>

        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="dealStages[0].stageAmont">
        </div>
    </div>

    <div class="form-group">

        <label class="col-sm-2 control-label">现处阶段<span
                style="font-size: 15px; color: red;">*</span></label>

        <div class="col-sm-10" style="width: 45px;height:45px;">
            <input type="radio" class="form-control" name="dealStages[0].isCurrent" value="1" checked="checked" onclick="currentGroup(this);"/>
        </div>

        <label class="col-sm-2 control-label" style="margin-left: 255px">预计成交日期<span
                style="font-size: 15px; color: red;">*</span></label>

        <div class="col-sm-10 input-group" style="width: 270px;margin-left: 845px">
            <input type="text" class="form-control dealDate" name="dealStages[0].stagePlanDate" readonly>
            <span name="clearDate" class="input-group-addon"
                  style="cursor: pointer;width: 10px"><span
                    class="glyphicon glyphicon-remove"></span></span>
        </div>

    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <button type="button" class="btn btn-primary deal_plus" title="在此位置插入新阶段" onclick="insertNewDiv(this);">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
        </div>
    </div>
    <!-- 阶段1结束 -->
    </c:if>

    <%--如果是编辑--%>
    <c:if test="${not empty deal.dealNo}">

        <c:forEach var="dealStage" items="${deal.dealStages}" varStatus="vs">

            <!--阶段${vs.count}开始-->
            <div class="form-group stage_order">
                <label class="col-sm-2 control-label"><span>阶段${vs.count}</span><span
                        style="font-size: 15px; color: red;">*</span></label>

                <div class="col-sm-10" style="width: 300px;">
                    <input type="text" class="form-control" name="dealStages[${vs.index}].stageName" value="${dealStage.stageName}">
                </div>

                <label class="col-sm-2 control-label">金额<span
                        style="font-size: 15px; color: red;">*</span></label>

                <div class="col-sm-10" style="width: 300px;">
                    <fmt:formatNumber var="stageAmont" value="${dealStage.stageAmont}" pattern="##.00"/>
                    <input type="text" class="form-control" name="dealStages[${vs.index}].stageAmont" value="${stageAmont}">
                </div>
            </div>

            <div class="form-group">

                <label class="col-sm-2 control-label">现处阶段<span
                        style="font-size: 15px; color: red;">*</span></label>

                <div class="col-sm-10" style="width: 45px;height:45px;">
                    <input type="radio" class="form-control" name="dealStages[${vs.index}].isCurrent" value="1"
                           ${dealStage.isCurrent eq 1 ? "checked='checked'":""} onclick="currentGroup(this);"/>
                </div>

                <label class="col-sm-2 control-label" style="margin-left: 255px">预计成交日期<span
                        style="font-size: 15px; color: red;">*</span></label>

                <div class="col-sm-10 input-group" style="width: 270px;margin-left: 845px">
                    <fmt:formatDate value="${dealStage.stagePlanDate}" var="stagePlanDate" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <input type="text" class="form-control dealDate" name="dealStages[${vs.index}].stagePlanDate" value="${stagePlanDate}" readonly>
                    <span name="clearDate" class="input-group-addon"
                          style="cursor: pointer;width: 10px"><span
                            class="glyphicon glyphicon-remove"></span></span>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <button type="button" class="btn btn-primary deal_plus" title="在此位置插入新阶段" onclick="insertNewDiv(this);">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>

                    <c:if test="${not vs.first}">
                        <button type="button" class="btn btn-danger" title="删除阶段" onclick="deleteDiv(this)">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                    </c:if>

                </div>
            </div>
            <!-- 阶段${vs.count}结束 -->

        </c:forEach>

    </c:if>

    <hr style="position: relative;width:80%">

    <!-- 阶段结束 -->


    <div class="form-group">
        <label for="create-transactionType" class="col-sm-2 control-label">交易类型</label>
        <div class="col-sm-10" style="width: 300px;">
            <select name="dealType" class="form-control" id="create-transactionType">
                <option value="">请选择交易类型</option>
                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.transactionType}">
                    <option value="${entry.key}" ${deal.dealType eq entry.key ? "selected='selected'":""}>${entry.value.dictValue}</option>
                </c:forEach>

            </select>
        </div>
        <label for="create-dealway" class="col-sm-2 control-label">交易方式</label>
        <div class="col-sm-10" style="width: 300px;">
            <select name="dealWay" class="form-control" id="create-dealway">
                <option value="">请选择交易方式</option>
                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.dealway}">
                    <option value="${entry.key}" ${deal.dealWay eq entry.key ? "selected='selected'":""}>${entry.value.dictValue}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="create-clueSource" class="col-sm-2 control-label">来源</label>
        <div class="col-sm-10" style="width: 300px;">
            <select name="dealSource" class="form-control" id="create-clueSource">
                <option value="">请选择来源</option>
                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.source}">
                    <option value="${entry.key}" ${deal.dealSource eq entry.key ? "selected='selected'":""}>${entry.value.dictValue}</option>
                </c:forEach>
            </select>
        </div>
        <label for="create-activitySrc" class="col-sm-2 control-label">市场活动源</label>
        <div class="col-sm-10" style="width: 300px;">
            <input name="activityName" type="text" class="form-control" id="create-activitySrc"
                   value="${deal.marketActivity.activityName}" autocomplete="off">
            <input name="activityId" type="hidden" id="create-activityId" value="${deal.activityId}">
        </div>

    </div>

    <div class="form-group">

        <label for="create-activitySrc" class="col-sm-2 control-label">线索源&nbsp;&nbsp;
            <a href="javascript:void(0);" class="searchClue"><span
                    class="glyphicon glyphicon-search "></span></a></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" name="clueName" class="form-control searchClue" id="create-clueSrc"
                   value="${deal.clue.clueName}" readonly>
            <input name="clueId" type="hidden" value="${deal.clueId}">
        </div>
    </div>

    <div class="form-group">
        <label for="create-describe" class="col-sm-2 control-label">描述</label>
        <div class="col-sm-10" style="width: 70%;">
            <textarea name="dealContent" class="form-control" rows="3" id="create-describe" >${deal.dealContent}</textarea>
        </div>
    </div>
</form>
<!-- 阶段2开始 -->

<%--<div class="form-group">
    <label class="col-sm-2 control-label">阶段2<span style="font-size: 15px; color: red;">*</span></label>

    <div class="col-sm-10" style="width: 300px;">
        <input type="text" class="form-control">
    </div>

    <label class="col-sm-2 control-label">金额<span tyle="font-size: 15px; color: red;">*</span></label>

    <div class="col-sm-10" style="width: 300px;">
        <input type="text" class="form-control">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label">预计成交日期<span style="font-size: 15px; color: red;">*</span></label>

    <div class="col-sm-10" style="width: 300px;">
        <input type="text" class="form-control">
    </div>

    <label class="col-sm-2 control-label">现处阶段2<span style="font-size: 15px; color: red;">*</span></label>

    <div class="col-sm-10" style="width: 45px;height:45px;">
        <input type="radio" class="form-control">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label"></label>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary" title="在此位置插入新阶段">
            <span class="glyphicon glyphicon-plus"></span>
        </button>

        <button type="button" class="btn btn-danger" title="删除阶段">
            <span class="glyphicon glyphicon-remove"></span>
        </button>
    </div>
</div>--%>
<!-- 阶段2结束 -->
</body>
</html>