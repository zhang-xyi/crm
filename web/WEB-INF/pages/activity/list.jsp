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
    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <%--日历引入中文--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

    <%--表单绑定插件--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/form_bind.js"></script>

    <script type="text/javascript">

        $(function () {
            //加载分页插件
            $("#pagination").bs_pagination({
                currentPage:${pageInfo.pageNum},//当前页号
                rowsPerPage: ${pageInfo.pageSize},//每页记录数
                totalPages:${pageInfo.pages},//总共页号
                totalRows: ${pageInfo.total},//总记录数
                visiblePageLinks: 5,//页码导航标签个数
                showGoToPage: true,//是否显示直接去多少页的跳转
                showRowsPerPage: true,//是否显示每页记录数
                showRowsInfo: true,//是否显示行记录信息
                onChangePage: function (event, data) {
                    window.location.href = "${pageInfo.url}&pageNum=" + data.currentPage + "&pageSize=" + data.rowsPerPage;
                }
            });

            var dateSettings = {
                language: 'zh-CN',//使用中文语言，默认语言是英文(en)
                autoclose: true,
                minuteStep: 10,
                format: 'yyyy-mm-dd hh:ii:00'
            }

            $("#create-startTime").datetimepicker(dateSettings);
            $("#create-endTime").datetimepicker(dateSettings);
            $("#edit-startTime").datetimepicker(dateSettings);
            $("#edit-endTime").datetimepicker(dateSettings);
            $("#startTime").datetimepicker(dateSettings);
            $("#endTime").datetimepicker(dateSettings);

            $("#clearCreateStartTime").click(function () {
                $("#create-startTime").val("")
            })
            $("#clearCreateEndTime").click(function () {
                $("#create-endTime").val("")
            })
            $("#clearEditStartTime").click(function () {
                $("#edit-startTime").val("")
            })
            $("#clearEditEndTime").click(function () {
                $("#edit-endTime").val("")
            })
            $("#clearStartTime").click(function () {
                $("#startTime").val("")
            })
            $("#clearEndTime").click(function () {
                $("#endTime").val("")
            })


            $("#editBtn").click(function () {
                var checkedItem=$("[name=\"activityId\"]:checked")
                if (checkedItem.length==1){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/activity/update",
                        type:'GET',
                        dataType:'json',
                        data:{activityId:checkedItem.val()},
                        success:function (json) {
                            loadData("editForm",json)
                        }
                    })
                    $("#editActivityModal").modal("show")
                } else {
                    showMsg("请选择一项市场活动！")
                }
            })

            $(".activeTr").dblclick(function () {
                var activityId=$(this).find("[name=\"activityId\"]").val()
                window.location.href="${pageContext.request.contextPath}/activity/view?activityId="+activityId
            })


        });

    </script>
    <style>
        .activeTr>td>a{text-decoration: none}
    </style>
</head>
<body>
<%@include file="/WEB-INF/pages/inc/alert.jsp"%>
<!-- 创建市场活动的模态窗口 -->
<form action="${pageContext.request.contextPath}/activity/save" class="form-horizontal" role="form">
    <div class="modal fade" id="createActivityModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
                </div>
                <div class="modal-body">


                    <div class="form-group">
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityName" type="text" class="form-control" id="create-marketActivityName">
                        </div>
                        <label for="create-marketActivityPerson" class="col-sm-2 control-label">参与对象<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityPerson" type="text" class="form-control"
                                   id="create-marketActivityPerson">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-marketActivityPlace" class="col-sm-2 control-label">举办地点<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityPlace" type="text" class="form-control"
                                   id="create-marketActivityPlace">
                        </div>
                        <label for="create-marketActivityCost" class="col-sm-2 control-label">活动成本<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityCost" type="text" class="form-control" id="create-marketActivityCost">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="activityStartDate" type="text" class="form-control" id="create-startTime"
                                   readonly>
                            <span id="clearCreateStartTime" class="input-group-addon"
                                  style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="activityEndDate" type="text" class="form-control" id="create-endTime" readonly>
                            <span id="clearCreateEndTime" class="input-group-addon" style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">活动内容</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea name="activityContent" class="form-control" rows="3"
                                      id="create-describe"></textarea>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>

            </div>
        </div>
    </div>
</form>
<!-- 修改市场活动的模态窗口 -->
<form action="${pageContext.request.contextPath}/activity/saveUpdate" id="editForm" class="form-horizontal" role="form">
    <div class="modal fade" id="editActivityModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityName" type="text" class="form-control" id="edit-marketActivityName">
                        </div>
                        <label for="create-marketActivityPerson" class="col-sm-2 control-label">参与对象<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityPerson" type="text" class="form-control"
                                   id="edit-marketActivityPerson">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-marketActivityPlace" class="col-sm-2 control-label">举办地点<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityPlace" type="text" class="form-control"
                                   id="edit-marketActivityPlace">
                        </div>
                        <label for="create-marketActivityCost" class="col-sm-2 control-label">活动成本<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="activityCost" type="text" class="form-control" id="edit-marketActivityCost">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="activityStartDate" type="text" class="form-control" id="edit-startTime"
                                   readonly>
                            <span id="clearEditStartTime" class="input-group-addon"
                                  style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="activityEndDate" type="text" class="form-control" id="edit-endTime" readonly>
                            <span id="clearEditEndTime" class="input-group-addon" style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">活动内容</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea name="activityContent" class="form-control" rows="3"
                                      id="edit-content"></textarea>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">更新</button>
                </div>
            </div>
        </div>
    </div>
</form>

<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>市场活动列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input name="activityName" value="${param.activityName}" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input name="owner" value="${param.owner}" class="form-control" type="text">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">开始日期</div>
                        <input name="startTime" value="${param.startTime}" class="form-control" type="text" id="startTime" readonly/>
                        <span id="clearStartTime" class="input-group-addon"
                              style="cursor: pointer;width: 10px"><span
                                class="glyphicon glyphicon-remove"></span></span>
                    </div>

                    <div class="input-group">
                        <div class="input-group-addon ">结束日期</div>
                        <input class="form-control" name="endTime" value="${param.endTime}" type="text" id="endTime" readonly>
                        <span id="clearEndTime" class="input-group-addon"
                              style="cursor: pointer;width: 10px"><span
                                class="glyphicon glyphicon-remove"></span></span>
                    </div>
                </div>

                <button type="submit" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" id="addBtn" class="btn btn-primary" data-toggle="modal" data-target="#createActivityModal">
                    <span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" id="editBtn" class="btn btn-default" ><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>

        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox"/></td>
                    <td>名称</td>
                    <td>举办地点</td>
                    <td>参与对象</td>
                    <td>开始日期</td>
                    <td>结束日期</td>
                    <td>创建人</td>
                    <td>创建日期</td>
                    <td>修改人</td>
                    <td>修改日期</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="marketActivity" items="${pageInfo.list}">
                    <tr class="active activeTr">
                        <td><input type="checkbox" name="activityId" value="${marketActivity.activityId}"/></td>
                        <td><a style="text-decoration: none; cursor: pointer;"
                               onclick="window.location.href='${pageContext.request.contextPath}/activity/view?activityId=${marketActivity.activityId}';">
                                ${marketActivity.activityName}</a></td>
                        <td>${marketActivity.activityPlace}</td>
                        <td>${marketActivity.activityPerson}</td>
                        <td><fmt:formatDate value="${marketActivity.activityStartDate}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${marketActivity.activityEndDate}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${marketActivity.creator.employeeName}(${marketActivity.creator.employeeNo})</td>
                        <td><fmt:formatDate value="${marketActivity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${marketActivity.updator.employeeName}(${marketActivity.updator.employeeNo})</td>
                        <td><fmt:formatDate value="${marketActivity.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="pagination" style="height: 50px; position: relative;top: 30px;">

        </div>

    </div>

</div>
</body>
</html>