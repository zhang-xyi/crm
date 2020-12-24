<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangyi
  Date: 2020/12/24
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缓存中的字典的值</title>
</head>
<body>
<c:forEach var="entry" items="${DICTIONARYMAP_IN_APPLICATION}">

    <c:forEach var="dictEntry" items="${entry.value}">
        id=${dictEntry.value.dictId},value=${dictEntry.value.dictValue},type=${dictEntry.value.dictionaryType.dictTypeCode},order=${dictEntry.value.dictOrder}
        <br>
    </c:forEach>
    <%--type=${dictEntry.value.dictionartType.dictTypeName},--%>
<br>
</c:forEach>

<select>
    <c:forEach var="appellation" items="${DICTIONARYMAP_IN_APPLICATION.appellation}">
        <option value="${appellation.key}">${appellation.value.dictValue}</option>

    </c:forEach>
</select>

</body>
</html>
