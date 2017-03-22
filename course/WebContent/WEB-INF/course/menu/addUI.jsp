<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>菜单管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="menu/add.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>菜单管理</strong>&nbsp;-&nbsp;新增菜单</div></div>
    <div class="tableH2">新增菜单 </div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">菜单名</td>
            <td><input type="text" name="menuName"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">URL</td>
            <td><input type="text" name="url"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">添加到父菜单(可选)：</td>
            <td>
				<c_rt:forEach items="${parentList }" var="menu">
					<input type="radio"  name="parentMenuId" value="${menu.menuId }" />${menu.menuName }
				</c_rt:forEach>
			</td>
        </tr>
    </table>
    
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>