<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="vtop.jsp"%>
<!---->
<div class="about">
	 <div class="container">
		 <h2>组团详情</h2>
		 
		 <div class="about-grids">
		 	<div class="col-md-5 about-pic">
				 <img src="images/${tuan.pic }" class="img-responsive" alt=""/>
			 </div>
			 <div class="col-md-7 about-list">
				 <div class="about-top-sec">
				 	<h3>标题:${tuan.name }</h3>
				 	<p>发起人：${tuan.user.name }</p>
				 	<p>出发时间:${tuan.time }</p>
				 	<h4>组团人数:${tuan.nums }</h4>
				 	<h4>当前参与人数:${tuan.cnums}</h4>
				 	<c:if test="${userSession!=null}">
					 <button type="button" onclick="yuding('${tuan.id}','${sessionScope.userSession.id}')" class="btn btn-default" data-toggle="modal" data-target="#addscenModal">报名参加</button>
			 		</c:if>
					 
			 	</div>	
			 </div>
			 	
			 <div class="clearfix"></div>
		 </div>	
		 <div class="about-top-sec">
					 <h4>组团介绍：</h4>
					 <p>${tuan.content }</p>	
					 
			 	</div>	 
			 	<hr/>
		 	 <h3 style="margin-top:20px;">参与人员</h3>
		 	 <c:forEach items="${tuan.tuanxis}" var="item">
			  <hr/>
			 <div class="about-grids">
				 <div class="col-md-12 about-list">
					 <div class="about-top-sec">
					 	<h3>参与人:${item.user.name}</h3>
						 </div>	
				 </div>
				 <div class="clearfix"></div>
			 </div>	
			 </c:forEach>
	 </div>
</div>


<script type="text/javascript">


function yuding(tid,uid){ 
	if(confirm("是否确认要参团？")){
		location.href="tuan/tuanxiadd.action?tid="+tid+"&uid="+uid;
	}
}
</script>

<%@include file="footer.jsp"%>