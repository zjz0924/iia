<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@include file="../common/header.jsp"%>
</head>

<body>
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>首页</li>
                <li><i class="fa fa-user"></i>声像图片管理</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-user red"></i><span class="break"></span><strong>声像图片管理</strong></h2>

                    <span style="float:right;padding-top:5px;">
                        <button type="button" class="btn btn-primary btn-xs" onclick="goTo('detail')">添加</button>
                    </span>
                </div>

                <div class="panel-body">
                    <form id="queryForm" name="queryForm" action="${ctx}/soundPic/list" method="post">
                        <table class="queryTable">
							<tr>
								<td class="labelTd">标题</td>
								<td class="contentTd">
									<input type="text" id="title" name="title" class="form-control input-sm" value="${title}">
								</td>
								
								<td class="labelTd">创建时间</td>
								<td colspan="3">
									<input type="text" id="startCreateTime" name="startCreateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endCreateTime\')}'})" class="form-control input-sm" value="${startCreateTime}" style="width:20%;display:inline-block"/> - 
									<input type="text" id="endCreateTime" name="endCreateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startCreateTime\')}'})" class="form-control input-sm" value="${endCreateTime}" style="width:20%;display:inline-block"/>
								</td>
								
								<td class="text-right" colspan="4" style="padding-right:20px;">
									<button onclick="doSubmit()" type="button" class="btn btn-primary"><i class="fa fa-search"></i>查询</button>
							   		<button onclick="doCancel()" type="button" class="btn btn-danger"><i class="fa fa-ban"></i>取消</button>
								</td>
							</tr>
                        </table>

                        <div style="padding-top: 15px;">
                            <table class="table table-bordered table-striped table-condensed table-hover">
                                <thead>
                                    <tr class="text_size_14">
                                        <th>序号</th>
                                        <th>标题</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${dataList}" var="vo" varStatus="vst">
                                        <tr>
                                            <td class="text-center text_size_14" style="width:8%;">${vst.index + 1}</td>
                                            <td class="text-center text_size_14">${vo.title}</td>
                                            <td class="text-center text_size_14" style="width:15%;"><fmt:formatDate value='${vo.createTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                            <td style="width:16%;">
                                                <button type="button" class="btn btn-default btn_padding" onclick="goTo('detail?id=${vo.id}&mode=readonly')">查看</button>
                                                <button type="button" class="btn btn-success btn_padding" onclick="goTo('detail?id=${vo.id}');">编辑</button>
                                                <button type="button" class="btn btn-danger btn_padding" onclick="confirm('是否确定删除该记录？','delete?id=${vo.id}')">删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <c:if test="${not empty dataList}">
                            <pagination:pagebar startRow="${dataList.getStartRow()}" id="queryForm" pageSize="${dataList.getPageSize()}" totalSize="${dataList.getTotal()}" showbar="true" showdetail="true" />
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
