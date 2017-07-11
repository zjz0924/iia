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
                    window.location.href = "${ctx}/newsType/list";
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
			var name = $("#name").val();
			if(isNull(name)){
				art.dialog.tips("名称不能为空", 2, "error");
				return false;
			}
        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">首页</a></li>
                <li><i class="fa fa-list"></i><a href="${ctx}/newsType/list">新闻类型</a></li>
                <li><i class="fa fa-list"></i>类型信息</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-list red"></i><span class="break"></span><strong>类型信息</strong></h2>
                </div>

                <div class="panel-body" style="padding-top:30px;padding-left:30px;">
                    <form action="${ctx}/newsType/save" method="post" onsubmit="return checkData();">
                        <input type="hidden" id="id" name="id" value="${facadeBean.id}"/>
                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">名称</label>
                            <div class="col-md-3">
                                <input type="text" id="name" name="name" class="form-control" value="${facadeBean.name}">
                            </div>
                        </div>
                        
                        <div class="form-group height_30">
		                    <label class="col-md-2 control-label">状态</label>
		                    <div class="col-md-3 height_30" style="padding-top: 5px;">
								<select id="isShow" name="isShow" class="form-control">
									<option value="Y" <c:if test="${facadeBean.isShow == 'Y'}">selected=selected</c:if>>显示</option>
		                            <option value="N" <c:if test="${facadeBean.isShow == 'N'}">selected=selected</c:if>>隐藏</option>
	                        	</select>
		                    </div>
		                </div>

						<c:if test="${not empty facadeBean.id}">
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
