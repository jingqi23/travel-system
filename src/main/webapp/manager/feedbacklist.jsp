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
                        当前位置:评论管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/feedback/query" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                                <input type="hidden" id="pageIndex"
                                                             name="pageIndex" >
                             
                                          
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
                                            style="width: 200px;">发布人
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 400px;">内容
                                        </th>

                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 150px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="feedback" items="${feedbackList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                       <td class=" ">${feedback.user.name }</td>
                                        <td class=" ">${feedback.fback }</td>
                                        <td class="center ">
                                            
                                            <button type="button" onclick="doDel(${feedback.id})" class="btn btn-danger"><span
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

function doDel(id){
	 if(confirm("是否删除?")){
	 	location.href="${pageContext.request.contextPath }/feedback/del/"+id;
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