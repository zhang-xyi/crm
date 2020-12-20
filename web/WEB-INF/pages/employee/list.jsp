<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

	<%--翻页插件--%>
<link href="${pageContext.request.contextPath}/js/jquery/bs_pagination/jquery.bs_pagination.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bs_pagination/en.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bs_pagination/jquery.bs_pagination.min.js"></script>

	<%--日历插件--%>
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
	<%--日历引入中文--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
	<script>
        $(function(){
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
                onChangePage: function(event,data) {
                    window.location.href = "${pageInfo.url}&pageNum=" + data.currentPage + "&pageSize=" + data.rowsPerPage;
                }
            });

			var dateSettings={
				language:'zh-CN',//使用中文语言，默认语言是英文(en)
				autoclose: true,
				minuteStep:10
			}
			//加载时间选择器插件
			$("#startTime").datetimepicker(dateSettings);
			$("#endTime").datetimepicker(dateSettings);





		});
    </script>
</head>
<body>
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
				
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-loginActNo" class="col-sm-2 control-label">登录帐号<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-loginActNo">
							</div>
							<label for="create-username" class="col-sm-2 control-label">用户姓名</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-username">
							</div>
						</div>
						<div class="form-group">
							<label for="create-loginPwd" class="col-sm-2 control-label">登录密码<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="password" class="form-control" id="create-loginPwd">
							</div>
							<label for="create-confirmPwd" class="col-sm-2 control-label">确认密码<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="password" class="form-control" id="create-confirmPwd">
							</div>
						</div>
						<div class="form-group">
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-email">
							</div>
							<label for="create-expireTime" class="col-sm-2 control-label">失效时间</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-expireTime">
							</div>
						</div>
						<div class="form-group">
							<label for="create-lockStatus" class="col-sm-2 control-label">锁定状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-lockStatus">
								  <option></option>
								  <option>启用</option>
								  <option>锁定</option>
								</select>
							</div>
							<label for="create-org" class="col-sm-2 control-label">部门<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <select class="form-control" id="create-dept">
                                    <option></option>
                                    <option>市场部</option>
                                    <option>策划部</option>
                                </select>
                            </div>
						</div>
						<div class="form-group">
							<label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-allowIps" style="width: 280%" placeholder="多个用逗号隔开">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>用户列表</h3>
			</div>
		</div>
	</div>
	
	<div class="btn-toolbar" role="toolbar" style="position: relative; height: 80px; left: 30px; top: -10px;">
		<form class="form-inline" action="${pageContext.request.contextPath}/employee/list" role="form" style="position: relative;top: 8%; left: 5px;">
		  
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
					<c:forEach var="dept" items="${deptList}">
						<option value="${dept.deptId}" ${param.deptId eq dept.deptId ?"selected='selected'":""}>${dept.deptName}</option>
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
			      <option value="0" ${not empty param.employeeStatus and param.employeeStatus eq 0?"selected='selected'":""}>禁用</option>
				  <option value="1" ${param.employeeStatus eq 1?"selected='selected'":""}>启用</option>
			  </select>
		    </div>
		  </div>
		  <br><br>
		  
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-addon">失效时间</div>
			  <input name="startTime" value="${param.startTime}"  class="form-control" type="text" id="startTime" readonly/>
		    </div>
		  </div>
		  
		  ~
		  
		  <div class="form-group">
		    <div class="input-group">
			  <input name="endTime" value="${param.endTime}"  class="form-control" type="text" id="endTime" readonly/>
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-default">查询</button>
		  
		</form>
	</div>
	
	
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px; width: 110%; top: 20px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createUserModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
		
	</div>
	
	<div style="position: relative; left: 30px; top: 40px; width: 110%">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" /></td>
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
					<td><input type="checkbox" name="empyIds" value="${employee.employeeId}" /></td>
					<td>${vs.count}</td>
					<td><a  href="detail.html">${employee.employeeNo}</a></td>
					<td>${employee.employeeName}</td>
					<td>${employee.dept.deptName}</td>
					<td>${employee.employeeMail}</td>
					<td><fmt:formatDate value="${employee.employeeExpireTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${employee.employeeAllowedIps}</td>
					<td>${employee.employeeStatusStr}</td>
					<td>${employee.creator.employeeName}(${employee.creator.employeeNo})</td>
					<td><fmt:formatDate value="${employee.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${employee.updator.employeeName}(${employee.updator.employeeNo})</td>
					<td><fmt:formatDate value="${employee.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</c:forEach>
				<%--<tr>
					<td><input type="checkbox" /></td>
					<td>2</td>
					<td><a  href="detail.html">lisi</a></td>
					<td>李四</td>
					<td>市场部</td>
					<td>lisi@bjpowernode.com</td>
					<td>2017-02-14 10:10:10</td>
					<td>127.0.0.1,192.168.100.2</td>
					<td>锁定</td>
					<td>admin</td>
					<td>2017-02-10 10:10:10</td>
					<td>admin</td>
					<td>2017-02-10 20:10:10</td>
				</tr>--%>
			</tbody>
		</table>
	</div>

	
	<div id="pagination" style="height: 72px; position: relative;top: 30px; left: 30px;">
       <%-- <div>
		<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
	</div>
		<div class="btn-group" style="position: relative;top: -34px; left: 110px;">
			<button type="button" class="btn btn-default" style="cursor: default;">显示</button>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					10
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">20</a></li>
					<li><a href="#">30</a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
		</div>
		<div style="position: relative;top: -88px; left: 285px;">
			<nav>
				<ul class="pagination">
					<li class="disabled"><a href="#">首页</a></li>
					<li class="disabled"><a href="#">上一页</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">下一页</a></li>
					<li class="disabled"><a href="#">末页</a></li>
				</ul>
			</nav>
		</div>--%>
    </div>
			
</body>
</html>