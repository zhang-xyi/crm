<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/dict/save" method="get">
    <div>
        <div style="position: relative; left: 30px; top: -10px;">
            <div class="page-header">
                <h3>新增字典值</h3>
                <div style="position: relative; top: -40px; left: 70%;">
                    <button type="submit" class="btn btn-primary">保存</button>
                    <button type="button" class="btn btn-default" onclick="window.history.back();">取消</button>
                </div>
            </div>
            <div class="page-header">
                <h4>字典值类型：${DictionaryType.dictTypeName}(${DictionaryType.dictTypeCode})</h4>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="create-dicTypeCode" class="col-sm-2 control-label">字典类型编码<span style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <select name="dictTypeId" class="form-control" id="create-dicTypeCode" style="width: 200%;">
                <C:forEach var="dictionaryType" items="${DictionaryTypeList}">
                    <option value="${dictionaryType.dictTypeId}" ${dictionaryType.dictTypeId eq param.dictTypeId ? "selected = 'selected'" : ""}>
                            ${dictionaryType.dictTypeName}</option>
                </C:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="create-dicValue" class="col-sm-2 control-label">字典值<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input name="dictValue" type="text" class="form-control" id="create-dicValue" style="width: 200%;">
        </div>
    </div>

    <div class="form-group">
        <label for="create-orderNo" class="col-sm-2 control-label">排序号</label>
        <div class="col-sm-10" style="width: 300px;">
            <input name="dictOrder" type="text" class="form-control" id="create-orderNo" style="width: 200%;">
        </div>
    </div>

    <div class="form-group">
        <label for="create-text" class="col-sm-2 control-label">状态</label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="radio" name="dictStatus" value="1" class="form-control"><span style="color: green">启用</span>
            <input type="radio" name="dictStatus" value="2" class="form-control"><span style="color: red">禁用</span>
        </div>
    </div>
</form>

<div style="height: 200px;"></div>
</body>
</html>