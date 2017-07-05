<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@include file="../common/header.jsp"%>
	
	<script type="text/javascript">
    	var filebrowserUploadUrl = "${ctx}/introduction/uploadEditorFile?type=introduction";
	</script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/ckeditor.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/lang/zh-cn.js"></script>
	
	<script type="text/javascript">
		var editor;   //优惠说明 
	
		$(function(){
			editor = CKEDITOR.replace("content", { height: '400px'});
			
		});
		
		function cancel(){
			window.location.reload();
		}
		
		function save(){
			var content = editor.getData();
			
			$.ajax({
				url: "${ctx}/introduction/update?time=" + new Date(),
				type: "post",
				data:{
					content: content
				},
				success: function(data){
					if(data.success){
						art.dialog.tips(data.msg, 2, "succeed", function(){
							window.location.reload();
						});
					}else{
						art.dialog.tips(data.msg, 2, "error", function(){
							window.location.reload();
						});
					}
				}
			});
		}
		
		function edit(){
			$("#content1").show();
			$("#content2").hide();
			$("#saveBtn").show();
			$("#cancelBtn").show();
			$("#editBtn").hide();
		}
	</script>
</head>

<body>

	<div class="row">
		<div class="col-lg-12">
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i>协会管理</li>
				<li><i class="fa fa-user"></i><a href="${ctx}/accountController/list">协会简介</a></li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2><i class="fa fa-user red"></i><span class="break"></span><strong>协会简介</strong></h2>
					
					<span style="float:right;padding-top:5px;">
						<button type="button" id="editBtn" class="btn btn-primary btn-xs" onclick="edit()">编辑</button>
						<button type="button" id="saveBtn" class="btn btn-primary btn-xs" onclick="save()" style="display:none;">保存</button>
						<button type="button" id="cancelBtn" class="btn btn-danger btn-xs" onclick="cancel()" style="display:none;">取消</button>
					</span>
				</div>

				<div class="panel-body">
					<div id="content1" style="display:none;">
						<textarea class="form-control" id="content" name="content">${facadeBean.content}</textarea>
					</div>
				
					<div id="content2">
						${facadeBean.content}
					</div>
				</div>
			</div>
		</div>
		<!--/col-->
	</div>
	<!--/row-->
</body>
</html>