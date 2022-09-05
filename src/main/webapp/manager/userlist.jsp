<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="head.jsp"%>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        当前位置:会员管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/userold/query" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>名称:<input type="search" class="form-control input-sm-8"
                                                             aria-controls="dataTables-example" name="queryname" value="${queryname }">
                                                         	身份:<select name="queryUserRole">
                                            			<option value="-1">--请选择--</option>
	                                            			
	                                            				<option <c:if test="${queryUserRole== 0 }">selected="selected"</c:if>
					   											value="0">管理员</option>
					   											<option <c:if test="${queryUserRole== 1 }">selected="selected"</c:if>
					   											value="1">用户</option>
					   											
	                                            			
                                            			</select>
                                                <input type="hidden" id="pageIndex"
                                                             name="pageIndex" >
                                                <button type="submit"  class="btn btn-default"><span
                                                        class="glyphicon glyphicon-search"></span> 搜索
                                                </button>
                                              
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal">
                                                <span class="glyphicon glyphicon-plus"></span> 增加管理
                                                </button>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                 </form>
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example"
                                            rowspan="1" colspan="1" aria-sort="ascending"
                                            aria-label="Rendering engine: activate to sort column ascending"
                                            style="width: 50px;">序号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 120px;">账号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 80px;">姓名
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 120px;">电话
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 80px;">性别
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 200px;">身份证
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 80px;">身份
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 80px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${userList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                        <td class=" ">${user.username }</td>
                                        <td class=" ">${user.name }</td>
                                        <td class="center ">${user.phone }</td>
                                         <td class=" ">
                                         <c:if test="${user.sex==0 }">男</c:if>
                                         <c:if test="${user.sex==1 }">女</c:if>
                                         </td>
                                        <td class="center ">${user.idcard }</td>
                                         <td class=" ">
                                         <c:if test="${user.role==0 }">管理员</c:if>
                                         <c:if test="${user.role==1 }">用户</c:if>
                                         </td>
                                        <td class="center ">
                                            <button type="button" onclick="doDel(${user.id})" class="btn btn-danger"><span
                                                    class="glyphicon glyphicon-trash"></span> 删除
                                            </button>
										
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <div class="dataTables_paginate paging_simple_numbers"
                                             id="dataTables-example_paginate">
                                            <ul class="pagination">
                                                <li class="paginate_button previous"
                                                    aria-controls="dataTables-example" tabindex="0"
                                                    id="dataTables-example_previous" onclick="fenye(document.forms[1],${currentPageNo-1 })"><a >上一页</a></li>

                                                <li class="paginate_button next" aria-controls="dataTables-example"
                                                    tabindex="0" id="dataTables-example_next" onclick="fenye(document.forms[1],${currentPageNo+1 })"><a >下一页</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<script type="text/javascript">
function fenye(frm,num){
	if(num<1){
		num=1;
	}
	if(num>${totalPageCount}){
		num=${totalPageCount};
	}
		frm.pageIndex.value = num;
		frm.submit();
}
</script>

<!--增加-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">增加管理</h4>
            </div>
            <form role="form" class="form-horizontal" id="addForm"  method="post" action="${pageContext.request.contextPath }/userold/add2">
                <input type="hidden" name="role" value="0"/>
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
                    <button type="button" onclick="zhuce()" class="btn btn-primary">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
function zhuce(){
	 if(jQuery("#addModal #addname").val()=='' || jQuery("#addModal #addname").val()==""){
		 alert("用户姓名不能为空！");
			return ;
	 }
	 if(jQuery("#addModal #addphone").val()=='' || jQuery("#addModal #addphone").val()==""){
		 alert("用户电话不能为空！");
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
	 if(jQuery("#addModal #addpassword1").val()!=jQuery("#addModal #addpassword2").val()){
			alert("新密码与确认密码不一致！");
			return ;
	 }
	 //alert(addflge);
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

function doDel(id){
	 if(confirm("是否删除?")){
	 	location.href="${pageContext.request.contextPath }/userold/del/"+id;
	 }
}
</script>


<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="${pageContext.request.contextPath }/manager/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath }/manager/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="${pageContext.request.contextPath }/manager/assets/js/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath }/manager/assets/js/custom-scripts.js"></script>

</body>

</html>