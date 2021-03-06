<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>用户管理</title>
    <script type="text/javascript" src="${basePath }js/datepicker/WdatePicker.js"></script>
    <script type="text/javascript">
    	//提交表单
    	function doSubmit(){
	   		document.forms[0].submit();
    	}
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="user/add.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div></div>
    <div class="tableH2">新增用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">用户名</td>
            <td><input type="text" name="realName" id="realName"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">账号：</td>
            <td><input type="text" name="loginName" id="loginName"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><input type="text" name="password" id="password"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td>
            <c_rt:forEach items="${roleList }" var="role">
					<input type="radio"  name="roleId" value="${role.roleId }" />${role.roleName }
			</c_rt:forEach>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><input type="text" name="email" id="email"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td><input type="text" name="birthday" id="birthday" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" "></td>
        </tr>
    </table>
    <div class="tc mt20">
        <input type="button" class="btnB2" value="保存" onclick="doSubmit()" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>