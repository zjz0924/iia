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
                    window.location.href = "${ctx}/member/list";
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
        	if(isNull("${facadeBean.id}")){
				if(!isRequired("userName", "用户名")) return false;
				if(!isRequired("password", "密码")) return false;
			}
			
			if(!isRequired("email", "邮箱")) return false;
        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-user"></i><a href="${ctx}/member/list">会员管理</a></li>
                <li><i class="fa fa-user"></i>会员信息</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-user red"></i><span class="break"></span><strong>会员信息</strong></h2>
                </div>

                <div class="panel-body" style="padding-top:30px;padding-left:30px;">
                    <form action="${ctx}/member/save" method="post" onsubmit="return checkData();">
                        <input type="hidden" id="id" name="id" value="${facadeBean.id}"/>
                        <div class="form-group height_30">
                            <label class="col-md-2 control-label"><span class="asterisk">*</span>用户名</label>
                            <div class="col-md-3">
                                <input type="text" id="userName" name="userName" class="form-control" value="${facadeBean.userName}">
                            </div>
                        </div>
                        
                         
		                <div class="form-group height_30">
		                    <label class="col-md-2 control-label"><c:if test="${empty facadeBean.id }"><span class="asterisk">*</span></c:if>密码</label>
		                    <div class="col-md-3">
		                    	<input type="input" id="password" name="password" class="form-control" <c:if test="${empty facadeBean.id }"> value="e@ZUGLmZIA"</c:if>>
		                    </div>
		                </div>
		                
		                <c:if test="${not empty facadeBean.id }"> 
			                <div class="form-group height_30">
	                            <label class="col-md-2 control-label">会员组</label>
	                            <div class="col-md-3">
	                                <select id="groupId" name="groupId" class="form-control">
										<c:forEach items="${groupList}" var="vo">
											<option value="${vo.id}" <c:if test="${facadeBean.groupId == vo.id}">selected=selected</c:if>>${vo.name}</option>
										</c:forEach>
		                        	</select>
	                            </div>
	                        </div>
                        </c:if>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label"><span class="asterisk">*</span>注册邮箱</label>
                            <div class="col-md-3">
                                <input type="text" id="email" name="email" class="form-control" value="${facadeBean.email}">
                            </div>
                        </div>

						<div class="form-group height_30">
                            <label class="col-md-2 control-label">单位全称</label>
                            <div class="col-md-3">
                                <input type="text" id="name" name="name" class="form-control" value="${facadeBean.name}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">单位网址</label>
                            <div class="col-md-3">
                                <input type="text" id="url" name="url" class="form-control" value="${facadeBean.url}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">通讯地址</label>
                            <div class="col-md-3">
                                <input type="text" id="address" name="address" class="form-control" value="${facadeBean.address}">
                            </div>
                        </div>

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
