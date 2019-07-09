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
<%--上面是下面的依赖,必须放前面--%>
<script src="../../js/jquery-1.8.0.min.js"></script>
<script src="../../js/jquery.form.js"></script>
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
                    <td>
                        <input type="text" name="empname" id="empname" value="${emp.empname}"/>
                    </td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input type="radio" name="sex" value="男" <c:if test="${emp.sex=='男'}">checked="checked"</c:if>/>
                        男
                        <input type="radio" name="sex" value="女"
                               <c:if test="${emp.sex=='女'}">checked="checked"</c:if> />
                        女
                    </td>
                </tr>
                <tr>
                    <td>出生日期</td>
                    <td><input type="date" name="birthday" id="birthday"
                               value="<fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>"/>
                    </td>
                </tr>
                <tr>
                    <td>薪水</td>
                    <td>
                        <input type="text" name="sal" id="sal" value="${emp.sal}"/>
                    </td>
                </tr>
                <tr>
                    <td>部门</td>
                    <td>
                        <select name="deptno" id="deptno">
                            <c:if test="${deptList!=null}">
                                <c:forEach items="${deptList}" var="dept">
                                    <option value="${dept.deptno}"
                                            <c:if test="${emp.deptno==dept.deptno}">selected="selected"</c:if>>${dept.deptname}</option>
                                </c:forEach>
                            </c:if>

                        </select></td>
                </tr>

                <tr>
                    <td>头像</td>
                    <td>
                        <input type="file" name="picfile" id="picfile">
                        <input type="hidden" id="picpath" name="picpath">
                        <img width="30%" height="30%" src="${pageContext.request.contextPath}/images/${emp.picpath}">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" valign="middle"><input type="submit" name="btnUpdate" id="btnUpdate"
                                                                          value="修改"/>
                        &nbsp;<input type="button" name="btnReturn" id="btnReturn" value="返回" onclick='history.go(-1)'></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>

<%--<script>
    $(function () {
        $("#picfile").change(function () {
            /*此处ajax提交,提交的是josn类型数据,故要加{}符号*/
            $("#updateForm").ajaxSubmit({
                url:'${pageContext.request.contextPath}/upload',
                type:'post',
                success:function (data) {
                    //data存到picpath中
                    $("#picpath").val(data);
                    //设置img的src属性为/images/data
                    $("img").attr("src","/images/"+data);
                }
            });
        });
    })
</script>--%>
<script>
    //页面加载时执行jQuery
    $(function () {
        //picfile注册change事件(完成改变时(即选择完文件时)即执行)
        $("#picfile").change(function () {
            //ajax方式提交表单
            $("#updateForm").ajaxSubmit({
                url:'${pageContext.request.contextPath}/upload',
                type:'post',
                success:function (data) {//data是后台返回的josn数据(此处返回的是文件名)
                    $("#picpath").val(data);//文件名回显
                    $("img").attr("src","/images/"+data)//图片回显 attr方法设置元素的属性
                }
            });
        });
    })
</script>
</html>


