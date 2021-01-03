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

		//添加交易
		$("#addDealBtn").click(function () {
			window.location.href="${pageContext.request.contextPath}/deal/edit"
		})

		//修改交易
		$("#editDealBtn").click(function () {
			var dealId = $("[name=\"dealId\"]:checked")
			if (dealId.length==1){
				window.location.href="${pageContext.request.contextPath}/deal/edit?dealId="+dealId.val();
			} else {
				showMsg("请选择一项交易")
			}
		})

		
		
	});
	
</script>
</head>
<body>
<%@include file="/WEB-INF/pages/inc/alert.jsp"%>
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>交易列表</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">客户名称</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">阶段</div>
					  <select class="form-control">
					  	<option></option>
					  	<option>资质审查</option>
					  	<option>需求分析</option>
					  	<option>价值建议</option>
					  	<option>确定决策者</option>
					  	<option>提案/报价</option>
					  	<option>谈判/复审</option>
					  	<option>成交</option>
					  	<option>丢失的线索</option>
					  	<option>因竞争丢失关闭</option>
					  </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">类型</div>
					  <select class="form-control">
					  	<option></option>
					  	<option>已有业务</option>
					  	<option>新业务</option>
					  </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">来源</div>
				      <select class="form-control" id="create-clueSource">
						  <option></option>
						  <option>广告</option>
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
				    <div class="input-group">
				      <div class="input-group-addon">联系人名称</div>
				      <input class="form-control" type="text">
				    </div>
				  </div>
				  
				  <button type="submit" class="btn btn-default">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 10px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" id="addDealBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" id="editDealBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" /></td>
							<td>名称</td>
							<td>客户名称</td>
                            <td>联系人名称</td>
							<td>阶段</td>
							<td>类型</td>
							<td>来源</td>
							<td>创建人</td>
							<td>预计交易时间</td>
							<td>实际交易时间</td>
						</tr>
					</thead>
					<tbody >
						<c:forEach var="deal" items="${pageInfo.list}" varStatus="vs">
                        <tr ${vs.count%2==0?"class='active'":""}>
                            <td><input type="checkbox" name="dealId" value="${deal.dealId}"/></td>
                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='view.jsp';">${deal.dealName}</a></td>
                            <td>${deal.customer.custName}</td>
                            <td>${deal.cutomerLinkman.linkmanName}</td>
                            <td>${deal.dealStage.stageName}</td>
                            <td>${DICTIONARYMAP_IN_APPLICATION.transactionType[deal.dealType].dictValue}</td>
                            <td>${DICTIONARYMAP_IN_APPLICATION.source[deal.dealSource].dictValue}</td>
							<td>${deal.creator.employeeName}</td>
							<td><fmt:formatDate value="${deal.dealPlanDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${deal.dealActualDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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