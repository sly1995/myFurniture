<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>菜单管理</title>
    <script type="text/javascript">
    
    
  	//全选、全反选
	function doSelectAll(){
		// jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
	}
  	//新增
  	function doAdd(){
  		document.forms[0].action = "menu/addUI.do";
  		document.forms[0].submit();
  	}
  	//编辑
  	function doEdit(id){
  		document.forms[0].action = "menu/editUI.do?menuId=" + id;
  		document.forms[0].submit();
  	}
  	//删除
  	function doDelete(id){
  		document.forms[0].action = "menu/delete.do?menuId=" + id;
  		document.forms[0].submit();
  	}
  	//批量删除
  	function doDeleteAll(){
  		document.forms[0].action = "menu/deleteSelected.do";
  		document.forms[0].submit();
  	}

    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>菜单管理 </strong></div> </div>
                <div class="search_art">
                    <li>
                    	角色名：  <input type="text" id="searchRole" /> 
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="120" align="center">菜单名称</td>
                            <td width="120" align="center">URL</td>
                            <td align="center">类型</td>
                            <td align="center">子菜单</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                       	<c_rt:forEach items="${menuList}" var="menu">
                           	<tr>
                                <td align="center"><input type="checkbox" name="selectedRow" value="${menu.menuId }"/></td>
                                <td align="center">${menu.menuName}</td>
                                <td align="center">${menu.url}</td>
                                <td align="center">
									<c_rt:if test="${not empty menu.parentMenu }">子菜单</c_rt:if>
									<c_rt:if test="${empty menu.parentMenu }">父菜单</c_rt:if>
								</td>
                                <td align="center">
                                	<c_rt:forEach items="${menu.menus }" var="menus">
                                		${menus.menuName }
                                	</c_rt:forEach>
                                </td>
                                <td align="center">
                                    <a href="javascript:doEdit('${menu.menuId }')">编辑</a>
                                    <a href="javascript:doDelete('${menu.menuId }')">删除</a>
                                </td>
                            </tr>
                         </c_rt:forEach>
                    </table>
                </div>
            </div>
			<div class="c_pate" style="margin-top: 5px;">
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">
                 	总共1条记录，当前第 1 页，共 1 页 &nbsp;&nbsp;
                            <a href="#">上一页</a>&nbsp;&nbsp;<a href="#">下一页</a>
					到&nbsp;<input type="text" style="width: 30px;" onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="" value="1" /> &nbsp;&nbsp;
			    </td>
			</tr>
		</table>	
        </div>
        </div>
    </div>
</form>

</body>
</html>