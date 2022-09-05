<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="vtop.jsp"%>
<!---->
<div class="about">
	 <div class="container">
		 <h2>美食详情</h2>
		 
		 <div class="about-grids">
		 	<div class="col-md-5 about-pic">
				 <img src="images/${food.img1 }" class="img-responsive" alt=""/>
			 </div>
			 <div class="col-md-7 about-list">
				 <div class="about-top-sec">
				 	<h3>${food.name }</h3>
				 	<h4>地址：</h4>
				 	<p>${food.address }</p>
				 	
				 	<h4>价格：${food.price }</h4>
					 	<c:if test="${userSession!=null}">
					 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addscenModal">美食预订</button>
			 		</c:if>
					 
			 	</div>	
			 </div>
			 
			 <div class="clearfix"></div>
		 </div>	
		 <div class="about-top-sec">
					 <h4>美食介绍：</h4>
					 <c:if test="${not empty food.img2}">
					 <div class="center-block" style="width:700px">
			  			<img src="images/${food.img2 }" class="img-responsive" alt=""/>
			 		 </div>
			 		 </c:if>
			 		 <div style="margin:5px;"></div>
			 		 <c:if test="${not empty food.img3}">
					 <div class="center-block" style="width:700px">
			  			<img src="images/${food.img3 }" class="img-responsive" alt=""/>
			 		 </div>
			 		 </c:if>
					 <p>${food.intro }</p>	
					 
			 	</div>	 
	 </div>
</div>


<%--
门票预定
--%><div class="modal fade" id="addscenModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">美食预订</h4>
            </div>
            <form role="form" class="form-horizontal" id="addscenform"  method="post" action="${pageContext.request.contextPath }/buyticket/add">
                <div class="modal-body">
                	<div class="form-group">
                        <label class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="num" name="num" type="number" required/>
                            <span></span>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="col-sm-2 control-label">总价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="price" name="price" required readonly/>
                        </div>
                    </div>  
 					<input type="hidden" class="form-control" name="sid" value="${food.name }" required/>
 					<input type="hidden" class="form-control" name="fenlei" value="美食" required/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="yuding()" class="btn btn-primary">预订</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
jQuery("#num").bind("blur",function(){
	var num=parseInt(jQuery("#num").val());
	if(!isNaN(num))
	jQuery("#price").val(num*${food.price });
}).focus();

function yuding(){
	 if(jQuery("#addscenModal #num").val()=='' || jQuery("#addscenModal #addname").val()=="" || parseInt(jQuery("#addscenModal #num").val())<0){
		 alert("预定数量不能为空，不能小于0！");
			return ;
	 }
	if(confirm("是否确认要提交数据？")){
		jQuery("#addscenform").submit();
		 alert("总价为："+jQuery("#price").val()+"元");
	}
}
</script>

<%--
百度地图
--%><div style="width:1000px;height:400px;border:#ccc solid 1px;" id="allmap"></div>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;margin: 0 auto;}
		#r-result{width:100%;margin-top:5px;}
		p{margin:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OzT8ph1EpOhMgdfdrjpjqDaG7TTIYQb3"></script>
<script type="text/javascript">
 
	// 百度地图API功能
	var map = new BMap.Map("allmap");
  var point=new BMap.Point(${food.coordinate});
	map.centerAndZoom(point, 15);

	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
	/*缩放控件type有四种类型:
	BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
	
  var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);               // 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
  
  
  
  map.addControl(top_left_control);        
		map.addControl(top_left_navigation);     
		map.addControl(top_right_navigation); 
  
		   map.enableScrollWheelZoom();//启用地图滚轮放大缩小
		    map.enableKeyboard();//启用键盘上下左右键移动地图
</script>

<%@include file="footer.jsp"%>