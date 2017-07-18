<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${ctx}/resources/frame/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/tools.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/artDialog.source.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/jquery.artDialog.source.js?skin=idialog"></script>
	<script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.7/plugins/iframeTools.source.js"></script>

		<script type="text/javascript">
			function accect(){
				$("#procotol").hide();
				$("#regForm").show();
			}
			
			function cancel(){
				art.dialog.close();
			}
		
			function register(){
				var userName = $("#userName").val();
				var password = $("#password").val();
				var confirmPwd = $("#confirmPwd").val();
				var name = $("#name").val();
				var email = $("#email").val();
				
				if(isNull(userName)){
					art.dialog.tips("登录名不能为空", 2, "error");
					$("#userName").focus();
					return false;
				}
				
				if(userName.length < 3 || userName.length > 15){
					art.dialog.tips("登录名长度为3-15个字符", 2, "error");
					$("#userName").focus();
					return false;
				}
				
				if(isNull(password)){
					art.dialog.tips("密码不能为空", 2, "error");
					$("#password").focus();
					return false;
				}
				
				if(isNull(confirmPwd)){
					art.dialog.tips("确认密码不能为空", 2, "error");
					$("#confirmPwd").focus();
					return false;
				}
				
				if(password != confirmPwd){
					art.dialog.tips("密码与确认密码不一致", 2, "error");
					$("#password").focus();
					return false;
				}
				
				if(password.length < 6 || password.length > 30){
					art.dialog.tips("密码长度为6-30个字符", 2, "error");
					$("#password").focus();
					return false;
				}
				
				if(isNull(name)){
					art.dialog.tips("单位全称不能为空", 2, "error");
					$("#name").focus();
					return false;
				}
				
				if(isNull(email)){
					art.dialog.tips("邮箱不能为空", 2, "error");
					$("#email").focus();
					return false;
				}
				
				if (!checkEmail(email)) {
					art.dialog.tips("邮箱格式不正确", 2, "error");
					$("#email").focus();
					$("#email").val("");
					return false;
				}

				$.ajax({
					url : "${ctx}/member/register?time=" + new Date(),
					data : {
						userName : userName,
						password : password,
						name : name,
						email : email
					},
					success : function(data) {
						if (data.success) {
							art.dialog.tips(data.msg, 2, "succeed", function() {
								art.dialog.close();
							});
						} else {
							art.dialog.tips(data.msg, 2, "error");
						}
					}
				});
			}
		</script>
</head>

<body style="overflow-y: hidden">
	<div style="overflow-y: hidden" id="procotol">
		<h3 class="widget-head-border colr">会员注册协议</h3>
		<div style="width: 590px; height: 450px; overflow-y: auto; margin-left: 10px;">
			<p align="center">
				<strong><span style="font-size: 14px;">欢迎您注册成为深圳市宝安区互联网行业协会会员！</span></strong>
			</p>
			<p style="margin-top:20px;">请仔细阅读下面的协议，只有接受协议才能继续进行注册。</p>
			<p style="margin-top:20px;">
				<strong>1．服务条款的确认和接纳</strong>
			</p>
			<p>
				深圳市宝安区互联网行业协会会员服务的所有权和运作权归深圳市宝安区互联网行业协会拥有。深圳市宝安区互联网行业协会所提供的服务将按照有关章程、服务条款和操作规则严格执行。会员通过注册程序点击“我同意”
				按钮，即表示用户与深圳市宝安区互联网行业协会达成协议并接受所有的服务条款。</p>
			<p style="margin-top:20px;">
				<strong>2．用户同意：</strong>
			</p>
			<p>
				1)遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。&nbsp;
			</p>
			<p>2)避免非法的言论，尤其是有关非法报复的言论。&nbsp;</p>
			<p>
				3)不发表有歧视倾向的言论，不发表对他人有人身攻击或污辱、诽谤、有对种族、性别、信仰等歧视和污辱内容的文字，因此引起的一切法律责任，由言论的发表人承担。深圳市宝安区互联网行业协会有对上述内容的议论进行删除、屏蔽、阻止直至取消该会员资格等的措施。
			</p>
			<p>4)不发表自杀留言或自杀告别信，如果有自杀意念，可拨打当地的心理危机干预中心电话求助，或从其他途径获得帮助。</p>
			<p>5)如在发言中有引用的内容，自觉注明链接、出处、原作者。</p>
			<p style="margin-top:20px;">
				<strong>3．服务条款的修改</strong>
			</p>
			<p>
				深圳市宝安区互联网行业协会会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容深圳市宝安区互联网行业协会保留随时修改或中断服务而不需知照用户的权利。深圳市宝安区互联网行业协会行使修改或中断服务的权利，不需对会员或第三方负责。
			</p>
			<p style="margin-top:20px;">
				<strong>4．会员隐私制度</strong>
			</p>
			<p>
				1）尊重用户个人隐私是深圳市宝安区互联网行业协会的基本政策。深圳市宝安区互联网行业协会不会公开、编辑或透露会员的注册信息，除非有法律许可要求。
			</p>
			<p>
				2）避免在网站发表议论过程中公开您自身或他人的全名、地址和电话号码等个人信息，如会员在网站公开的上述个人信息，则深圳市宝安区互联网行业协会不对上述信息承担保密义务，公开信息的会员应承担因此产生的一切法律责任。
			</p>
			<p style="margin-top:20px;">
				<strong>5．用户的帐号，密码和安全性</strong>
			</p>
			<p>
				一旦注册成功成为深圳市宝安区互联网行业协会，您将得到一个会员编号。如果您未能保管好自己的编号安全，将对因此产生的后果负全部责任。另外，每个会员都要对其帐户中的所有活动和事件负全责。会员同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知深圳市宝安区互联网行业协会。
			</p>
			<p style="margin-top:20px;">
				<strong>6．免责条款</strong>
			</p>
			<p>会员明确同意网站服务的使用由会员个人承担风险。</p>
			<p>
				深圳市宝安区互联网行业协会网站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会被中断，对服务的及时性，安全性，差错的发生都不作担保。会员理解并接受：任何通过深圳市宝安区互联网行业协会服务取得的信息资料的可靠性取决于会员自己，会员自己承担所有风险和责任。
			</p>
			<p style="margin-top:20px;">
				<strong>7．有限责任</strong>
			</p>
			<p>深圳市宝安区互联网行业协会网站对任何直接、间接、偶然、特殊及继起的损害不负责任。</p>
			<p style="margin-top:20px;">8．不提供零售和商业性服务</p>
			<p>会员使用网站服务的权利是一个企业的，会员承诺不经深圳互联网技术应用协会同意，不能利用网站服务进行销售或其他商业用途。</p>
			<p style="margin-top:20px;">
				<strong>9．会员责任</strong>
			</p>
			<p>会员单独承担传输内容的责任。用户必须遵循：</p>
			<p>1)从中国境内向外传输技术性资料时必须符合中国有关法规。</p>
			<p>2)使用网站服务不作非法用途。</p>
			<p>3)不干扰或混乱网络服务。</p>
			<p>4)不发表任何与政治相关的信息。</p>
			<p>5)遵守所有使用网站服务的网络协议、规定、程序和惯例。</p>
			<p>6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。</p>
			<p>7)不得利用本站制作、复制和传播下列信息：</p>
			<p>A. 煽动抗拒、破坏宪法和法律、行政法规实施的；</p>
			<p>B. 煽动颠覆国家政权，推翻社会主义制度的；</p>
			<p>C. 煽动分裂国家、破坏国家统一的；</p>
			<p>D. 煽动民族仇恨、民族歧视，破坏民族团结的；</p>
			<p>E. 捏造或者歪曲事实，散布谣言，扰乱社会秩序的；</p>
			<p>F. 宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；</p>
			<p>G. 公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；</p>
			<p>H. 损害国家机关信誉的；</p>
			<p>I. 其他违反宪法和法律行政法规的；</p>
			<p>J. 进行商业广告行为的。</p>
			<p>
				8)用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法
				律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，深圳市宝安区互联网行业协会将取消会员服务资格。</p>
			<p style="margin-top:20px;">
				<strong>10．版权声明</strong>
			</p>
			<p>1
				）深圳市宝安区互联网行业协会及其注册用户及本网页内的资料提供者拥有此网页内所有资料的版权。深圳市宝安区互联网行业协会为非营利网站，资料均向各界开放，若转载，敬请注明来源本站。深圳市宝安区互联网行业协会不保证为向用户提供便利而设置的外部链接的准确性和完整性。
			</p>
			<p>
				2）本网站转载的图文内容，目的在于传递更多信息，并不代表本网赞同其观点和对其真实性负责。本网站的所有图文资料都将尽可能地注明原作者；对于无法确定原作者的资料，均将注明作者为
				"佚名"，欢迎作者本人与我们联系、欢迎读者提供线索，以便我们注明。如涉及版权，敬请与本站联系，以便及时处理。</p>
			<p>
				3）深圳市宝安区互联网行业协会有权在本网站范围内引用、发布、转载会员在深圳市宝安区互联网行业协会内发布的内容。深圳市宝安区互联网行业协会对于会员发布的内容所引发的版权、署名权的异议、纠纷不承担任何责任。会员发言纯属个人行为，与本网站立场无关。
			</p>
			<p style="margin-top:20px;">
				<strong>11．附加信息服务</strong>
			</p>
			<p>
				用户在享用深圳市宝安区互联网行业协会提供的免费服务的同时，同意接受深圳市宝安区互联网行业协会提供的各类附加信息服务。&nbsp;</p>
			<p style="margin-top:20px;">
				<strong>12．解释权</strong>
			</p>
			<p style="margin-top:20px;">本注册协议的解释权归深圳市宝安区互联网行业协会所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。
			</p>
			<p>
				<br>
			</p>
			<p align="right">深圳市宝安区互联网行业协会</p>
			<p align="right">二0一四年八月五日</p>
		</div>
		<div align="center" style="margin-top:5px;">
			<button type="button" onclick="accect()">我已阅读并接受协议</button>
			<button type="button" onclick="cancel()">取消</button>
		</div>
	</div>


	<div class="contact-form" style="display: none;" id="regForm">
		<h3 class="widget-head-border colr">填写注册信息</h3>
		<div class="cont-form-in" style="overflow-y: auto">
			<ul class="form-short">
				<li class="txt">
					<h5>登录名(3-15)</h5>
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
					<h5>密码(6-30)</h5>
					<p>必填</p>
				</li>
				<li class="inputbar"><input type="password" id="password" name="password">
					<div class="inputicon">
						<img src="${ctx}/resources/frame/images/address.png" alt="" />
					</div></li>
			</ul>
			
			<ul class="form-short">
				<li class="txt">
					<h5>确认密码</h5>
					<p>必填</p>
				</li>
				<li class="inputbar"><input type="password" id="confirmPwd" name="confirmPwd">
					<div class="inputicon">
						<img src="${ctx}/resources/frame/images/address.png" alt="" />
					</div>
				</li>
			</ul>
			
			<ul class="form-short">
				<li class="txt">
					<h5>单位全称</h5>
					<p>必填</p>
				</li>
				<li class="inputbar">
					<input type="text" id="name" name="name">
				</li>
			</ul>
			
			<ul class="form-short">
				<li class="txt">
					<h5>常用邮箱</h5>
					<p>必填</p>
				</li>
				<li class="inputbar">
					<input type="text" id="email" name="email">
				</li>
			</ul>

			<ul class="form-short">
				<li>
					<button type="button" onclick="register()">注册</button>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>