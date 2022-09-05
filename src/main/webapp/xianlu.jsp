<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.travelsystem.entity.User"%>
<%@include file="top.jsp"%>
<%
	User obj=(User)session.getAttribute("userSession");
	if(obj==null){
		out.print("<script>alert('请先登录');location.href='/travel/scenicspot.jsp';</script>");
		return ;
	}
	%>
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
<script src="${pageContext.request.contextPath }/js/lightbox-plus-jquery.min.js"></script>
<!---->

<script type="text/javascript">
			var gl=jQuery("#grogshoplist ");
			var  options = null;
			jQuery.ajax({
			type:"post",//请求类型
			url:"${pageContext.request.contextPath }/xianlu/query",//请求的url
			data:{queryXianluName:jQuery("#querygrogshopName").val(),pageIndex:1},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				options = " <h3>旅游线路</h3><form class=\"form-horizontal\" ><div class=\"form-group\"><label for=\"inputEmail3\" class=\"col-sm-2 control-label\">名称</label><div class=\"col-sm-7\"><input type=\"text\" class=\"form-control\" id=\"querygrogshopName\" placeholder=\"请输入景点线路名称\" ></div><div class=\" col-sm-2\"><button type=\"button\" class=\"btn btn-default\" onclick=\"sousuo(1)\">搜索</button></div></div></form>";
				if(data.xianluList.length>0){
				for(var i = 0; i < data.xianluList.length; i++){
						options += "<div class=\"destintn-grids\"><div class=\"col-md-4 desti-grid\"><a class='example-image-link' href='${pageContext.request.contextPath }/xianlu/view?id="+data.xianluList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.xianluList[i].img1+"\"/><div class=\"desti-info\"><h5>"+data.xianluList[i].name+"</h5><h5>￥"+data.xianluList[i].price+"元</h5></div></a></div>";
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
				url:"${pageContext.request.contextPath }/xianlu/query",//请求的url
				data:{queryXianluName:jQuery("#querygrogshopName").val(),pageIndex:pageIndex},//请求参数
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success:function(data){//data：返回数据（json对象）
					options = " <h3>旅游线路</h3><form class=\"form-horizontal\" ><div class=\"form-group\"><label for=\"inputEmail3\" class=\"col-sm-2 control-label\">名称</label><div class=\"col-sm-7\"><input type=\"text\" class=\"form-control\" id=\"querygrogshopName\" placeholder=\"请输入景点线路名称\" ></div><div class=\" col-sm-2\"><button type=\"button\" class=\"btn btn-default\" onclick=\"sousuo(1)\">搜索</button></div></div></form>";
					if(data.xianluList.length>0){
					for(var i = 0; i < data.xianluList.length; i++){
							options += "<div class=\"destintn-grids\"><div class=\"col-md-4 desti-grid\"><a class='example-image-link' href='${pageContext.request.contextPath }/xianlu/view?id="+data.xianluList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.xianluList[i].img1+"\"/><div class=\"desti-info\"><h5>"+data.xianluList[i].name+"</h5><h5>￥"+data.xianluList[i].price+"元</h5></div></a></div>";
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