<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>产品管理</title>
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
  		document.forms[0].action = "product/addUI.do";
  		document.forms[0].submit();
  	}
  	//编辑
  	function doEdit(id){
  		document.forms[0].action = "product/editUI.do?productId=" + id;
  		document.forms[0].submit();
  	}
  	//删除
  	function doDelete(id){
  		document.forms[0].action = "product/delete.do?productId=" + id;
  		document.forms[0].submit();
  	}
  	//批量删除
  	function doDeleteAll(){
  		document.forms[0].action = "product/deleteSelected.do?selectedRow="+$('#selectedRow').val();
  		document.forms[0].submit();
  	}
  	
  	function doSearch(){
  		document.forms[0].action = "product/listUI.do" ;
  		document.forms[0].submit();
  	}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>产品管理</strong></div> </div>
                <div class="search_art">
                    <li>
                    	产品名：  <input type="text" name="searchName" value="${searchName }"/> 
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
                            <td width="120" align="center">产品名称</td>
                            <td align="center">价格</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                       	<c_rt:forEach items="${page.list}" var="product">
                           	<tr>
                                <td align="center"><input type="checkbox" name="selectedRow" id="selectedRow" value="${product.productId }"/></td>
                                <td align="center">${product.productName}</td>
                                <td align="center">
                                		${product.price }
                                </td>
                                <td align="center">
                                    <a href="javascript:doEdit('${product.productId }')">编辑</a>
                                    <a href="javascript:doDelete('${product.productId }')">删除</a>
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
                 	总共${page.totalCount }条记录，当前第 ${page.currentPageNum } 页，共 ${page.totalPageNum } 页 &nbsp;&nbsp;
                            <a href="product/listUI.do?currentPage=${page.prePageNum }">上一页</a>&nbsp;&nbsp;<a href="product/listUI.do?currentPage=${page.nextPageNum }">下一页</a>
					&nbsp;&nbsp;
			    </td>
			</tr>
		</table>	
        </div>
        </div>
    </div>
</form>

</body>
</html>