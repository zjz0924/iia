<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/add-ons.min.css" rel="stylesheet">
    <script src="${ctx}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.2/artDialog.source.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.2/jquery.artDialog.source.js?skin=idialog"></script>
    <script type="text/javascript" src="${ctx}/resources/js/artDialog4.1.2/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/tools.js"></script>

    <script type="text/javascript">
        $(function(){
            var resultCode = "${resultCode}";
            if(resultCode != null && resultCode != '' && resultCode != undefined){
                var resultMsg = "${resultMsg}";
                // 设置按钮不可点
                $("#saveBtn").attr("class", "btn btn-primary disabled");

                if(resultCode == "01" || resultCode == "03"){ 
                    window.location.href = "${ctx}/contact/list";
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


        }
    </script>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.html">首页</a></li>
                <li><i class="fa fa-phone-square"></i>联系信息</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-phone-square red"></i><span class="break"></span><strong>联系信息</strong></h2>
                </div>

                <div class="panel-body" style="padding-top:30px;padding-left:30px;">
                    <form action="${ctx}/contact/save" method="post" onsubmit="return checkData();">
                        <input type="hidden" id="id" name="id" value="${facadeBean.id}"/>
                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">名称</label>
                            <div class="col-md-3">
                                <input type="text" id="name" name="name" class="form-control" value="${facadeBean.name}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">地址</label>
                            <div class="col-md-3">
                                <input type="text" id="address" name="address" class="form-control" value="${facadeBean.address}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">网址</label>
                            <div class="col-md-3">
                                <input type="text" id="url" name="url" class="form-control" value="${facadeBean.url}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">电话</label>
                            <div class="col-md-3">
                                <input type="text" id="phone" name="phone" class="form-control" value="${facadeBean.phone}">
                            </div>
                        </div>

                        <div class="form-group height_30">
                            <label class="col-md-2 control-label">传真</label>
                            <div class="col-md-3">
                                <input type="text" id="fax" name="fax" class="form-control" value="${facadeBean.fax}">
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
