<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top.jsp"%>

<div id="destination" class="destination">
	 <div class="container">
		 <div class="destination-top" id="grogshoplist">
			 
		 </div>
		 <div class="clearfix"></div>
			 <div class="row" id="pageIndex">
                   <div class="col-sm-12 text-center">
                       <div class="dataTables_paginate paging_simple_numbers"
                                             id="dataTables-example_paginate">
                        <ul class="pagination">
                        <li class="paginate_button previous"
                                                    aria-controls="dataTables-example" tabindex="0"
                                                    id="dataTables-example_previous"></li>
                         <li class="paginate_button next" aria-controls="dataTables-example"
                                                    tabindex="0" id="dataTables-example_next"></li>
                         </ul>
                        </div>
                   </div>
            </div>
		
	 </div>
</div>


<!---->
<script src="js/lightbox-plus-jquery.min.js"></script>
<!---->
<script type="text/javascript">
			var gl=jQuery("#grogshoplist ");
			var  options = null;
			jQuery.ajax({
			type:"post",//请求类型
			url:"${pageContext.request.contextPath }/food/query",//请求的url
			data:{queryFoodName:jQuery("#querygrogshopName").val(),pageIndex:1},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				options = " <h3>美食</h3><form class=\"form-horizontal\" ><div class=\"form-group\"><label for=\"inputEmail3\" class=\"col-sm-2 control-label\">名称</label><div class=\"col-sm-7\"><input type=\"text\" class=\"form-control\" id=\"querygrogshopName\" placeholder=\"请输入美食名称\"></div><div class=\" col-sm-2\"><button type=\"button\" class=\"btn btn-default\" onclick=\"sousuo(1)\">搜索</button></div></div></form>";
				if(data.foodList.length>0){
				for(var i = 0; i < data.foodList.length; i++){
						options += "<div class=\"destintn-grids\"><div class=\"col-md-4 desti-grid\"><a class='example-image-link' href='${pageContext.request.contextPath }/food/view?id="+data.foodList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.foodList[i].img1+"\"/><div class=\"desti-info\"><h5>"+data.foodList[i].name+"</h5></div></a></div>";
				}
				}else{
					options +="空空如也！";
				}
				gl.html(options);
				if(data.currentPageNo>1){
				jQuery("#dataTables-example_previous").html("<a onclick='sousuo("+(data.currentPageNo-1)+")'>上一页</a>");
				}else{
					jQuery("#dataTables-example_previous").html("<a>上一页</a>");
				}
				if(data.currentPageNo<data.totalPageCount){
				jQuery("#dataTables-example_next").html("<a onclick='sousuo("+(data.currentPageNo+1)+")'>下一页</a>");
				}else{
					jQuery("#dataTables-example_next").html("<a>下一页</a>");
				}
			
			}});
			
			function sousuo(pageIndex){
				var  options = null;
				jQuery.ajax({
				type:"post",//请求类型
				url:"${pageContext.request.contextPath }/food/query",//请求的url
				data:{queryFoodName:jQuery("#querygrogshopName").val(),pageIndex:pageIndex},//请求参数
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success:function(data){//data：返回数据（json对象）
					options = " <h3>美食</h3><form class=\"form-horizontal\" ><div class=\"form-group\"><label for=\"inputEmail3\" class=\"col-sm-2 control-label\">名称</label><div class=\"col-sm-7\"><input type=\"text\" class=\"form-control\" id=\"querygrogshopName\" placeholder=\"请输入美食名称\"></div><div class=\" col-sm-2\"><button type=\"button\" class=\"btn btn-default\" onclick=\"sousuo(1)\">搜索</button></div></div></form>";
					if(data.foodList.length>0){
					for(var i = 0; i < data.foodList.length; i++){
							options += "<div class=\"destintn-grids\"><div class=\"col-md-4 desti-grid\"><a class='example-image-link' href='${pageContext.request.contextPath }/food/view?id="+data.foodList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.foodList[i].img1+"\"/><div class=\"desti-info\"><h5>"+data.foodList[i].name+"</h5></div></a></div>";
					}
					}else{
						options +="空空如也！";
					}
					gl.html(options);
					if(data.currentPageNo>1){
					jQuery("#dataTables-example_previous").html("<a onclick='sousuo("+(data.currentPageNo-1)+")'>上一页</a>");
					}else{
						jQuery("#dataTables-example_previous").html("<a>上一页</a>");
					}
					if(data.currentPageNo<data.totalPageCount){
					jQuery("#dataTables-example_next").html("<a onclick='sousuo("+(data.currentPageNo+1)+")'>下一页</a>");
					}else{
						jQuery("#dataTables-example_next").html("<a>下一页</a>");
					}
				
				}});
			}
</script>

<%@include file="footer.jsp"%>