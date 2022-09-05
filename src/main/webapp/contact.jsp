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
<!--footer-->
<div class="contact">
	 <div class="container">
			<div class="footer-top heading">
				<h3>反馈我们</h3>
			</div>
			<div class="footer-bottom">
					<div class="col-md-4 footer-left">
						<div class="f-1">
							<span class="glyphicon3 glyphicon-earphone" aria-hidden="true"></span>
							<p>+1 234 567 9871</p>
						</div>
						<div class="f-1">
							<a href="#"><span class="glyphicon3 glyphicon-envelope" aria-hidden="true"></span></a>
							<p><a href="#">5454545@qq.com</a></p>
						</div>
						<div class="f-1">
							<span class="glyphicon3 glyphicon-map-marker" aria-hidden="true"></span>
							<p>大冶大道116号金惠小区B栋201号</p>
						</div>
					</div>
					<div class="col-md-8 footer-right">
						<form method="post" action="${pageContext.request.contextPath }/feedback/add">
						<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '你的意见或建议';}" name="fback">你的意见或建议</textarea>
						<div class="contact-but">
								<input class="btn btn-success" type="submit" value="提交" />
						</div>
						</form>
					</div>
		 </div>		               

<%@include file="footer.jsp"%>