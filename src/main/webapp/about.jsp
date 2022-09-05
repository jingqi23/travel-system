<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="vtop.jsp"%>
<!---->
<div class="about">
	 <div class="container">
		 <h2>旅游攻略</h2>
		 
		 <div class="about-grids">
		  <div class="col-md-6 about-pic">
				 <img src="images/${pricture.img }" class="img-responsive" alt=""/>
			 </div>
			 <div class="col-md-6 about-list">
				 <div class="about-top-sec">
				 	<h3>${pricture.title }</h3>
					 <h4>内容：</h4>
					 <h4>${pricture.describe }</h4>	
					 <button type="button" class="btn btn-danger" onclick="del(${pricture.id })">删除</button>
			 	</div>	
			 </div>
			
			 <div class="clearfix"></div>
		 </div>	
		 
		 <hr/>
		 	 <h3 style="margin-top:20px;">评价</h3>
		 	 <c:forEach items="${pricture.feedbacks}" var="item">
			  <hr/>
			 <div class="about-grids">
				 <div class="col-md-12 about-list">
					 <div class="about-top-sec">
					 	<h3>评论人:${item.user.name}<span style="float:right;font-size:15px;">[${item.ftime}]</span></h3>
						 <h4>评论内容：</h4>
						 <h4>${item.fback }</h4>	
						 <%--<button type="button" class="btn btn-danger" onclick="del2(${item.id })">删除</button>
				 	--%></div>	
				 </div>
				 <div class="clearfix"></div>
			 </div>	
			 </c:forEach>
	 </div>
	 <div class="container">
			<div class="footer-top heading">
				<h3 style="margin-bottom: 10px;">发表评论</h3>
			</div>
			<div class="col-md-12 footer-right">
						<form method="post" action="${pageContext.request.contextPath }/feedback/add">
						<input type="hidden" name="pid" value="${pricture.id}"/>
						<input type="hidden" name="uid" value="${sessionScope.userSession.id}"/>
						<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '内容';}" name="fback">内容</textarea>
						<div class="contact-but">
								<input class="btn btn-success" type="submit" value="提交" />
						</div>
						</form>
					</div>
	  </div>
</div>
<script>
function del(id){
	if(confirm("是否删除？")){
		location.href="pricture/del/"+id;
	}
}
function del2(id){
	if(confirm("是否删除？")){
		location.href="feedback/del/"+id;
	}
}
</script>
<%@include file="footer.jsp"%>