<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>产品管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="product/add.do" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>产品管理</strong>&nbsp;-&nbsp;新增产品</div></div>
    <div class="tableH2">新增产品</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">产品名</td>
            <td><input type="text" name="productName"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">价格</td>
            <td><input type="text" name="price"></td>
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