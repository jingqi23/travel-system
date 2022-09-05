<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="vtop.jsp"%>
<!---->
<div class="about">
	 <div class="container">
		 <h2>旅游资讯详情</h2>
		 <div class="about-grids">
		 	<div class="col-md-5 about-pic">
				 <img src="images/${recreation.img1 }" class="img-responsive" alt=""/>
			 </div>
			 <div class="col-md-7 about-list">
				 <div class="about-top-sec">
				 	<h3>${recreation.name }</h3>				 	
			 	</div>	
			 </div>
			 	
			 <div class="clearfix"></div>
		 </div>	
		 <div class="about-top-sec">
					 <h4>详情：</h4>
					 <c:if test="${not empty recreation.img2}">
					 <div class="center-block" style="width:700px">
			  			<img src="images/${recreation.img2 }" class="img-responsive" alt=""/>
			 		 </div>
			 		 </c:if>
			 		 <div style="margin:5px;"></div>
			 		 <c:if test="${not empty recreation.img3}">
					 <div class="center-block" style="width:700px">
			  			<img src="images/${recreation.img3 }" class="img-responsive" alt=""/>
			 		 </div>
			 		 </c:if>
					 <p>${recreation.intro }</p>	
					 
			 	</div>	 
	 </div>
</div>



<%@include file="footer.jsp"%>