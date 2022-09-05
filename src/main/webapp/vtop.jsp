<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>自助旅游平台</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/lightbox.css">
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->

<!--//theme style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Goaway Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>


</head>
<body>
<!-- header -->
<div class="top-header">
	 <div class="container">
		 <div class="logo">
			 <h1><a href="index.jsp"><span class="glyphicon " aria-hidden="true"></span>自助旅游</a></h1>
		 </div>		 
	 </div>
</div>
<!---->
<div class="top-menu">
	 <div class="container">
	  <div class="content white ">
		 <nav class="navbar navbar-default col-md-8">
			 <div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>				
			 </div>
			 <!--/navbar header-->		
			 <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
				 <ul class="nav navbar-nav">
					 <li><a href="scenicspot.jsp">景点</a></li>
					 <li><a href="index.jsp">酒店</a></li>
					 <li><a href="food.jsp">美食</a></li>
					 <li><a href="recreation.jsp">资讯</a></li>
					 <li><a href="tuan.jsp">组团</a></li>
					 <li><a href="pricture.jsp">攻略</a></li>
					 <li><a href="xianlu.jsp">线路</a></li>

				 </ul>
				</div>
				
			  <!--/navbar collapse-->
		 </nav>
		<div style="line-height:96px;"> 
						<c:if test="${userSession==null}">
						  	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#loganModal"> 登录</button>
                         	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal" >注册</button>
                    	
					</c:if>
					<c:if test="${userSession!=null}">
						<label class="input-sm text-center" for="zhanghao">欢迎，<a data-toggle="modal" data-target="#updateModal" onclick="update(${userSession.id})">${userSession.username}</a></label>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#listbuyModal" >查看预订</button>
						<a type="button" class="btn btn-success" href="${pageContext.request.contextPath }/userold/logout">
                    	退出登录！
                    	</a>
					</c:if>
                    
                </div>
		  <!--/navbar-->		 
	  </div>
	   
	 <div class="clearfix"></div>
		<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-3.1.1.min.js"></script>
		</div>
</div>
<!---->

<%--
预订
--%><div class="modal fade" id="listbuyModal" tabindex="-1" role="dialog" aria-labelledby="yudingModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="yudingModalLabel">查看预订</h4>
            </div>
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                 id="dataTables-example" aria-describedby="dataTables-example_info">
                           <thead>
                             <tr role="row" id="listbuyModal-table">
                                 <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example"
                                            rowspan="1" colspan="1" aria-sort="ascending"
                                            aria-label="Rendering engine: activate to sort column ascending"
                                            style="width: 60px;">序号
                                   </th>
                                  <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 140px;">景点
                                  </th>
                                 <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 100px;">预定量
                                </th>
                                 <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 60px;">总价
                                 </th>
                                <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 80px;">状态
                               </th>
                               <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 60px;">操作
                               </th>
                           </tr>
                     </thead>
              </table>
              <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
        </div>
    </div>
</div>
<%--
登录
--%><div class="modal fade" id="loganModal" tabindex="-1" role="dialog" aria-labelledby="liganModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="liganModalLabel">用户登录</h4>
            </div>
            <form role="form" class="form-horizontal"   method="post" action="${pageContext.request.contextPath }/userold/login">
                <div class="modal-body">
                	<div class="form-group">
                        <label class="col-sm-2 control-label">账号:</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="userCode" required/>
                            <span></span>
                        </div>
                    </div>  

                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" name="userPassword"  type="password" required/>
                        </div>
                    </div>                    
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">【登录】</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--
增加
--%><div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="zhuceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="zhuceModalLabel">用户注册</h4>
            </div>
            <form role="form" class="form-horizontal" id="addForm"  method="post" action="${pageContext.request.contextPath }/userold/add">
                <input type="hidden" name="role" value="1"/>
                <div class="modal-body">
                	<div class="form-group">
                        <label class="col-sm-2 control-label">账号:</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="username"  name="username" required/>
                            <span></span>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="addname" name="name" required/>
                        </div>
                    </div>    
                                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-9">
                        <select class="form-control" name="sex" >
                        <option value="0" selected>男</option><option value="1">女</option>
                        </select>
                        </div>
                    </div>
                    
                  <div class="form-group">
                        <label class="col-sm-2 control-label">电话:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="addphone" name="phone" required/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="addpassword1" name="password"  type="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="addpassword2"   type="password"/>
                        </div>
                    </div>
 					                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="addidcard" name="idcard" required/>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="zhuce()" class="btn btn-primary">注册</button>
                </div>
            </form>
        </div>
    </div>
</div>



<%--
修改
 --%><div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="updateModalLabel">用户信息修改</h4>
            </div>
            <form role="form" class="form-horizontal" id="userForm" method="post" action="${pageContext.request.contextPath }/userold/modifyexe">
                <input type="hidden" name="id" id="id"/>
                <div class="modal-body">
                
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" required/>
                        </div>
                    </div>    
                                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-9">
                        <select class="form-control" id="sex" name="sex">
                        </select>
                        </div>
                    </div>
                    
                  <div class="form-group">
                        <label class="col-sm-2 control-label">电话:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="phone" name="phone" required/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原始密码:</label>
                        <div class="col-sm-9">
                        <input class="form-control" id="password0"  type="hidden"/>
                        	<input class="form-control" id="password"  type="password"/>
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
 					                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证:</label>
                        <div class="col-sm-9">
                        	<input class="form-control" id="idcard" name="idcard" required/>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="xuigai()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
 
 <c:if test="${userSession!=null}">
 <script>
 jQuery.ajax({
		type:"post",//请求类型
		url:"${pageContext.request.contextPath }/buyticket/query",//请求的url
		data:{},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var buyticket = "<tr role=\"row\" id=\"listbuyModal-table\">"+jQuery("#listbuyModal-table").html()+"<tr>";
			var check=null;
			if(data.buyticketList.length>0){
			for(var i = 0; i < data.buyticketList.length; i++){
				if(data.buyticketList[i].check==0){
					check="未审核"
				}else if(data.buyticketList[i].check==1){
					check="审核通过"
				}else{
					check="审核失败"
				}
				buyticket += "<tr><td>"+(i+1)+"</td><td>"+data.buyticketList[i].sid+"</td><td>"+data.buyticketList[i].num+"</td><td>"+data.buyticketList[i].price+"</td><td>"+check+"</td><td><a class='btn btn-default' href='${pageContext.request.contextPath }/buyticket/del/"+data.buyticketList[i].id+"'>删除</a></td></tr>";
			}
			}
			jQuery("#dataTables-example thead").html(buyticket);
		}});
 </script>
 </c:if>
 <script>	
 function update(id){
		//ajax请求通过id查询单个部门对象的JSON格式，给文本框赋值
		jQuery.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/userold/modify?uid="+id,
			dataType:"json",
			success:function(data){
				jQuery("#updateModal #id").val(data.id);
				jQuery("#updateModal #phone").val(data.phone);
				if(data.sex==0){
					jQuery("#updateModal #sex").html("<option value=\"0\" selected>男</option><option value=\"1\">女</option>");}
				else{
					jQuery("#updateModal #sex").html("<option value=\"0\" >男</option><option value=\"1\" selected>女</option>");
				}
				jQuery("#updateModal #name").val(data.name);
				jQuery("#updateModal #password0").val(data.password);
				jQuery("#updateModal #idcard").val(data.idcard);
			}
		});
		
 }

 function xuigai(){
	 if(jQuery("#updateModal #name").val()=='' || jQuery("#updateModal #name").val()==""){
		 alert("用户姓名不能为空！");
			return ;
	 }
	 if(jQuery("#updateModal #phone").val()=='' || jQuery("#updateModal #phone").val()==""){
		 alert("用户电话不能为空！");
			return ;
	 }
	 if(jQuery("#updateModal #phone").val().length!=11){
		 alert("用户电话格式错误！");
			return ;
	 }
	 if(jQuery("#updateModal #idcard").val()=='' || jQuery("#updateModal #idcard").val()==""){
		 alert("用户身份证不能为空！");
			return ;
	 }
	 if(jQuery("#updateModal #idcard").val().length!=18){
		 alert("用户身份证格式错误！");
			return ;
	 }
		if(jQuery("#updateModal #password").val()!=null && jQuery("#updateModal #password").val()!=""){
			if(jQuery("#updateModal #password").val()!=jQuery("#updateModal #password0").val()){
				alert("原始密码错误！");
				return ;
			}
			if(jQuery("#updateModal #password1").val()!=jQuery("#updateModal #password2").val()){
				alert("新密码与确认密码不一致！");
				return ;
			}
		}else if(jQuery("#updateModal #password1").val()!=null && jQuery("#updateModal #password1").val()!=""){
			alert(jQuery("#updateModal #password1").val());
			alert("请先输入原始密码！");
			return ;
		}
			if(confirm("是否确认要提交数据？")){
				jQuery("#userForm").submit();
			}
 }
 function zhuce(){
	 if(jQuery("#addModal #addname").val()=='' || jQuery("#addModal #addname").val()==""){
		 alert("用户姓名不能为空！");
			return ;
	 }
	 if(jQuery("#addModal #addphone").val()=='' || jQuery("#addModal #addphone").val()==""){
		 alert("用户电话不能为空！");
			return ;
	 }
	 if(jQuery("#addModal #addphone").val().length!=11){
		 alert("用户电话格式错误！");
			return ;
	 }
	 if(jQuery("#addModal #addpassword1").val()=='' || jQuery("#addModal #addpassword1").val()==""){
		 alert("用户密码不能为空！");
			return ;
	 }
	 if(jQuery("#addModal #addidcard").val()=='' || jQuery("#addModal #addidcard").val()==""){
		 alert("用户身份证不能为空！");
			return ;
	 }
	 if(jQuery("#addModal #addidcard").val().length!=18){
		 alert("用户身份证格式错误！");
			return ;
	 }
	 if(jQuery("#addModal #addpassword1").val()!=jQuery("#addModal #addpassword2").val()){
			alert("新密码与确认密码不一致！");
			return ;
	 }
	 alert(addflge);
	 if(addflge){
		if(confirm("是否确认要提交数据？")){
			jQuery("#addForm").submit();
		}
	}
 }
 var addflge=true;
 jQuery("#username").bind("blur",function(){
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		$.ajax({
			type:"GET",//请求类型
			url:"${pageContext.request.contextPath }/userold/ucexist",//请求的url
			data:{goodsname:jQuery("#username").val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.productName == "exist"){//账号已存在，错误提示
					jQuery("#username").next().html("该用户账号已存在或为空").css("color","red");
					addflge=false;
				}else{//账号可用，正确提示
					jQuery("#username").next().html("该账号可以使用").css("color","green");
					addflge=true;
					}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				jQuery("#username").next().html("您访问的页面不存在").css("color","red");
				addflge=false;
			}
		});
		
	}).bind("focus",function(){
		//显示友情提示
		jQuery("#username").next().html("* 账号是您登录系统的账号").css("color","#666666");
	}).focus();
</script>
<!---->