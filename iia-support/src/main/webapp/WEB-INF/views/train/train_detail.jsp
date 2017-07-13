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
    	var filebrowserUploadUrl = "${ctx}/train/uploadEditorFile?type=train/${type}";
	</script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/ckeditor.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/ckeditor_full/lang/zh-cn.js"></script>

    <script type="text/javascript">
    	var editor;
    	
        $(function(){
            var mode = "${mode}";
            if(mode == "readonly"){
                $(":input").attr("disabled","true");
            }
            editor = CKEDITOR.replace("content", { height: '550px'});
        });
    	
        function save(){
			var content = editor.getData();
			var title = $("#title").val();
			
			if(isNull(title)){
				art.dialog.tips("标题 不能为空", 2, "error");
				return false;
			}
			
			$.ajax({
				url: "${ctx}/train/save?time=" + new Date(),
				type: "post",
				data:{
					id: $("#id").val(),
					content: content,
					title: title,
					lawType: "${type}"
				},
				success: function(data){
					if(data.success){
						art.dialog.tips(data.msg, 2, "succeed", function(){
							cancel();
						});
					}else{
						art.dialog.tips(data.msg, 2, "error");
					}
				}
			});
		}

        function cancel(){
        	window.location.href = "${ctx}/train/list?type=${type}";
        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <c:choose>
                	<c:when test="${type == 1}">
                		<li><i class="fa fa-pencil-square"></i><a href="${ctx}/train/list?type=1">培训内容管理</a></li>
                		<li><i class="fa fa-pencil-square"></i>培训内容</li>
                	</c:when>
                	<c:otherwise>
                		<li><i class="fa fa-check-square-o"></i><a href="${ctx}/train/list?type=2">网络调查表管理</a></li>
                		<li><i class="fa fa-check-square-o"></i>网络调查表信息</li>
                	</c:otherwise>
                </c:choose>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <c:choose>
	                	<c:when test="${type == 1}">
	                		<h2><i class="fa fa-pencil-square red"></i><span class="break"></span><strong>培训内容</strong></h2>
	                	</c:when>
	                	<c:otherwise>
	                		<h2><i class="fa fa-check-square-o red"></i><span class="break"></span><strong>网络调查表</strong></h2>
	                	</c:otherwise>
	                </c:choose>
                    
                    <c:if test="${mode != 'readonly'}">
	                    <span style="float:right;">
							<button type="button" id="saveBtn" class="btn btn-primary btn-xs" onclick="save()">保存</button>
							<button type="button" id="cancelBtn" class="btn btn-danger btn-xs" onclick="cancel()">取消</button>
						</span>
					</c:if>
                </div>

                <div class="panel-body" style="padding-top:30px;padding-left:30px;">
                    <input type="hidden" id="id" name="id" value="${facadeBean.id}"/>
                    <div class="form-group height_30">
                        <label class="col-md-2 control-label">标题</label>
                        <div class="col-md-7">
                            <input type="text" id="title" name="title" class="form-control" value="${facadeBean.title}">
                        </div>
                    </div>

					<c:if test="${not empty facadeBean.id }"> 
                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">创建时间</label>
                            <div class="col-md-3">
                                <p class="form-control-static">
                                    <fmt:formatDate value='${facadeBean.createTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss" />
                                </p>
                            </div>
                        </div>
                    </c:if>

					<c:if test="${mode != 'readonly'}">
	                    <div style="height:700px;">
	                       <textarea class="form-control" id="content" name="content">${facadeBean.content}</textarea>
	                    </div>
                    </c:if>
                    <c:if test="${mode == 'readonly'}">
                    	<div style="margin-left:10px;margin-right:15px;">
                    		${facadeBean.content}
                    	</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
