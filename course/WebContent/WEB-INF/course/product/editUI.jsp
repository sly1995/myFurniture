<%@ page contentType="text/html;charset=UTF-8"  import="java.util.*,com.course.entity.Power" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <script type="text/javascript">
    
    </script>
    <title>产品管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="product/edit.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>产品管理</strong>&nbsp;-&nbsp;编辑产品</div></div>
    <div class="tableH2">编辑产品</div>
    <input type="hidden" name="productId" value="${product.productId }"  />
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
         <tr>

            <td class="tdBg" width="200px">产品名</td>
            <td><input type="text" name="name" id="name" value="${product.productName }"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">价格</td>
            <td><input type="text" name="price" id="name" value="${product.price }"></td>
        </tr>
    </table>
					<input type="hidden" name="id" value="${product.productId }" />
					<div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
   
</form>
</body>
</html>