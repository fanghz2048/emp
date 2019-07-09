<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/13 0013
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width:600px; margin:0px auto;">
    <div style="text-align:center">
        <h3>修改员工信息</h3>
    </div>
    <div style="text-align:left">
        <form id="updateForm" action="${pageContext.request.contextPath}/update.do" method="post">
            <table width="600" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <td>员工姓名</td>
                    <td>${emp.empname}</td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>${emp.sex}</td>
                </tr>
                <tr>
                    <td>出生日期</td>
                    <td><fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                </tr>
                <tr>
                    <td>薪水</td>
                    <td>
                        ${emp.sal}"
                    </td>
                </tr>
                <tr>
                    <td>部门</td>
                    <td>${emp.dept.deptname}</td>
                </tr>
                <tr>
                    <td>头像</td>
                    <td>
                        <img width="30%" height="30%" src="${pageContext.request.contextPath}/images/${emp.picpath}">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" valign="middle">
                        &nbsp;<input type="button" name="btnReturn" id="btnReturn" value="返回" onclick="history.go(-1)"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>


