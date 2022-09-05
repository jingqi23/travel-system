<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.travelsystem.entity.User"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	User obj=(User)session.getAttribute("userHouSession");
	if(obj!=null){
		out.print("<script>location.href='/travel/manager/frist.jsp';</script>");
		return ;
	}
	%>
<html lang="zh-CN">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>自助旅游平台</title>
	<!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        
        <!--/. NAV TOP  -->

        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="margin:10px;">
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            自助旅游平台 <small>后台登录</small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
              <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户登录
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4 col-lg-push-3">
                                    <form role="form" method="post" action="${pageContext.request.contextPath }/userold/login1">
                                        <div class="form-group">
                                            <label>用户名:</label>
                                            <input class="form-control" name="userCode" placeholder="请输入用户名" required>
                                        </div>
                                        <div class="form-group">
                                            <label>密码:</label>
                                            <input class="form-control" type="password" name="userPassword" placeholder="请输入密码" required>
                                        </div>
                                        <button type="subimt" class="btn btn-default" >登2录</button>
                                        <button type="reset" class="btn btn-default">重置</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<footer><p></p></footer>
			</div>
            </div>
        </div>
    <script src="${pageContext.request.contextPath }/manager/assets/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath }/manager/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/manager/assets/js/jquery.metisMenu.js"></script>
    <c:if test="${error!=null }">
    <script>
			alert("${error}");
</script>
</c:if>
</body>

</html>
