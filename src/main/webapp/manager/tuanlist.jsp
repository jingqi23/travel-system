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
                        当前位置:组团管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/tuan/query1" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>名称:<input type="search" class="form-control input-sm-8"
                                                             aria-controls="dataTables-example" name="queryTuanName" value="${queryTuanName }">
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
                                            style="width: 50px;">序号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 226px;">标题
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 50px;">人数
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 300px;">内容
                                        </th>
                                         <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 100px;">时间
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 150px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="tuan" items="${tuanList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                        <td class=" ">${tuan.name }</td>
                                        <td class=" ">${tuan.nums }</td>
                                        <td class=" ">${tuan.content }</td>
                                        <td class=" ">${tuan.time }</td>
                                        <td class="center ">
                                            <button type="button" class="btn btn-info" onclick="updatebyid(${tuan.id})" data-toggle="modal" data-target="#updateModal"><span
                                                    class="glyphicon glyphicon-edit"></span> 修改
                                            </button>
                                            <button type="button" onclick="doDel(${tuan.id})" class="btn btn-danger"><span
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
                <h4 class="modal-title" id="myModalLabel">组团增加</h4>
            </div>
            <form role="form" id="addform" class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/tuan/add">
            	<input type="hidden" name="uid" value="${sessionScope.userHouSession.id }"/>
            	<div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">组团标题:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" id="addname" name="name"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">人数:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" type="number" id="addnums" name="nums"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">时间:</label>
                        <div class="col-sm-8">
                       	<input type="date" class="form-control" id="addtime" name="time"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                  
                    <div class="form-group">
                        <label class="col-sm-2 control-label">介绍:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="addcontent" name="content"></textarea>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片:</label>
                        <div class="col-sm-8">
                       	<input type="file"  id="addpic" name="pic"/>
                       	<span>图片只支持jpg、gif、png格式</span>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
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
		 alert("组团标题不能为空！");
			return false;
	 }
	if($("#addnums").val()==''){
		 alert("组团人数不能为空！");
			return false;
	 }
	 if($("#addtime").val()=='' || $("#addtime").val()==""){
		 alert("时间不能为空！");
			return false;
	 }
	
	 if($("#addcontent").val()=='' || $("#addcontent").val()==""){
		 alert("简介不能为空！");
			return false;
	 }
	
	 if($("#addpic").val()=='' || $("#addpic").val()==""){
		 alert("图片不能为空！");
			return false;
	 }
	 var type=$("#addpic").val().substring($("#addpic").val().lastIndexOf(".")).toLowerCase() ;
	if(type!=".jpg" && type!=".gif" && type!=".png"){
		alert("图片格式不正确！");
		return false;
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
                <h4 class="modal-title" id="updateModalLabel">组团修改</h4>
            </div>
            <form role="form" id="updateform" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/tuan/modifyexe">
                <input type="hidden" name="id" id="updateid"/>

                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">组团标题:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" id="updatename" name="name"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">人数:</label>
                		<div class="col-sm-8">
                    	<input class="form-control" type="number" id="updatenums" name="nums"/>
                		</div>
                		<span class="col-sm-1" style="color: red;">*</span>
            		</div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">时间:</label>
                        <div class="col-sm-8">
                       	<input type="date" class="form-control" id="updatetime" name="time"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                  
                    <div class="form-group">
                        <label class="col-sm-2 control-label">介绍:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="updatecontent" name="content"></textarea>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                  
                    <input type="hidden" id="updatepic" name="pic"/>	
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
		 alert("组团标题不能为空！");
			return false;
	 }
	if($("#updatenums").val()==''){
		 alert("组团人数不能为空！");
			return false;
	 }
	 if($("#updatetime").val()=='' || $("#updatetime").val()==""){
		 alert("时间不能为空！");
			return false;
	 }
	
	 if($("#updatecontent").val()=='' || $("#updatecontent").val()==""){
		 alert("简介不能为空！");
			return false;
	 }

	if(confirm("是否确认要提交数据？")){
		$("#updateform").submit();
	}
}
function updatebyid(id){
$.ajax({
	type:"post",//请求类型
	url:"${pageContext.request.contextPath }/tuan/modify",//请求的url
	data:{id:id},//请求参数
	dataType:"json",//ajax接口（请求url）返回的数据类型
	success:function(data){//data：返回数据（json对象）
		$("#updatename").val(data.name);
		$("#updatecontent").val(data.content);
		$("#updateid").val(data.id);
		$("#updatetime").val(data.time);
		$("#updatenums").val(data.nums);
		$("#updatepic").val(data.pic);

	}});
}
function doDel(id){
	 if(confirm("是否删除?")){
	 	location.href="${pageContext.request.contextPath }/tuan/del/"+id;
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