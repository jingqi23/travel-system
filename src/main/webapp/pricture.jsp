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
</div><%--
添加
--%><div class="modal fade" id="addprictureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
       
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">攻略添加</h4>
            </div>
        
            <form role="form" class="form-horizontal" id="addForm"  method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/pricture/add" >
                <input type="hidden" name="role" value="2"/>
				<input type="hidden" name="uid" value="${sessionScope.userSession.id}"/>
                <div class="modal-body">
                
                <div class="form-group">
                        <label class="col-sm-2 control-label">照片:</label>
                        <div class="col-sm-9">
                            <input type="file" id="exampleInputFile" name="pricturefiles">
                            <span></span>
                        </div>
                    </div>  
                
  				<div class="form-group">
                        <label class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-9">
                            <textarea rows="3" cols="50" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '书写你的回忆';}" name="describe">书写你的回忆</textarea>
                        </div>
                  </div>  
				    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!---->
<script src="${pageContext.request.contextPath }/js/lightbox-plus-jquery.min.js"></script>
<!---->
<script type="text/javascript">
			var gl=jQuery("#grogshoplist ");
			var  options = null;
			var  sname = null;
			jQuery.ajax({
			type:"post",//请求类型
			url:"${pageContext.request.contextPath }/pricture/query",//请求的url
			data:{pageIndex:1},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.user!=null){
					options = " <h3>攻略</h3><div class=\"form-group\"><button type=\"button\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#addprictureModal\" >添加攻略</button></div>";
					}else{
						options = " <h3>攻略</h3>";
						}
				if(data.prictureList.length>0){
				for(var i = 0; i < data.prictureList.length; i++){
						options += "<div class=\"destintn-grids\"><div class=\"col-md-3 desti-grid2\"><a class='example-image-link' href='${pageContext.request.contextPath }/pricture/view?id="+data.prictureList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.prictureList[i].img+"\"/><div class=\"desti-info\"><h5>"+data.prictureList[i].title+"</h5></div></a></div>";
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
				url:"${pageContext.request.contextPath }/pricture/query",//请求的url
				data:{pageIndex:pageIndex},//请求参数
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success:function(data){//data：返回数据（json对象）
					if(data.user!=null){
					options = " <h3>攻略</h3><div class=\"form-group\"><button type=\"button\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#addprictureModal\" >添加回忆</button></div>";
					}else{
						options = " <h3>攻略</h3>";
						}
					if(data.prictureList.length>0){
					for(var i = 0; i < data.prictureList.length; i++){
							options += "<div class=\"destintn-grids\"><div class=\"col-md-3 desti-grid2\"><a class='example-image-link' href='${pageContext.request.contextPath }/pricture/view?id="+data.prictureList[i].id+"\' ><img class=\"example-image\" src=\"images/"+data.prictureList[i].img+"\"/><div class=\"desti-info\"><h5>"+data.prictureList[i].sname+"</h5></div></a></div>";
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