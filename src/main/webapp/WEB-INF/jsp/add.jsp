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
        <h3>添加员工信息</h3>
    </div>
    <div style="text-align:left">
        <form id="insertForm" action="${pageContext.request.contextPath}/insert" method="post" enctype="multipart/form-data">
            <table width="600" border="1" cellspacing="0" cellpadding="0">

                <tr>
                    <td>员工姓名</td>
                    <td>
                        <input type="text" name="empname" id="empname" /></td>
                </tr>

                <tr>
                    <td>薪水</td>
                    <td>
                        <input type="text" name="sal" id="sal" /></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input type="radio" name="sex" value="男" />
                        男
                        <input type="radio" name="sex" value="女" />
                        女
                    </td>
                </tr>
                <tr>
                    <td>出生日期</td>
                    <td><input type="date" name="birthday" id="birthday" /></td>
                </tr>
                <tr>
                    <td>图像</td>
                    <td>
                        <input type="file" name="picfile" id="picfile" />
                        <input type="hidden" id="picpath" name="picpath">
                        <img width="30%" height="30%">
                    </td>
                </tr>
                <tr>
                    <td>部门</td>
                    <td>
                        <select name="deptno" id="deptno">
                            <option value="-1">--部门名称--</option>
                            <c:if test="${deptList!=null}">
                                <c:forEach items="${deptList}" var="dept">
                                    <option value="${dept.deptno}"
                                            <c:if test="${dept.deptno==empParam.deptno}">selected="selected"</c:if>>${dept.deptname}</option>
                                </c:forEach>
                            </c:if>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" valign="middle">
                        <input type="submit" name="btnAdd" id="btnAdd" value="添加员工" />&nbsp;
                        <input type="button" name="btnReturn" id="btnReturn" value="返回" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script src="../../js/jquery-1.8.0.min.js"></script>
<script src="../../js/jquery.form.js"></script>
<script>
    //此处要使用ajax做提交,才能实现文件异步上传
    $(function () {
        $("#picfile").change(function () {
            $("#insertForm").ajaxSubmit({
               url:'${pageContext.request.contextPath}/upload',
                type:'post',
                success:function (data) {
                   //data是提交成功后返回的文件名
                    //将返回的值给隐藏域,用于添加到表
                    $("#picpath").val(data);
                    //图片的回显
                    $("img").attr("src", "/images/" + data);
                }
            });
        });
    })
</script>
</html>

