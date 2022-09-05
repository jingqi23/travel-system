<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.travelsystem.entity.User"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	User obj=(User)session.getAttribute("userHouSession");
	if(obj==null){
		out.print("<script>alert('请先登录');location.href='/travel/manager/login.jsp';</script>");
		return ;
	}
	%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>自助旅游平台</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath }/manager/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>

<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">自助旅游平台</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a data-toggle="modal" data-target="#updateuserModal"><i class="fa fa-user fa-fw"></i> 密码修改</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/userold/logout2"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <%--
修改
 --%><div class="modal fade" id="updateuserModal" tabindex="-1" role="dialog" aria-labelledby="updateuserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="updateuserModalLabel">密码修改</h4>
            </div>
            <form role="form" class="form-horizontal" id="userForm" method="post" action="${pageContext.request.contextPath }/userold/modifyexe1">
                <input type="hidden" name="id" id="id" value="${userHouSession.id}"/>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="password" type="password"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="password1" name="password"  type="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="password2"  type="password"/>
                        </div>
                    </div>
 					                   
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="xuigaimima()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
function xuigaimima(){
	if($("#password").val()!="${userHouSession.password}"){
		alert("原密码错误！");
		return ;
	}
	if($("#password1").val()=='' || $("#password1").val()==""){
		alert("新密码不能为空！");
		return ;
	}
	if($("#password1").val()!=$("#password2").val()){
		alert("新密码与确认密码不一致！");
		return ;
	}
	if(confirm("是否确认要修改密码？")){
		jQuery("#userForm").submit();
	}
}

</script>
 
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
            	<c:if test="${userHouSession.role=='0' }">
            	<li>
                    <a href="${pageContext.request.contextPath }/scenicspot/query1"><i class="glyphicon glyphicon-globe"></i>景点管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/buyticket/query1"><i class="glyphicon glyphicon-list-alt"></i>购票管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/userold/query"><i class="glyphicon  glyphicon-user"></i>用户管理</a>
                </li>
                 <li>
                    <a href="${pageContext.request.contextPath }/xianlu/query1"><i class="glyphicon glyphicon-tower"></i>线路管理</a>
                </li>
                </c:if>
				<li>
                    <a href="${pageContext.request.contextPath }/feedback/query"><i class="glyphicon glyphicon-home"></i>评论管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/grogshop/query1"><i class="glyphicon glyphicon-home"></i>酒店信息管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/food/query1"><i class="glyphicon glyphicon-cutlery"></i>美食信息管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/recreation/query1"><i class="glyphicon glyphicon-tower"></i>旅游资讯管理</a>
                </li>
              
                <c:if test="${userHouSession.role=='1' }">
                <li>
                    <a href="${pageContext.request.contextPath }/tuan/query1"><i class="glyphicon glyphicon-tower"></i>组团管理</a>
                </li>
                 <li>
                    <a href="${pageContext.request.contextPath }/feiyong/query1"><i class="glyphicon glyphicon-tower"></i>费用管理</a>
                </li>
                </c:if>
                <li>
                    <a href="${pageContext.request.contextPath }/userold/logout"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                </li>
            </ul>
        </div>
    </nav>