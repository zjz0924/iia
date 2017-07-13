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
                <li><i class="fa fa-list"></i>新闻类型</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-list red"></i><span class="break"></span><strong>新闻类型</strong></h2>

                    <span style="float:right;padding-top:5px;">
                        <button type="button" class="btn btn-primary btn-xs" onclick="goTo('detail')">添加</button>
                    </span>
                </div>

                <div class="panel-body">
                    <form id="queryForm" name="queryForm" action="${ctx}/newsType/list" method="post">
                        <table class="queryTable">
                        	<tr>
								<td class="labelTd">名称</td>
								<td class="contentTd">
									<input type="text" id="name" name="name" class="form-control input-sm" value="${name}">
								</td>
								
								<td class="labelTd">状态</td>
								<td class="contentTd">
									<select id="isShow" name="isShow" class="form-control">
										<option value="">全部</option>
			                            <option value="N" <c:if test="${isShow == 'N'}">selected=selected</c:if>>隐藏</option>
			                            <option value="Y" <c:if test="${isShow == 'Y'}">selected=selected</c:if>>显示</option>
		                        	</select>
		                        </td>
								
								<td class="labelTd">创建时间</td>
								<td colspan="5	">
									<input type="text" id="startCreateTime" name="startCreateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endCreateTime\')}'})" class="form-control input-sm" value="${startCreateTime}" style="width:20%;display:inline-block"/> - 
									<input type="text" id="endCreateTime" name="endCreateTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startCreateTime\')}'})" class="form-control input-sm" value="${endCreateTime}" style="width:20%;display:inline-block"/>
									 &nbsp;&nbsp;&nbsp;
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
                                        <th>名称</th>
                                        <th>状态</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${dataList}" var="vo" varStatus="vst">
                                        <tr>
                                            <td class="text-center text_size_14" style="width:8%;">${vst.index + 1}</td>
                                            <td class="text-center text_size_14" style="width:10%;">${vo.name}</td>
                                            <td class="text-center text_size_14" style="width:8%;">
												<c:choose>
													<c:when test="${vo.isShow == 'Y'}">
														<span class="label label-success">显示</span>
													</c:when>
													<c:otherwise>
														<span class="label label-danger">隐藏</span>
													</c:otherwise>
												</c:choose>
											</td>
                                            <td class="text-center text_size_14" style="width:10%;"><fmt:formatDate value='${vo.createTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                            <td style="width:16%;">
                                                <button type="button" class="btn btn-default btn_padding" onclick="goTo('detail?id=${vo.id}&mode=readonly')">查看</button>
                                                <button type="button" class="btn btn-success btn_padding" onclick="goTo('detail?id=${vo.id}')">编辑</button>
                                                <button type="button" class="btn btn-danger btn_padding" onclick="confirm('是否确定删除该记录？','delete?id=${vo.id}')">删除</button>
                                                <c:choose>
													<c:when test="${vo.isShow == 'Y'}">
														<button type="button" class="btn btn-warning btn_padding" onclick="confirm('是否隐藏该类型新闻？','lock?id=${vo.id}&lock=N')">隐藏</button>&nbsp;
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-info btn_padding" onclick="confirm('是否显示该类型新闻？','lock?id=${vo.id}&lock=Y')">显示</button>&nbsp;
													</c:otherwise>
												</c:choose>
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
