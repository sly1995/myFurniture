<%@ page contentType="text/html;charset=UTF-8"  import="java.util.*,com.course.entity.Power" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <script type="text/javascript">
    
    	//check数据回显 
    	function doCheck(){
    		
				$("#pm${menu.parentMenu.menuId}").attr("checked",true);
			
    	}
    	window.onload= doCheck
    </script>
    <title>菜单管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="menu/edit.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>菜单管理</strong>&nbsp;-&nbsp;编辑菜单</div></div>
    <div class="tableH2">编辑菜单</div>
    <input type="hidden" name="menuId" value="${menu.menuId }"  />
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
         <tr>

            <td class="tdBg" width="200px">菜单名</td>
            <td><input type="text" name="name" id="name" value="${menu.menuName }"></td>
        </tr>
         <tr>

            <td class="tdBg" width="200px">URL</td>
            <td><input type="text" name="url" id="name" value="${menu.url }"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">添加到父菜单(可选)：</td>
            <td>
				<c_rt:forEach items="${parentList }" var="menu">
					<input type="radio"  name="parentMenuId" id="pm${menu.menuId }" value="${menu.menuId }" />${menu.menuName }
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