<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp"%>
<%@include file="/page/NavPageBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../common/header.jsp"%>

<!-- 百度地图 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Qugu61WkVKsZssXGDRSYIgGIlNE3lPza"></script>
<script src="${ctx}/resources/js/jquery-2.1.1.min.js"></script>

<script type="text/javascript">
	    function save(){
			var name = $("#name").val();
			var address = $("#address").val();
			var phone = $("#phone").val();
			var fax = $("#fax").val();
			var url = $("#url").val();
			
			$.ajax({
				url: "${ctx}/contact/save?time=" + new Date(),
				type: "post",
				data:{
					name: name,
					address: address,
					phone: phone,
					fax: fax,
					url: url
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
        	$(":input").show();
        	$("span[class='form-span']").hide();
        	$("#btnDiv").show();
        	$("#saveBtn").hide();
        	$("#allmap").hide();
        }
    </script>
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<ol class="breadcrumb">
				<li><i class="fa fa-phone-square"></i>联系信息</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>
						<i class="fa fa-phone-square red"></i><span class="break"></span><strong>联系信息</strong>
					</h2>

					<div style="float: right; margin-top: 5px;">
						<button type="button" id="saveBtn" class="btn btn-primary btn-xs" onclick="edit()">编辑</button>
					</div>
				</div>

				<div class="panel-body" style="padding-top: 30px; padding-left: 30px;">
					<div class="form-group height_30">
						<label class="col-md-2 control-label">名称</label>
						<div class="col-md-7">
							<input type="text" id="name" name="name" class="form-control" value="${facadeBean.name}" style="display: none;">
							<span class="form-span">${facadeBean.name}</span>
						</div>
					</div>

					<div class="form-group height_30">
						<label class="col-md-2 control-label">网址</label>
						<div class="col-md-7">
							<input type="text" id="url" name="url" class="form-control" value="${facadeBean.url}" style="display: none;">
							<span class="form-span">${facadeBean.url}</span>
						</div>
					</div>

					<div class="form-group height_30">
						<label class="col-md-2 control-label">电话</label>
						<div class="col-md-7">
							<input type="text" id="phone" name="phone" class="form-control" value="${facadeBean.phone}" style="display: none;">
							<span class="form-span">${facadeBean.phone}</span>
						</div>
					</div>

					<div class="form-group height_30">
						<label class="col-md-2 control-label">传真</label>
						<div class="col-md-7">
							<input type="text" id="fax" name="fax" class="form-control" value="${facadeBean.fax}" style="display: none;"> 
							<span class="form-span">${facadeBean.fax}</span>
						</div>
					</div>
					
					<div class="form-group height_30">
						<label class="col-md-2 control-label">地址</label>
						<div class="col-md-7">
							<input type="text" id="address" name="address" class="form-control" value="${facadeBean.address}" style="display: none;"> 
							<span class="form-span">${facadeBean.address}</span>
						</div>
					</div>
					
					<div id="allmap" style="width:600px;height:400px;margin-left:10px;"></div>

					<div class="form-group height_30 text-center"
						style="display: none;" id="btnDiv">
						<button id="saveBtn" type="button" class="btn btn-primary" onclick="save()">保存</button>
						<button type="button" class="btn btn-danger" onclick="window.location.reload();">取消</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>

<script type="text/javascript">
	var markerArr;

	//创建和初始化地图函数：
	function initMap(point){
	    createMap(point);//创建地图
	    setMapEvent();//设置地图事件
	    addMapControl();//向地图添加控件
	    
	  	//标注点数组
	  	var centerPoint = map.getCenter().lng + "|" + map.getCenter().lat;
		markerArr = [{title:'<strong style="color:#d00000;font-size:14px;">${facadeBean.name}</strong>',content:'<table style="width:380px;font-size:13px;"><tbody><tr style="height:30px;"><td style="WIDTH: 45px;"><strong>地址：</strong></td><td>${facadeBean.address}</td></tr><tr style="height:30px;"><td clospan="2"><strong>电话：</strong></td><td>${facadeBean.phone}</td></tr><tr style="height:30px;"><td clospan="2"><strong>传真：</strong></td><td>${facadeBean.fax}</td></tr><tr style="height:30px;"><td clospan="2"><strong>网址：</strong></td><td><a href="${facadeBean.url}" target="_blank">${facadeBean.url}</a></td></tr></tbody></table>',point:centerPoint,isOpen:1,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}];
	    addMarker();//向地图中添加marker
	}
	
	//创建地图函数：
	function createMap(point){
		var map = new BMap.Map("allmap");//在百度地图容器中创建一个地图
	    var point = new BMap.Point(point.lng, point.lat);//定义一个中心点坐标
	    map.centerAndZoom(point,21);//设定地图的中心点和坐标并将地图显示在地图容器中
	    window.map = map;//将map变量存储在全局
	}
	
	//地图事件设置函数：
	function setMapEvent(){
	    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
	    map.enableScrollWheelZoom();//启用地图滚轮放大缩小
	    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
	    map.enableKeyboard();//启用键盘上下左右键移动地图
	}
	
	//地图控件添加函数：
	function addMapControl(){
	    //向地图中添加缩放控件
		var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		map.addControl(ctrl_nav);
		
		//向地图中添加缩略图控件
		//var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
		//map.addControl(ctrl_ove);
		
		//向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		map.addControl(ctrl_sca);
	}
	
	//创建marker
	function addMarker(){
	    for(var i=0;i<markerArr.length;i++){
	        var json = markerArr[i];
	        var p0 = json.point.split("|")[0];
	        var p1 = json.point.split("|")[1];
	        var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
	        var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
	        map.addOverlay(marker);
	        label.setStyle({
               borderColor:"#808080",
               color:"#333",
               cursor:"pointer"
	        });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
	    }
	}
	//创建InfoWindow
	function createInfoWindow(i){
	    var json = markerArr[i];
	    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
	    return iw;
	}
	//创建一个Icon
	function createIcon(json){
	    var icon = new BMap.Icon("http://map.baidu.com/image/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
	    return icon;
	}
	
	
	var add = "${facadeBean.address}";
	// 创建地址解析器实例
	var myGeo = new BMap.Geocoder();
	
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(add, function(point){
		if (point) {
			initMap(point);//创建和初始化地图
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "深圳市");
</script>
