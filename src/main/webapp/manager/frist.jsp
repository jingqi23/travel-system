	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="head.jsp"%>
	<div id="wrapper">
        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            	自助旅游平台<small>后台管理页面</small>
                        </h1>
                    </div>
                </div> 
                <c:if test="${userHouSession.role=='0' }">
				 <footer><h3>管理员：${userHouSession.name }  &nbsp&nbsp欢迎你来到自助旅游平台！</h3></footer>
				 </c:if>
				 <c:if test="${userHouSession.role=='1' }">
				 <footer><h3>用户：${userHouSession.name }  &nbsp&nbsp欢迎你来到自助旅游平台！</h3></footer>
				 </c:if>
				</div>
            </div>
        </div>
    <script src="${pageContext.request.contextPath }/manager/assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="${pageContext.request.contextPath }/manager/assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="${pageContext.request.contextPath }/manager/assets/js/jquery.metisMenu.js"></script>
      <!-- Custom Js -->
    <script src="${pageContext.request.contextPath }/manager/assets/js/custom-scripts.js"></script>
    
   
</body>
</html>
