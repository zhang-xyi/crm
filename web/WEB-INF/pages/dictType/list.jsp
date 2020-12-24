<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#addBtn").click(function () {
			window.location.href="${pageContext.request.contextPath}/dictType/update";
		})
		$("#editBtn").click(function () {
			var checkboxInput=$("input[name=dictTypeId]:checked");
			if (checkboxInput.length==1){
				window.location.href="${pageContext.request.contextPath}/dictType/update?dictTypeId="+checkboxInput.val();
			} else {
				showMsg("请选择一项进行操作")
			}
		})
		$("#viewCatchBtn").click(function () {
			window.location.href="${pageContext.request.contextPath}/dict/cacheData"
		})
		$("#updateCatchBtn").click(function () {
            $.post("${pageContext.request.contextPath}/dict/updateCacheData",
            function (data) {
                if (data.msg=="success"){
                    showMsg("缓存更新成功")
                }//end if
            },"json")//end callback function
		})//end updateCatchBtn
	})
</script>
</head>
<body>
<%@include file="/WEB-INF/pages/inc/alert.jsp"%>

	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>字典类型列表</h3>
			</div>
		</div>
	</div>
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" id="addBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-default" id="editBtn"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
		  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		  <button type="button" class="btn btn-primary" id="viewCatchBtn"><span class="glyphicon glyphicon-minus"></span> 查看字典缓存</button>
		  <button type="button" class="btn btn-default" id="updateCatchBtn"><span class="glyphicon glyphicon-minus"></span> 刷新字典缓存</button>
		</div>
	</div>
	<div style="position: relative; left: 30px; top: 20px;">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" /></td>
					<td>序号</td>
					<td>编码</td>
					<td>名称</td>
					<td>描述</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dictionaryType" items="${dictionaryTypeList}" varStatus="vs">
				<tr class="active" ondblclick="window.location.href='${pageContext.request.contextPath}/dict/list?dictTypeId=${dictionaryType.dictTypeId}'">
					<td><input type="checkbox" name="dictTypeId" value="${dictionaryType.dictTypeId}" /></td>
					<td>${vs.count}</td>
					<td>${dictionaryType.dictTypeCode}</td>
					<td> <a href="${pageContext.request.contextPath}/dict/list?dictTypeId=${dictionaryType.dictTypeId}">${dictionaryType.dictTypeName}</a></td>
                    <td> <a href="${pageContext.request.contextPath}/dict/list?dictTypeId=${dictionaryType.dictTypeId}">${dictionaryType.dictTypeStatus eq 1 ? "<span style='color: green'>启用</span>":"<span style='color: red'>禁用</span>"}</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>