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

            //定制字段
            $("#definedColumns > li").click(function (e) {
                //防止下拉菜单消失
                e.stopPropagation();
            });

            $("#create-birth").datetimepicker({
                language: 'zh-CN',//使用中文语言，默认语言是英文(en)
                autoclose: true,
                minView:'month',
                format: 'yyyy-mm-dd'
            })

            $("#create-nextContactTime1").datetimepicker({
                language: 'zh-CN',//使用中文语言，默认语言是英文(en)
                autoclose: true,
                minuteStep: 10,
                format: 'yyyy-mm-dd hh:ii:00'
            })

            $("#clearBirth").click(function () {
                $("#create-birth").val("")
            })

            $("#create-nextContactTime1").click(function () {
                $("#create-nextContactTime1").val("")
            })

        });

    </script>
</head>
<body>


<!-- 创建联系人的模态窗口 -->
<div class="modal fade" id="createContactsModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/customerLinkman/save" method="post" class="form-horizontal" role="form">
            <div class="modal-header">
                <button type="button" class="close" onclick="$('#createContactsModal').modal('hide');">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabelx">创建联系人</h4>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <label for="create-customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="custName" value="${customer.custName}" type="text" class="form-control" id="create-customerName" readonly>
                            <input type="hidden" name="custId" value="${param.custId}" >
                        </div>
                        <label for="create-dept" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="linkmanDept" class="form-control" id="create-dept">
                                <option value="">请选择部门</option>
                                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.department}">
                                    <option value="${entry.value.dictValue}">${entry.value.dictValue}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <%--<label for="create-clueSource" class="col-sm-2 control-label">来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="" class="form-control" id="create-clueSource">
                                <option value="">请选择来源</option>
                                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.source}">
                                    <option value="${entry.key}">${entry.value.dictValue}</option>
                                </c:forEach>
                            </select>
                        </div>--%>
                    </div>

                    <div class="form-group">
                        <label for="create-surname" class="col-sm-2 control-label">姓名<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanName" type="text" class="form-control" id="create-surname">
                        </div>
                        <label for="create-linkmanAppellation" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="linkmanAppellation" class="form-control" id="create-linkmanAppellation">
                                <option value="">请选择称呼</option>
                                <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION.appellation}">
                                    <option value="${entry.key}">${entry.value.dictValue}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanSex" value="0" checked="checked" type="radio" >男
                            <input name="linkmanSex" value="1" type="radio" >女
                        </div>
                        <label for="create-sex" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanAge" type="text" class="form-control" id="create-sex">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanJob" type="text" class="form-control" id="create-job">
                        </div>
                        <label for="create-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanMobelPhone" type="text" class="form-control" id="create-mphone">
                        </div>
                    </div>

                    <div class="form-group" style="position: relative;">
                        <label for="create-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input name="linkmanMail" type="text" class="form-control" id="create-email">
                        </div>
                        <label for="create-birth" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10 input-group" style="width: 270px;">
                            <input name="linkmanBirthday" type="text" class="form-control" id="create-birth" readonly>
                            <span id="clearBirth" class="input-group-addon"
                                  style="cursor: pointer;width: 10px"><span
                                    class="glyphicon glyphicon-remove"></span></span>
                        </div>
                    </div>


                    <div style="position: relative;">
                        <div class="form-group">

                            <label for="create-phone" class="col-sm-2 control-label">座机</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input name="linkmanPhone" type="text" class="form-control" id="create-phone">
                            </div>
                            <label for="create-nextContactTime1" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10 input-group" style="width: 270px;">
                                <input name="linkmanNextDate" type="text" class="form-control" id="create-nextContactTime1" readonly>
                                <span id="clearNextContactTime1" class="input-group-addon"
                                      style="cursor: pointer;width: 10px"><span
                                        class="glyphicon glyphicon-remove"></span></span>
                            </div>
                        </div>
                    </div>

                    <div style="position: relative">
                        <div class="form-group">
                            <label for="create-describe" class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea name="linkmanRemark" class="form-control" rows="3" id="create-describe"></textarea>
                            </div>
                        </div>
                    </div>

                    <div style="position: relative;">
                        <div class="form-group">
                            <label for="edit-address1" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea name="linkmanAdress" class="form-control" rows="1" id="edit-address1">北京大兴区大族企业湾</textarea>
                            </div>
                        </div>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" >保存</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- 修改联系人的模态窗口 -->
<div class="modal fade" id="editContactsModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改联系人</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="edit-contactsOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-contactsOwner">
                                <option selected>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="edit-clueSource1" class="col-sm-2 control-label">来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-clueSource1">
                                <option></option>
                                <option selected>广告</option>
                                <option>推销电话</option>
                                <option>员工介绍</option>
                                <option>外部介绍</option>
                                <option>在线商场</option>
                                <option>合作伙伴</option>
                                <option>公开媒介</option>
                                <option>销售邮件</option>
                                <option>合作伙伴研讨会</option>
                                <option>内部研讨会</option>
                                <option>交易会</option>
                                <option>web下载</option>
                                <option>web调研</option>
                                <option>聊天</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-surname" class="col-sm-2 control-label">姓名<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-surname" value="李四">
                        </div>
                        <label for="edit-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-call">
                                <option></option>
                                <option selected>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-job" value="CTO">
                        </div>
                        <label for="edit-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-mphone" value="12345678901">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-email" value="lisi@bjpowernode.com">
                        </div>
                        <label for="edit-birth" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-birth">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-customerName"
                                   placeholder="支持自动补全，输入客户不存在则新建" value="动力节点">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe">这是一条线索的描述信息</textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input name="linkmanNextDate" type="text" class="form-control" id="create-nextContactTime">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="edit-address2" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="1" id="edit-address2">北京大兴区大族企业湾</textarea>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>联系人列表</h3>
        </div>
    </div>
</div>

<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">

    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">


        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 10px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createContactsModal">
                    <span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editContactsModal"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>


        </div>
        <div style="position: relative;top: 20px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox"/></td>
                    <td>姓名</td>
                    <td>客户名称</td>
                    <td>电话</td>
                    <td>职务</td>
                    <td>部门</td>
                    <td>年龄</td>
                    <td>性别</td>
                    <td>称呼</td>
                    <td>生日</td>
                    <td>所有者</td>

                </tr>
                </thead>

                <tbody>
                <c:forEach var="customerLinkman" items="${cutomerLinkmanList}" varStatus="vs">
                    <tr>
                        <td><input type="checkbox" name="linkmanId" value="${customerLinkman.linkmanId}"/></td>
                        <td><a style="text-decoration: none; cursor: pointer;"
                              href="${pageContext.request.contextPath}/customerLinkman/view?linkmanId=${customerLinkman.linkmanId}">${customerLinkman.linkmanName}</a></td>
                        <td>${customerLinkman.customer.custName}</td>
                        <td>${customerLinkman.linkmanMobelPhone},${customerLinkman.linkmanPhone}</td>
                        <td>${customerLinkman.linkmanJob}</td>
                        <td>${customerLinkman.linkmanDept}</td>
                        <td>${customerLinkman.linkmanAge}</td>
                        <td>${customerLinkman.linkmanSex==1?"女":"男"}</td>
                        <td>${customerLinkman.linkmanAppellation}</td>
                        <td><fmt:formatDate value="${customerLinkman.linkmanBirthday}" pattern="yyyy-MM-dd"/></td>
                        <td>${customerLinkman.creator.employeeName}(${customerLinkman.creator.employeeNo})</td>
                        <td><fmt:formatDate value="${customerLinkman.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${customerLinkman.creator.employeeName}(${customerLinkman.creator.employeeNo})</td>
                        <td><fmt:formatDate value="${customerLinkman.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

</div>
</body>
</html>