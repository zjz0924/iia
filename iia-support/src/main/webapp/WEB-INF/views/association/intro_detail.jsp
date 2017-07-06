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
    	var filebrowserUploadUrl = "${ctx}/introduction/uploadEditorFile?type=introduction/${type}";
	</script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/ckeditor.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/lang/zh-cn.js"></script>
	
	<script type="text/javascript">
		var editor;   //优惠说明 
	
		$(function(){
			editor = CKEDITOR.replace("content", { height: '750px'});
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
					content: content,
					type: "${type}"
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
			
			window.parent.adapter(1000);
		}
	</script>
</head>

<body>

	<div class="row">
		<div class="col-lg-12">
			<ol class="breadcrumb">
				<li><i class="fa fa-user-md"></i>协会管理</li>
				<li>
					<c:choose>
						<c:when test="${type == 'intro'}">
							<i class="fa fa-book"></i><a href="${ctx}/introduction/detail?type=intro">协会简介</a>
						</c:when>
						<c:when test="${type == 'architecture'}">
							<i class="fa fa-sitemap"></i><a href="${ctx}/introduction/detail?type=architecture">组织框架</a>
						</c:when>
						<c:when test="${type == 'rule'}">
							<i class="fa fa-list-alt"></i><a href="${ctx}/introduction/detail?type=rule">章程管理</a>
						</c:when>
						<c:otherwise>
							<i class="fa fa-edit"></i><a href="${ctx}/introduction/detail?type=event">大事记</a>
						</c:otherwise>
					</c:choose>
				</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>
						<c:choose>
							<c:when test="${type == 'intro'}">
								<i class="fa fa-book red"></i><span class="break"></span><strong>协会简介</strong>
							</c:when>
							<c:when test="${type == 'architecture'}">
								<i class="fa fa-sitemap red"></i><span class="break"></span><strong>组织框架</strong>
							</c:when>
							<c:when test="${type == 'rule'}">
								<i class="fa fa-list-alt red"></i><span class="break"></span><strong>章程管理</strong>
							</c:when>
							<c:otherwise>
								<i class="fa fa-edit red"></i><span class="break"></span><strong>大事记</strong>
							</c:otherwise>
						</c:choose>
					</h2>
					
					<span style="float:right;">
						<button type="button" id="editBtn" class="btn btn-primary btn-xs" onclick="edit()">编辑</button>
						<button type="button" id="saveBtn" class="btn btn-primary btn-xs" onclick="save()" style="display:none;">保存</button>
						<button type="button" id="cancelBtn" class="btn btn-danger btn-xs" onclick="cancel()" style="display:none;">取消</button>
					</span>
				</div>

				<div class="panel-body">
					<input type="hidden" id="type" name="type" value="${type}"/>
					
					<div id="content1" style="display:none;">
						<textarea class="form-control" id="content" name="content">${facadeBean.content}</textarea>
					</div>
				
					<div id="content2" style="margin-left:15px;margin-right:15px;">
						<c:choose>
							<c:when test="${not empty facadeBean.content}">
								${facadeBean.content}
							</c:when>
							<c:otherwise>
								<div style="text-align:center;font-size:18px;margin-top: 30px;margin-bottom: 30px;">
									暂未设置
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<!--/col-->
	</div>
	<!--/row-->
</body>
</html>