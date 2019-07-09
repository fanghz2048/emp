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
<%--引入jquery文件--%>
<%--<script type="application/javascript"
        src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
</script>--%>
<script src="../../js/jquery-1.8.0.min.js"></script>
<script src="../../js/jquery.form.js"></script>
<%--jquery使用--%>

<script>
    <%--使用jQuery实现页面提交--%>
    function do_page(pno) {
        $("#pageIndex").val(pno);
        $("#searchForm").submit();
    }

    <%--使用jQuery实现删除删除操作--%>
    function do_delete(pno) {
        if (confirm("确定要删除吗?")) {
            location.href="${pageContext.request.contextPath}/delete/"+pno;
        }
    }
</script>
<body>
<div style="width:980px; margin:0px auto; text-align:center">
    <div style="text-align:center">
        <h3>员工信息信息列表</h3>
    </div>
    <div style="text-align:center">
        <form id="searchForm" action="${pageContext.request.contextPath}/index" method="post">
            员工名称：

            <input type="text" name="empname" id="empname" value="${empParam.empname}"/>
            部门:

            <select name="deptno" id="deptno">
                <option value="-1">--部门名称--</option>
                <c:if test="${deptList!=null}">
                    <c:forEach items="${deptList}" var="dept">
                        <option value="${dept.deptno}"
                                <c:if test="${dept.deptno==empParam.deptno}">selected="selected"</c:if>>${dept.deptname}</option>
                    </c:forEach>
                </c:if>
            </select>&nbsp;&nbsp;
            工资：
            <input name="min_sal" type="text" id="min_sal" size="10" value="${empParam.min_sal}"/>
            到
            <input name="max_sal" type="text" id="max_sal" size="10" value="${empParam.max_sal}"/>
            <input type="hidden" name="pageIndex" id="pageIndex">
            &nbsp;&nbsp;&nbsp;<input type="submit" name="btnQuery" id="btnQuery" value="查询"/>
        </form>
    </div>

    <div style="width:950px; padding-right:30px; line-height:40px; height:40px; text-align:right"><a href="${pageContext.request.contextPath}/insert">添加员工</a>
    </div>
    <table width="980" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>全选
                <input type="checkbox" name="ckbAll" id="ckbAll"/></td>
            <td>员工编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>生日</td>
            <td>工资</td>
            <td>部门名称</td>
            <td>详细</td>
            <td>删除</td>
            <td>修改</td>
        </tr>
        <c:if test="${pageInfo.list!=null}">
            <c:forEach var="emp" items="${pageInfo.list}">
                <tr>
                    <td><input type="checkbox" name="ckb" id="ckb"/></td>
                    <td>${emp.empno}</td>
                    <td>${emp.empname}</td>
                    <td>${emp.sex}</td>
                    <td><fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>${emp.sal}</td>
                    <td>${emp.dept.deptname}</td>
                    <td><a href="${pageContext.request.contextPath}/detail/${emp.empno}">详细</a></td>
                    <td><a href="javascript:do_delete(${emp.empno})">删除</a></td>
                    <td><a href="${pageContext.request.contextPath}/update/${emp.empno}">修改</a></td>
                </tr>
            </c:forEach>
        </c:if>

        <tr>
            <td colspan="10" align="center" valign="middle">
                <a href="javascript:do_page(1)">首页</a>&nbsp;
                <a href="javascript:do_page(${pageInfo.prePage})">上一页</a>&nbsp;
                <a href="javascript:do_page(${pageInfo.pageNum+1})">下一页</a>&nbsp;
                <a href="javascript:do_page(${pageInfo.lastPage})">尾页</a>&nbsp;
                ${pageInfo.pageNum}/${pageInfo.pages}页
            </td>
        </tr>
        <tr>
            <td colspan="10" align="center" valign="middle">&nbsp;</td>
        </tr>
    </table>
</div>
</body>
</html>

