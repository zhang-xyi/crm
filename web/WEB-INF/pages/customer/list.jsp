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

	$(function(){
		
		//定制字段
		$("#definedColumns > li").click(function(e) {
			//防止下拉菜单消失
	        e.stopPropagation();
	    });

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



		// 查看联系人
		$("#customerLink").click(function () {
			var custId=$("[name=\"custId\"]:checked")
			if (custId.length==1){
				window.location.href="${pageContext.request.contextPath}/customerLinkman/list?custId="+custId.val();
			} else {
				showMsg("请选择一位客户")
			}
		})

		
	});
	
</script>
</head>
<body>
<%@include file="/WEB-INF/pages/inc/alert.jsp"%>

	<!-- 创建客户的模态窗口 -->
	<div class="modal fade" id="createCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建客户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-customerOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-customerOwner">
								  <option>zhangsan</option>
								  <option>lisi</option>
								  <option>wangwu</option>
								</select>
							</div>
							<label for="create-customerName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-customerName">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="create-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-website">
                            </div>
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone">
							</div>
						</div>
						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-describe"></textarea>
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
                                    <input type="text" class="form-control" id="create-nextContactTime">
                                </div>
                            </div>
                        </div>

                        <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="create-address1" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address1"></textarea>
                                </div>
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
	
	<!-- 修改客户的模态窗口 -->
	<div class="modal fade" id="editCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="edit-customerOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-customerOwner">
								  <option>zhangsan</option>
								  <option>lisi</option>
								  <option>wangwu</option>
								</select>
							</div>
							<label for="edit-customerName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-customerName" value="动力节点">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-website" value="http://www.bjpowernode.com">
                            </div>
							<label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-phone" value="010-84846003">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-describe"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                        <div style="position: relative;top: 15px;">
                            <div class="form-group">
                                <label for="create-contactSummary1" class="col-sm-2 control-label">联系纪要</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="3" id="create-contactSummary1"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="create-nextContactTime2" class="col-sm-2 control-label">下次联系时间</label>
                                <div class="col-sm-10" style="width: 300px;">
                                    <input type="text" class="form-control" id="create-nextContactTime2">
                                </div>
                            </div>
                        </div>

                        <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address">北京大兴大族企业湾</textarea>
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
				<h3>客户列表</h3>
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
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司网站</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <button type="submit" class="btn btn-default">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createCustomerModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editCustomerModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				  <button type="button" id="customerLink" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span> 客户联系人</button>
				</div>
				
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" /></td>
							<td>名称</td>
							<td>星级</td>
							<td>公司座机</td>
							<td>公司网站</td>
							<td>公司地址</td>
							<td>创建者</td>
							<td>创建时间</td>
							<td>修改者</td>
							<td>修改时间</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="customer" items="${pageInfo.list}" varStatus="vs">
						<tr ${vs.count%2==0?"":"class='active'"}>
							<td><input type="checkbox" name="custId" value="${customer.custId}"/></td>
							<td><a style="text-decoration: none; cursor: pointer;"
								   onclick="window.location.href='${pageContext.request.contextPath}/customerLinkman/list?custId=${customer.custId}';">${customer.custName}</a></td>
							<td>
									<c:forEach begin="1" end="${customer.custSatrt}">
										<span class="glyphicon glyphicon-star"></span>
									</c:forEach></td>
							<td>${customer.custPhone}</td>
							<td>${customer.custNet}</td>
							<td>${customer.custAdress}</td>
							<td>${customer.creator.employeeName}(${customer.creator.employeeNo})</td>
							<td><fmt:formatDate value="${customer.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${customer.updator.employeeName}(${customer.updator.employeeNo})</td>
							<td><fmt:formatDate value="${customer.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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