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
        $(function(){
            var resultCode = "${resultCode}";
            if(resultCode != null && resultCode != '' && resultCode != undefined){
                var resultMsg = "${resultMsg}";
                // 设置按钮不可点
                $("#saveBtn").attr("class", "btn btn-primary disabled");

                if(resultCode == "01" || resultCode == "03"){ 
                    window.location.href = "${ctx}/scrollPicController/list";
                }else{
                    // 设置按钮可点
                    $("#saveBtn").attr("class", "btn btn-primary");
                }
            }

            var mode = "${mode}";
            if(mode == "readonly"){
                $(":input").attr("disabled","true");
            }

            //自适应高度
            window.parent.adapter(document.body.scrollHeight + 10);
        });

        function checkData(){
        	// 设置按钮不可点
			$("#saveBtn").attr("class", "btn btn-primary disabled");
        	
			if(isNull("${facadeBean.id}")){
				if(isNull($("#url").val())){
					art.dialog.tips("请选择上传的照片", 2, "error");
					return false;
				}
			}
			
			var sort = $("#sort").val();
        	if(!isNull(sort) && !isPositiveNum(sort)){
        		art.dialog.tips("排序号必须为正整数", 2, "error");
        		$("#saveBtn").attr("class", "btn btn-primary");
        		return false;
        	}
			
			return true;
        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>首页</li>
                <li><i class="fa fa-picture-o"></i><a href="${ctx}/scrollPicController/list">滚动大图管理</a></li>
                <li><i class="fa fa-picture-o"></i>照片信息</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-picture-o"></i><span class="break"></span><strong>照片信息</strong></h2>
                </div>

                <div class="panel-body" style="padding-top:30px;padding-left:30px;">
                    <form action="${ctx}/scrollPicController/save" method="post" onsubmit="return checkData();" enctype="multipart/form-data">
                        <input type="hidden" id="id" name="id" value="${facadeBean.id}"/>
                        
                         <!-- 照片 -->
						<div class="form-group <c:if test="${empty facadeBean.id }">height_30</c:if>" <c:if test="${not empty facadeBean.id }">style="height:150px;"</c:if>>
							<label class="col-md-2 control-label">
								<c:if test="${empty facadeBean.id }"><span class="span-request">*</span></c:if>图片
							</label>
							<div class="col-md-3">
								<c:if test="${not empty facadeBean.id }">
									<img src="${resUrl}${facadeBean.url}" style="width:100px;height:100px;margin-left:10px;margin-bottom:20px;">
								</c:if>
								<c:if test="${mode != 'readonly'}">
									<input type="file" id="url" name="url" class="form-control">
								</c:if>
							</div>
						</div>
                        
                        <div class="form-group" style="height:110px;">
                            <label class="col-md-2 control-label">内容</label>
                            <div class="col-md-3">
                                <textarea id="content" name="content" class="form-control" rows="5">${facadeBean.content}</textarea>
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">排序号</label>
                            <div class="col-md-3">
                                <input type="text" id="sort" name="sort" class="form-control"  value="${facadeBean.sort}">
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
                            <div class="form-group height_30 text-center">
                                <button id="saveBtn" type="submit" class="btn btn-primary">保存</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.reload();">取消</button>
                            </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
