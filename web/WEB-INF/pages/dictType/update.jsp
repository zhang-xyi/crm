<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<form:form class="form-horizontal" modelAttribute="dictionaryType" role="form" action="${pageContext.request.contextPath}/dictType/saveUpdate">
    <div style="position:  relative; left: 30px;">
        <h3>${dictionaryType.msg}</h3>
        <div style="position: relative; top: -40px; left: 70%;">
            <input type="submit" value="保存" class="btn btn-primary"/>
            <input type="button" value="取消" class="btn btn-default" onclick="window.history.back();">
        </div>
        <hr style="position: relative; top: -40px;">
    </div>
    <div class="form-group">
        <label for="create-code" class="col-sm-2 control-label">编码<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <%--必须藏id，否则无法区分编辑和添加--%>
            <form:hidden path="dictTypeId"/>
            <form:input path="dictTypeCode" class="form-control" id="code" style="width: 200%;" placeholder="编码作为主键，不能是中文"/>
        </div>
    </div>

    <div class="form-group">
        <label for="create-name" class="col-sm-2 control-label">名称</label>
        <div class="col-sm-10" style="width: 300px;">
            <form:input path="dictTypeName" class="form-control"  style="width: 200%;"/>
        </div>
    </div>

    <div class="form-group">
        <label for="create-describe" class="col-sm-2 control-label">描述</label>
        <div class="col-sm-10" style="width: 300px;">
            <form:radiobutton path="dictTypeStatus" value="1" checked="checked" class="form-control" /><span style="color: green">启用</span>
            <form:radiobutton path="dictTypeStatus" value="2" class="form-control" /><span style="color: red">禁用</span>
        </div>
    </div>
</form:form>

<div style="height: 200px;"></div>
</body>
</html>