<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script>
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
            //加载时间选择器插件
            $("#startTime").datetimepicker(dateSettings);
            $("#endTime").datetimepicker(dateSettings);
            $("#create-expireTime").datetimepicker(dateSettings);
            $("#edit-expireTime").datetimepicker(dateSettings);

            $("#clearStartTime").click(function () {
                $("#startTime").val("")
            })
            $("#clearEndTime").click(function () {
                $("#endTime").val("")
            })
            $("#clearExpireTime").click(function () {
                $("#create-expireTime").val("")
            })
            $("#editExpireTime").click(function () {
                $("#edit-expireTime").val("")
            })

            //弹出提示信息
            function showMsg(msg) {
                $("#msg").text(msg)
                $("#tipModal").modal("show");
            }

            // 编辑功能
            $("#editEmp").click(function () {
                var checkboxChecked = $("input[name=empyIds]:checked");
                if (checkboxChecked.length == 1) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/employee/get",
                        type: 'GET',
                        dataType: 'json',
                        data: {employeeId: checkboxChecked.val()},
                        success: function (json) {
                            loadData("editForm", json)
                        }
                    })

                    $("#editUserModal").modal("show");
                } else {
                    showMsg("请选择一位员工");
                    window.setTimeout(function () {
                        $("#tipModal").modal("hide");
                    }, 2500)
                }

            })


        });
    </script>
</head>
<body>

<form action="${pageContext.request.contextPath}/employee/saveAdd" class="form-horizontal" role="form">
    <!-- 创建用户的模态窗口 -->
    <div class="modal fade" id="createUserModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 90%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">新增用户</h4>
                </div>
                <div class="modal-body">


                    <div class="form-group">
                        <label for="create-loginActNo" class="col-sm-2 control-label">登录帐号<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeNo" type="text" class="form-control" id="create-loginActNo">
                        </div>
                        <label for="create-username" class="col-sm-2 control-label">用户姓名</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeName" type="text" class="form-control" id="create-username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">登录密码<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeePwd" type="password" class="form-control" id="create-loginPwd">
                        </div>
                        <label for="create-confirmPwd" class="col-sm-2 control-label">确认密码<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="password" class="form-control" id="create-confirmPwd">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeMail" type="text" class="form-control" id="create-email">
                        </div>
                        <label for="create-expireTime" class="col-sm-2 control-label">失效时间</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="employeeExpireTime" type="text" class="form-control" id="create-expireTime"
                                   readonly>
                            <span id="clearExpireTime" class="input-group-addon"
                                  style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-lockStatus" class="col-sm-2 control-label">锁定状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="employeeStatus" class="form-control" id="create-lockStatus">
                                <option value="">请选择锁定状态</option>
                                <option value="1">启用</option>
                                <option value="2">禁用</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label">部门<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="deptId" class="form-control" id="create-dept">
                                <option value="">请选择部门</option>
                                <c:forEach var="entry" items="${DEPTMAP_IN_APPLICATION}">
                                    <option value="${entry.key}" ${param.deptId eq entry.key ?"selected='selected'":""}>${entry.value.deptName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">性别<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="employeeSex" class="form-control" id="create-sex">
                                <option value="">请选择性别</option>
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                        <label for="create-confirmPwd" class="col-sm-2 control-label">年龄<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="employeeAge" class="form-control" id="create-age">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">手机号<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeePhone" type="text" class="form-control" id="create-phone">
                        </div>
                        <label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeAllowedIps" type="text" class="form-control" id="create-allowIps"
                                   placeholder="多个用逗号隔开">
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
<%--提示信息的模态窗口--%>
<div class="modal fade" id="tipModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <div id="msg" style="text-align: center;font-size: 16px"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑用户的模态窗口 -->
<form action="${pageContext.request.contextPath}/employee/saveUpdate" id="editForm" class="form-horizontal" role="form">
    <div class="modal fade" id="editUserModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 90%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">编辑用户</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="create-loginActNo" class="col-sm-2 control-label">登录帐号<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeNo" type="text" class="form-control" readonly>
                            <input type="hidden" name="employeeId">
                        </div>
                        <label for="create-username" class="col-sm-2 control-label">用户姓名</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeName" type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeMail" type="text" class="form-control">
                        </div>
                        <label for="edit-expireTime" class="col-sm-2 control-label">失效时间</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="employeeExpireTime" type="text" class="form-control" id="edit-expireTime"
                                   readonly>
                            <span id="editExpireTime" class="input-group-addon"
                                  style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-lockStatus" class="col-sm-2 control-label">锁定状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="employeeStatus" class="form-control">
                                <option value=""></option>
                                <option value="1">启用</option>
                                <option value="2">禁用</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label">部门<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="deptId" class="form-control">
                                <option value="">请选择部门</option>
                                <c:forEach var="entry" items="${DEPTMAP_IN_APPLICATION}">
                                    <option value="${entry.key}" ${param.deptId eq entry.key ?"selected='selected'":""}>${entry.value.deptName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">性别<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="employeeSex" class="form-control">
                                <option value="">请选择性别</option>
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                        <label for="create-confirmPwd" class="col-sm-2 control-label">年龄<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeAge" type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-loginPwd" class="col-sm-2 control-label">手机号<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeePhone" type="text" class="form-control">
                        </div>
                        <label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="employeeAllowedIps" type="text" class="form-control" placeholder="多个用逗号隔开">
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


<div>
    <div style="position: relative; left: 30px; top: -10px;">
        <div class="page-header">
            <h3>用户列表</h3>
        </div>
    </div>
</div>

<div class="btn-toolbar" role="toolbar" style="position: relative; height: 80px; left: 30px; top: -10px;">
    <form class="form-inline" action="${pageContext.request.contextPath}/employee/list" role="form"
          style="position: relative;top: 8%; left: 5px;">

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">用户姓名</div>
                <input name="employeeName" value="${param.employeeName}" class="form-control" type="text">
            </div>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">部门名称</div>
                <select name="deptId" class="form-control" type="text">
                    <option value="">请选择部门</option>
                    <c:forEach var="entry" items="${DEPTMAP_IN_APPLICATION}">
                        <option value="${entry.key}" ${param.deptId eq entry.key ?"selected='selected'":""}>${entry.value.deptName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">锁定状态</div>
                <select name="employeeStatus" class="form-control">
                    <option value="">不限</option>
                    <option value="2" ${not empty param.employeeStatus and param.employeeStatus eq 2?"selected='selected'":""}>
                        禁用
                    </option>
                    <option value="1" ${param.employeeStatus eq 1?"selected='selected'":""}>启用</option>
                </select>
            </div>
        </div>
        <br><br>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">失效时间</div>
                <input name="startTime" value="${param.startTime}" class="form-control" type="text" id="startTime"
                       readonly/>
                <span id="clearStartTime" class="input-group-addon" style="cursor: pointer"><span
                        class="glyphicon glyphicon-remove"></span></span>
            </div>
        </div>

        ~

        <div class="form-group">
            <div class="input-group">
                <input name="endTime" value="${param.endTime}" class="form-control" type="text" id="endTime" readonly/>
                <span id="clearEndTime" class="input-group-addon" style="cursor: pointer"><span
                        class="glyphicon glyphicon-remove"></span></span>
            </div>
        </div>

        <button type="submit" class="btn btn-default">查询</button>

    </form>
</div>


<div class="btn-toolbar" role="toolbar"
     style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px; width: 110%; top: 20px;">
    <div class="btn-group" style="position: relative; top: 18%;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createUserModal"><span
                class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button type="button" id="editEmp" class="btn btn-default"><span class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>

</div>

<div style="position: relative; left: 30px; top: 40px; width: 110%">
    <table class="table table-hover">
        <thead>
        <tr style="color: #B3B3B3;">
            <td><input type="checkbox"/></td>
            <td>序号</td>
            <td>登录帐号</td>
            <td>用户姓名</td>
            <td>部门名称</td>
            <td>邮箱</td>
            <td>失效时间</td>
            <td>允许访问IP</td>
            <td>锁定状态</td>
            <td>创建者</td>
            <td>创建时间</td>
            <td>修改者</td>
            <td>修改时间</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${pageInfo.list}" varStatus="vs">
            <tr class="active">
                <td><input type="checkbox" name="empyIds" value="${employee.employeeId}"/></td>
                <td>${vs.count}</td>
                <td><a href="detail.html">${employee.employeeNo}</a></td>
                <td>${employee.employeeName}</td>
                    <%--调用map的get(key)方法获取value--%>
                <td>${DEPTMAP_IN_APPLICATION[employee.deptId].deptName}</td>
                <td>${employee.employeeMail}</td>
                <td><fmt:formatDate value="${employee.employeeExpireTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${employee.employeeAllowedIps}</td>
                <td>${employee.employeeStatus==1?"<span style='color: green'>启用</span>":"<span style='color: red'>禁用</span>"}</td>
                    <%--<td>${employee.employeeStatusStr}</td>--%>
                <td>${employee.creator.employeeName}(${employee.creator.employeeNo})</td>
                <td><fmt:formatDate value="${employee.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${employee.updator.employeeName}(${employee.updator.employeeNo})</td>
                <td><fmt:formatDate value="${employee.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="pagination" style="height: 50px; position: relative;top: 30px;">

    </div>
</div>



</body>
</html>