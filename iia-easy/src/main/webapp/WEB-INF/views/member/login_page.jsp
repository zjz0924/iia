<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${ctx}/resources/frame/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/tools.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/artDialog4.1.7/artDialog.source.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/artDialog4.1.7/jquery.artDialog.source.js?skin=idialog"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/artDialog4.1.7/plugins/iframeTools.source.js"></script>

<script type="text/javascript">
			function login(){
				var userName = $("#userName").val();
				var password = $("#password").val();
				
				if(isNull(userName)){
					art.dialog.tips("用户名不能为空", 2, "error");
					$("#userName").focus();
					return false;
				}
				
				if(isNull(password)){
					art.dialog.tips("密码不能为空", 2, "error");
					$("#password").focus();
					return false;
				}
				
				$.ajax({
					url: "${ctx}/member/login?time=" + new Date(),
					data:{
						userName: userName,
						password: password
					},
					success: function(data){
						if(data.success){
							art.dialog.tips(data.msg, 2, "succeed", function(){
								art.dialog.close();
							});
						}else{
							art.dialog.tips(data.msg, 2, "error");
						}
					}
				});
			}		
		</script>
</head>

<body>
	<div class="contact-form">
		<h3 class="widget-head-border colr">登录</h3>
		<div class="cont-form-in">

			<ul class="form-short">
				<li class="txt">
					<h5>用户名</h5>
					<p>必填</p>
				</li>
				<li class="inputbar"><input type="text" id="userName" name="userName">
					<div class="inputicon">
						<img src="${ctx}/resources/frame/images/name-icon.png" alt="" />
					</div>
				</li>
			</ul>

			<ul class="form-short">
				<li class="txt">
					<h5>密码</h5>
					<p>必填</p>
				</li>
				<li class="inputbar"><input type="password" id="password"
					name="password">
					<div class="inputicon">
						<img src="${ctx}/resources/frame/images/address.png" alt="" />
					</div></li>
			</ul>

			<ul class="form-short">
				<li>
					<button type="button" onclick="login()">登录</button>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>