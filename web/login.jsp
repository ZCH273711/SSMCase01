<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/9/5
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
    <div class="login">
        <div class="header">
            <div class="switch">
                <a href="#" class="switch_login" id="switch_login">后台登陆</a>
                <div class="switch_bottom" id="switch_bottom" style="position:absolute;width:70px;left:0px;"></div>
            </div>
        </div>
    </div>

    <div class="qlogin" id="qlogin">
        <div class="web_login" align="center">
            <form action="${pageContext.request.contextPath}/login.action" method="post" onsubmit="return checkValue()">
                <font style="color:#ff0000;font-size:16px;">${msg}</font>
                <div style="height:10px;"></div>
                <div class="uname" class="input-group">
                    <span class="form-control" placeholder="请输入登陆账号"/>
                </div>
                <div class="upwd" class="input-group">
                    <span class="input-group-addon">
                        <img src="${pageContext.request.contextPath}/imgaes/password.png"/>
                    </span>
                    <input type="password" name="password" id="password" class="from-control" placeholder="密码"/>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
