<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>header</title>
		
		<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/artDialog.source.js"></script>
		<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/jquery.artDialog.source.js?skin=idialog"></script>
		<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
		
		<script type="text/javascript" src="${ctx}/resources/frame/js/ddsmoothmenu.js"></script>
		<script type="text/javascript">
			function login(){
				art.dialog.open('${ctx}/member/loginPage',{
					id: "loginDialog",
			    	padding: 0,
					width: 500,
					height: 300,
					lock: true,
					resize: false,
					close: function(){
						window.location.reload();
					}
				});
			}
			
			
			function register() {
				art.dialog.open('${ctx}/member/registerPage', {
					id : "registerDialog",
					padding : 0,
					width : 600,
					height : 550,
					resize : false,
					close : function() {
						window.location.reload();
					},
					lock: true
				});
			}

			function logout() {
				$.ajax({
					url : "${ctx}/member/logout?time=" + new Date(),
					success : function(data) {
						if (data.success) {
							art.dialog.tips(data.msg, 2, "succeed", function() {
								window.location.reload();
							});
						} else {
							art.dialog.tips(data.msg, 2, "error");
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<!-- Footer Start -->
		<div id="footer">
			<div class="footer-rays">
				<div class="inner">
					<div class="foot-navi-coopyrights" style="margin-left: 300px; width: 600px;">
						<p style="font-size:14px;color:white;height:25px;">地址： ${contact.address}</p>
						<p style="font-size:14px;color:white;height:25px;">电话：${contact.phone}&nbsp;&nbsp;&nbsp;&nbsp;传真：${contact.fax}</p>
						<p style="font-size:14px;color:white;height:25px;">&copy; Copyright &copy; 2014 ${contact.name} All rights reserved. 版权所有</p>
					</div>
					
					<div class="followus">
						<div class="gotop">
							<a href="#top">&nbsp;</a> <span>返回顶部</span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- Footer End -->
	</body>
</html>