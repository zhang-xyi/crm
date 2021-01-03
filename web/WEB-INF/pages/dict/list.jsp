<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script>
	$(function () {
		$("#addBtn").click(function () {
			window.location.href="${pageContext.request.contextPath}/dict/add?dictTypeId="+${param.dictTypeId}
		})
		$("#editBtn").click(function () {
			var checkboxInput=$("[name=\"dictId\"]:checked");
			if (checkboxInput.length==1){
				window.location.href="${pageContext.request.contextPath}/dict/update?id="+checkboxInput.val() + "&dictTypeId=${param.dictTypeId}";;
			} else {
				showMsg("请选择一项进行操作")
			}
		})
		$("#back").click(function () {
			window.location.href="${pageContext.request.contextPath}/dictType/list"
		})

	})
</script>
</head>
<body>
<%@include file="/WEB-INF/pages/inc/alert.jsp"%>
	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>字典值列表</h3>
			</div>
			<div class="page-header">
				<h4>字典值类型：${DictionaryType.dictTypeName}(${DictionaryType.dictTypeCode})</h4>
			</div>
		</div>
	</div>
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" id="addBtn" ><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-default" id="editBtn" ><span class="glyphicon glyphicon-edit"></span> 编辑</button>
		  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		  <button type="button" class="btn btn-default" id="back"><span class="glyphicon glyphicon-arrow-left"></span> 返回</button>
		</div>
	</div>
	<div style="position: relative; left: 30px; top: 20px;">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" /></td>
					<td>序号</td>
					<td>字典值</td>
					<td>排序号</td>
					<td>状态</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dictionary" items="${dictionaryList}" varStatus="vs">
				<tr class="active">
					<td><input type="checkbox" name="dictId" value="${dictionary.dictId}"/></td>
					<td>${vs.count}</td>
					<td>${dictionary.dictValue}</td>
					<td>${dictionary.dictOrder}</td>
					<td>${dictionary.dictStatus == 1 ? "<span style='color: green'>启用</span>" : "<span style='color: red'>禁用</span>" }</td>
				</tr>
			</c:forEach>
           <%-- <c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION}" varStatus="vs">

            <c:forEach var="dictEntry" items="${entry.value}">
                <c:if test="${dictEntry.value.dictId==param.dictId}">
                <tr class="active">
                    <td><input type="checkbox" name="dictId" value="${dictEntry.value.dictId}"/></td>
                    <td>${vs.count}</td>
                    <td>${dictEntry.value.dictValue}</td>
                    <td>${dictEntry.value.dictOrder}</td>
                    <td>${dictEntry.value.dictStatus == 1 ? "<span style='color: green'>启用</span>" : "<span style='color: red'>禁用</span>" }</td>
                </tr>
                </c:if>
            </c:forEach>
            </c:forEach>--%>
			</tbody>
		</table>
	</div>
	
</body>
</html>