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
    	var filebrowserUploadUrl = "${ctx}/news/uploadEditorFile?type=news";
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
			var type = $("#type").val();
			
			if(isNull(title)){
				art.dialog.tips("标题 不能为空", 2, "error");
				return false;
			}
			
			if(type == ""){
				art.dialog.tips("请选择类型", 2, "error");
				return false;
			}
			
			$.ajax({
				url: "${ctx}/news/save?time=" + new Date(),
				type: "post",
				data:{
					id: $("#id").val(),
					content: content,
					title: title,
					type: type
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
        	window.location.href = "${ctx}/news/list";
        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-info"></i><a href="${ctx}/news/list">新闻管理</a></li>
                <li><i class="fa fa-info"></i>新闻信息</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-info red"></i><span class="break"></span><strong>新闻信息</strong></h2>
                    
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
                    
                    <div class="form-group height_30">
                        <label class="col-md-2 control-label">类型</label>
                        <div class="col-md-7">
	                        <select id="type" name="type" class="form-control">
	                        	<option value="">请选择</option>
	                            <c:forEach items="${typeList}" var="vo">
									<option value="${vo.id}" <c:if test="${facadeBean.type == vo.id}">selected=selected</c:if>>${vo.name}</option>
								</c:forEach>
							</select>
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
