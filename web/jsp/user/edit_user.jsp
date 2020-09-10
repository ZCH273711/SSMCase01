<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/9/10
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/addUser.action" name="ff" method="post" onsubmit="return checkValue()">
        <input type="hidden" id="userId" name="userId" value="${user.userId}"/>
        登陆账号：
        <input id="loginName" name="loginName" type="text" value="${user.loginName}"/>&nbsp;<font style="color:Red;">${checkUserLoginNameMsg}</font>
        密码：
        <input type="password" id="password" name="password"/>
        用户姓名：
        <input id="userName" name="userName" value="${user.userName}"/>
        电话号码：
        <input id="tel" name="tel" value="${user.tel}" type="text"/>
        用户角色：
        <select name="roleId" id="roleId">
            <option value="">--请选择--</option>
            <c:forEach items="${rolelist}" var="r">
                <option value="${r.roleId}" <c:if test="${r.roleId eq user.roleId}">selected="selected"</c:if>> ${r.roleName} </option>
            </c:forEach>
        </select>
        <input name="" type="submit" value="确认添加"/>
        &nbsp;&nbsp;<input name="" type="button" onclick="goback()" value="返回列表"/>
    </form>
    <script>
        function goback(){
            window.location.href="${pageContext.request.contextPath}/findUserList.action";
        }
        function checkValue(){
            str = document.getElementById("password").value;
            if(str.length>0 && str.length<6){
                alert("密码长度应大于等于6");
                document.getElementById("password").focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
