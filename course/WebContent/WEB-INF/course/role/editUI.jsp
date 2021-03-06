<%@ page contentType="text/html;charset=UTF-8"  import="java.util.*,com.course.entity.Power" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <script type="text/javascript">
    
    	//check数据回显 
    	function doCheck(){
    		
			<c_rt:forEach items="${role.powers}" var="power"> 
				$("#cb${power.powerId}").attr("checked",true);
			</c_rt:forEach>
			
    	}
    	window.onload= doCheck
    </script>
    <title>角色管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="role/edit.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>角色管理</strong>&nbsp;-&nbsp;编辑角色</div></div>
    <div class="tableH2">编辑角色</div>
    <input type="hidden" name="roleId" value="${role.roleId }"  />
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
         <tr>

            <td class="tdBg" width="200px">用户名</td>
            <td><input type="text" name="name" id="name" value="${role.roleName }"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">权限：</td>
            <td>
				<c_rt:forEach items="${powerList }" var="power">
						<input type="checkbox"  name="powerIds" id="cb${power.powerId }" value="${power.powerId }"/>${power.powerName }
				</c_rt:forEach>
			</td>
        </tr>
    </table>
					<input type="hidden" name="id" value="${role.roleId }" />
					<div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
   
</form>
</body>
</html>