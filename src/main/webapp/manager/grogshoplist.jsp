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
                        当前位置:酒店管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/grogshop/query1" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>名称:<input type="search" class="form-control input-sm-8"
                                                             aria-controls="dataTables-example" name="querygrogshopName" value="${querygrogshopName }">
                                                <input type="hidden" id="pageIndex"
                                                             name="pageIndex" >
                                                <button type="submit"  class="btn btn-default"><span
                                                        class="glyphicon glyphicon-search"></span> 搜索
                                                </button>
                                              
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal">
                                                <span class="glyphicon glyphicon-plus"></span> 增加
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
                                            style="width: 90px;">序号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 226px;">名称
                                        </th>
                                         <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 226px;">价格
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 300px;">地址
                                        </th>
                                        
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 150px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="grogshop" items="${grogshopList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                        <td class=" ">${grogshop.name }</td>
                                        <td class=" ">${grogshop.price }元</td>
                                        <td class=" ">${grogshop.address }</td>
                                       <td class="center ">
                                            <button type="button" class="btn btn-info" onclick="updatebyid(${grogshop.id})" data-toggle="modal" data-target="#updateModal"><span
                                                    class="glyphicon glyphicon-edit"></span> 修改
                                            </button>
                                            <button type="button" onclick="doDel(${grogshop.id})" class="btn btn-danger"><span
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
                <h4 class="modal-title" id="myModalLabel">酒店增加</h4>
            </div>
            <form role="form" id="addform" class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/grogshop/add">
            	<div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">酒店名称:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" id="addname" name="name"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" type="number" step="0.1" id="addprice" name="price"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" id="addaddress" name="address"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    
                     <div class="form-group">
                        <label class="col-sm-2 control-label">坐标:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" id="addcoordinate" name="coordinate"/>
                        </div>
                        <span class="col-sm-2 text-center" style="color: red;">*<a class="col-sm " target="view_window" href="http://api.map.baidu.com/lbsapi/getpoint/index.html">点击获取坐标</a></span>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">酒店简介:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="addintro" name="intro"></textarea>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片1:</label>
                        <div class="col-sm-8">
                       	<input type="file"  id="addimg1" name="img"/>
                       	<span>图片只支持jpg、gif、png格式</span>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label">图片2:</label>
                        <div class="col-sm-9">
                       	<input type="file"  id="addimg2" name="img"/>
                       	<span>图片只支持jpg、gif、png格式</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片3:</label>
                        <div class="col-sm-9">
                       	<input type="file"  id="addimg3" name="img"/>
                       	<span>图片只支持jpg、gif、png格式</span>
                        </div>
                    </div>
            	</div>
            	 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="add()" class="btn btn-primary">保存</button>
                </div>
            
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
function add(){
	if($("#addname").val()=='' || $("#addname").val()==""){
		 alert("酒店名称不能为空！");
			return false;
	 }
	if($("#addprice").val()==''){
		 alert("酒店价格不能为空！");
			return false;
	 }
	 if($("#addaddress").val()=='' || $("#addaddress").val()==""){
		 alert("地址不能为空！");
			return false;
	 }
	 if($("#addcoordinate").val()==''){
		 alert("坐标不能为空！");
			return false;
	 }
	 if($("#addintro").val()=='' || $("#addintro").val()==""){
		 alert("酒店简介不能为空！");
			return false;
	 }
	 if($("#addimg1").val()=='' || $("#addimg1").val()==""){
		 alert("图片1不能为空！");
			return false;
	 }
	 var type=$("#addimg1").val().substring($("#addimg1").val().lastIndexOf(".")).toLowerCase() ;
	if(type!=".jpg" && type!=".gif" && type!=".png"){
		alert("图片1格式不正确！");
		return false;
	}
	if($("#addimg2").val()!=null && $("#addimg2").val()!=""){
		var type2=$("#addimg2").val().substring($("#addimg2").val().lastIndexOf("."));
	if(type2!=".jpg" && type2!=".gif" && type!=".png"){
			alert("图片2格式不正确！");
			return false;
	}
	}
	if($("#addimg3").val()!=null && $("#addimg3").val()!=""){
		 var type3=$("#addimg3").val().substring($("#addimg3").val().lastIndexOf("."));
		if(type3!=".jpg" && type3!=".gif" && type!=".png"){
				alert("图片2格式不正确！");
				return false;
	}
	}
	if(confirm("是否确认要提交数据？")){
		$("#addform").submit();
	}
}
</script>

<!--修改-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="updateModalLabel">酒店修改</h4>
            </div>
            <form role="form" id="updateform" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/grogshop/modifyexe">
                <input type="hidden" name="id" id="updateid"/>
                <div class="modal-body">
                
                    <div class="form-group">
                        <label class="col-sm-2 control-label">酒店名称:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" id="updatename" name="name"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" type="number" step="0.1" id="updateprice" name="price"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" id="updateaddress" name="address"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">坐标:</label>
                        <div class="col-sm-8">
                       	<input class="form-control" id="updatecoordinate" name="coordinate"/>
                        </div>
                        <span class="col-sm-2 text-center" style="color: red;">*<a class="col-sm " target="view_window" href="http://api.map.baidu.com/lbsapi/getpoint/index.html">点击获取坐标</a></span>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">酒店简介:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="updateintro" name="intro"></textarea>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="update()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
function update(){
	if($("#updatename").val()=='' || $("#updatename").val()==""){
		 alert("酒店名称不能为空！");
			return false;
	 }
	if($("#updateprice").val()==''){
		 alert("酒店价格不能为空！");
			return false;
	 }
	 if($("#updateaddress").val()=='' || $("#updateaddress").val()==""){
		 alert("地址不能为空！");
			return false;
	 }
	 if($("#updatecoordinate").val()==''){
		 alert("坐标不能为空！");
			return false;
	 }
	 if($("#updateintro").val()=='' || $("#updateintro").val()==""){
		 alert("酒店简介不能为空！");
			return false;
	 }
	if(confirm("是否确认要提交数据？")){
		$("#updateform").submit();
	}
}
function updatebyid(id){
$.ajax({
	type:"post",//请求类型
	url:"${pageContext.request.contextPath }/grogshop/modify",//请求的url
	data:{id:id},//请求参数
	dataType:"json",//ajax接口（请求url）返回的数据类型
	success:function(data){//data：返回数据（json对象）
		$("#updatename").val(data.name);
		$("#updateintro").val(data.intro);
		$("#updateid").val(data.id);
		$("#updateaddress").val(data.address);
		$("#updateprice").val(data.price);
		$("#updatecoordinate").val(data.coordinate);
	}});
}
function doDel(id){
	 if(confirm("是否删除?")){
	 	location.href="${pageContext.request.contextPath }/grogshop/del/"+id;
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