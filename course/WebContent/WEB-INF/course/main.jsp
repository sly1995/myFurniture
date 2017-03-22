<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.course.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("ctx", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<script type="text/javascript">
		function pr(_id) {
			var select_id = parseInt(_id.replace("xx", ""));
			for (i = 1; i <= 8; i++) {
				if (i == select_id) {
					document.getElementById("xx" + i).className = "x_css";
				} else {
					document.getElementById("xx" + i).className = "y_css";
				}
			}
		}
	</script>
	<script language="javascript" type="text/javascript">
		function show(num) {
			document.getElementById(num).style.display = "block";
		}
		function hidden1(num) {
			document.getElementById(num).style.display = "none";
		}
	</script>
	<script language="javascript" type="text/javascript">
		function r(num) {
			document.getElementById(num).style.display = "block";
		}
		function r_1(num) {
			document.getElementById(num).style.display = "none";
		}
	</script>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/index.css">
</head>
<body>
	<div style="width: 1430px; height: 100%;">
		<div class="mian_r" onmousemove="r(22)" onmouseout="r_1(22)">
			<div class="mian_r_bj png" style="display: none;" id="22"
				onmousemove="r(22)" onmouseout="r_1(22)">
				<div>
					<a href="#"> <img src="${ctx }/images\r_icon_03.png"></a> <a href="#">
						<img src="${ctx }/images\r_icon_06.png">
					</a> <a href="#"> <img src="${ctx }/images\r_icon_08.png"></a> <a
						href="#"> <img src="${ctx }/images\r_icon_10.png"></a>
				</div>
			</div>
		</div>
		<table height="100%" width="1425" border="0" cellpadding="0"
			cellspacing="0" style="overflow: hidden;">
			<tr>
				<td colspan="2" height="52">
					<div>
						<div id="header">
							<div class="header01">
								<p class="logo">
									<a href="index-x.html"> <img src="${ctx }/images/logo_03.gif"
										alt=""></a>
								</p>
								<p class="right_01"
									style="position: absolute; z-index: 9; width: e-xpression(this.nextSibling.offsetWidth); height: e-xpression(this.nextSibling.offsetHeight); top: e-xpression(this.nextSibling.offsetTop); left: e-xpression(this.nextSibling.offsetLeft);"
									frameborder="0">
									<img src="${ctx }/images/pic_06.gif" alt="">
								</p>
								<p class="right_02">
									您好，<span>${realName }</span>，欢迎登录！
								</p>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td width="190" valign="top"
					style="background: url(${ctx }/images/lift_bj_02.gif) repeat-y;"
					background="images/lift_bj_02.gif ">
					<% 
						Map<Menu,List<Menu>> map = (Map<Menu,List<Menu>>)request.getSession(false).getAttribute("menus");
						List<Menu> list = (List<Menu>)request.getSession(false).getAttribute("menuKey");
						for(int i = 1;i<=map.size();i++){
					%>
					<div class="left_r1" onmousemove="show(<%=i %>)" onmouseout="hidden1(<%=i %>)"
						id="<%=i %>">
						<div class="left_r" onmousemove="show(<%=i %>)" onmouseout="hidden1(<%=i %>)">
							<ul>
							<%
							for(Menu menu:map.get(list.get(i-1))){
							%>
								<li><a target="mainFrame" href="${ctx }/<%=menu.getUrl() %>" style="cursor: hand"><%=menu.getMenuName() %></a></li>
							<% } %>
							</ul>
						</div>
					</div>
					<%} %>
					
					<div class="side" style="position: absolute;">
						<ul id="nav">
						<% 
							for(int i = 1;i<=map.size();i++){
						%>
							<li class="y_css" id="xx<%=i %>" onmouseover="show(<%=i %>)"
								onmouseout="hidden1(<%=i %>)"><span></span>
									<p class="icon_0<%=i %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;<%=((Menu)list.get(i-1)).getMenuName() %></p> </li>
						<%} %>
						</ul>
					</div>
				</td>
				<td width="1215" valign="top">
					<div id="dTitle" style="float: left; margin-left: 30px;">
						<img src='${ctx }/images/shouye.jpg' alt='' style='margin-top: 5px'>
					</div>
					<div style="text-align: right; margin-right: 90px; float: right">

						<img src="${ctx }/images/middil_05.gif" alt=""><a href="${ctx }/user/logout.do"><img
								alt="" src="${ctx }/images/middil_06.gif"></a>
					</div>
					 <iframe frameborder="0" style="margin-top: 15px; height: 631px;"
						width="1200" id="mainFrame" name="mainFrame" src=""></iframe>
				</td>
				<td width="5" valign="top" style="position: relative;" height="93%">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>