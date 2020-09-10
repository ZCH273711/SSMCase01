<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/9/10
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js">
    </script>
</head>
<body>
    <div class="tools">
        <ul class="toolbar">
            <li class="click">
                <a href="${pageContext.request.contextPath}/toAddUser.action">
                    <span>
                        <img src="images/t01.png"/>
                    </span>
                    添加用户
                </a>
            </li>
        </ul>
    </div>
    <form action="${pageContext.request.contextPath}/findUserList.action" id="userListForm" name="ff" method="post">
        <ul class="seachform">
            <li>
                <label>&nbsp;&nbsp;&nbsp;&nbsp;搜索关键字:</label>
                <input name="keywords" value="${keywords}" placeholder="这里输入姓名或登陆账号" type="text" style="width:400px" class="scinput" />
            </li>
            <li>
                <label style="width:600px">角色：</label>
                <select name="userListRoleId" id="userListRoleId" class="dfinput">
                    <option value="">--请选择--</option>
                    <c:forEach items="${roleList}" var="r">
                        <option value="${r.roleId}" <c:if test="${r.roleId eq userListRoleId}">selectd="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;${r.roleName}</option>
                    </c:forEach>
                </select>
            </li>
            <li><input name="" type="submit" class="scbtn" value="查询"/></li>
        </ul>
    </form>
    <table class="tablelist">
        <thead>
            <tr>
                <th style="width:100px;text-align:center">用户姓名</th>
                <th style="width:100px;text-align:center">登陆账号</th>
                <th style="width:100px;text-align:center">联系电话</th>
                <th style="width:100px;text-align:center">注册/修改时间</th>
                <th style="width:120px;text-align:center">用户角色</th>
                <th style="width:120px;text-align:center">审核状态</th>
                <th style="width:200px;text-align:center">操作</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${!empty userList}">
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td align="center">${user.userName}</td>
                        <td align="center">${user.loginName}</td>
                        <td align="center">${user.tel}</td>
                        <td align="center">
                            <fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td align="center">${user.roleName}</td>
                        <td algin="center">
                            <c:if test="${user.status=='2'}" var="flag">
                                已启用
                            </c:if>
                            <c:if test="${not flag}">
                                未启用或被禁用
                            </c:if>
                        </td>
                        <td align="center">
                            <a href="${pageContext.request.contextPath}/toEditUser.action?userId=${user.userId}">修改</a>
                            <c:if test="${user.loginName!='admin'}">
                                <c:if test="${user.status=='2'}" var="status_flag">&nbsp;|&nbsp;
                                    <a href="#" onclick="disableUser(${user.userId})">禁用</a>
                                </c:if>
                                <c:if test="${not status_flag}">
                                    &nbsp;|&nbsp;
                                    <a href="#" onclick="enableUser(${user.userId})">启用</a>
                                </c:if>
                                &nbsp;|&nbsp;
                                <a href="#" onclick="del(${user.userId})">删除</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty userList}">
                <div>
                    <tr>
                        <td colspan="7" align="center">
                            暂无用户
                        </td>
                    </tr>
                </div>
            </c:if>
        </tbody>
    </table>
    <script type="text/javascript">
        function disableUser(userId){
            $.ajax({
                url:"${pageContext.request.contextPath}/disableUser.action",
                type:"post",
                data:JSON.stringify({userId:userId, status:3}),
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function(data){
                    if(data!=null){
                        if(data.userId>0){
                            alert("禁用成功!");
                            window.location.reload();
                        }
                        else{
                            alert("禁用失败！");
                            window.location.reload();
                        }
                    }
                }
            });
        }

        function enableUser(userId){
            $.ajax({
                url:"${pageContext.request.contextPath}/enableUser.action",
                type:"post",
                data:JSON.stringify({userId:userId, status:2}),
                contentType: "application/json;charset=UTF-8",
                dataType:"json",
                success: function(data){
                    if(data!=null){
                        if(data.userId>0){
                            alert("启用成功！");
                            window.location.reload();
                        }
                        else{
                            alert("启用失败！");
                            window.location.reload();
                        }
                    }
                }
            });
        }

        function del(userId){
            if(window.confirm("您确定要删除吗？")){
                $.ajax({
                   url:"${pageContext.request.contextPath}/delUser.action",
                   type:"post",
                   data:JSON.stringify({userId:userId}),
                   contentType: "application/json;charset:UTF-8",
                   dataType: "json",
                   success: function(data){
                       if(data!=null){
                           if(data.userId>0){
                               alert("删除成功！");
                               window.location.reload();
                           }
                           else{
                               alert("删除失败！");
                               window.location.reload();
                           }
                       }
                   }
                });
            }
        }
    </script>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
</body>
</html>
