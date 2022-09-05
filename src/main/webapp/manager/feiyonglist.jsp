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
                        当前位置:费用管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/feiyong/query1" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                              
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
                                            style="width: 326px;">费用项目
                                        </th>
                                        
                                         <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">时间
                                        </th>
                                       
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">费用
                                        </th>
                                        
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 150px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="feiyong" items="${feiyongList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                        <td class=" ">${feiyong.content }</td>
                                        <td class=" ">${feiyong.ftime}</td>
                                        <td class="center ">${feiyong.feiyong }元</td>
                                        <td class="center ">
                                            <button type="button" class="btn btn-info" onclick="updatebyid(${feiyong.id})" data-toggle="modal" data-target="#updateModal"><span
                                                    class="glyphicon glyphicon-edit"></span> 修改
                                            </button>
                                            <button type="button" onclick="doDel(${feiyong.id})" class="btn btn-danger"><span
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
                                            <h3>总费用：${total }元</h3>
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
                <h4 class="modal-title" id="myModalLabel">线路增加</h4>
            </div>
            <form role="form" id="addform" class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/feiyong/add">
            	<div class="modal-body">
                   <div class="form-group">
                        <label class="col-sm-2 control-label">费用:</label>
                        <div class="col-sm-8">
                         <input class="form-control" id="addfeiyong" name="feiyong"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">费用项目:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="addcontent" name="content"></textarea>
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
function priceReg (value){
	value = value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
		value = value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
    value = value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");//去掉特殊符号￥
	if(value.indexOf(".")>0){
		value = value.substring(0,value.indexOf(".")+3);
	}
	return value;
}
function add(){
	
	 if($("#addfeiyong").val()=='' || $("#addfeiyong").val()==""){
		 alert("费用不能为空！");
			return false;
	 }
	 if(isNaN($("#addfeiyong").val())){
		 alert("费用格式不正确！");
			return false;
	 }
	
	 if($("#addcontent").val()=='' || $("#addcontent").val()==""){
		 alert("费用项目不能为空！");
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
                <h4 class="modal-title" id="updateModalLabel">线路修改</h4>
            </div>
            <form role="form" id="updateform" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/feiyong/modifyexe">
                <input type="hidden" name="id" id="updateid"/>
                <div class="modal-body">
                
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">费用:</label>
                        <div class="col-sm-8">
                         <input class="form-control" id="updatefeiyong" name="feiyong"/>
                        </div>
                        <span class="col-sm-1" style="color: red;">*</span>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">费用项目:</label>
                        <div class="col-sm-8">	
                       	<textarea class="form-control" rows="3" id="updatecontent" name="content"></textarea>
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
	
	 if($("#updatefeiyong").val()=='' || $("#updatefeiyong").val()==""){
		 alert("费用不能为空！");
			return false;
	 }
	
	 if(isNaN($("#addfeiyong").val())){
		 alert("费用格式不正确！");
			return false;
	 }
	 if($("#updatecontent").val()=='' || $("#updatecontent").val()==""){
		 alert("费用项目不能为空！");
			return false;
	 }
	if(confirm("是否确认要提交数据？")){
		$("#updateform").submit();
	}
}
function updatebyid(id){
$.ajax({
	type:"post",//请求类型
	url:"${pageContext.request.contextPath }/feiyong/modify",//请求的url
	data:{id:id},//请求参数
	dataType:"json",//ajax接口（请求url）返回的数据类型
	success:function(data){//data：返回数据（json对象）
		$("#updatecontent").val(data.content);
		$("#updateid").val(data.id);
		
		$("#updatefeiyong").val(data.feiyong);
		
	
	}});
}
function doDel(id){
	 if(confirm("是否删除?")){
	 	location.href="${pageContext.request.contextPath }/feiyong/del/"+id;
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