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
                        当前位置:购票管理
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="${pageContext.request.contextPath }/buyticket/query1" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>预订类别:<select name="qqsid">
                                            <option value="">--全部--</option>
	                                            				<option <c:if test="${qqsid == '景点' }">selected="selected"</c:if>
					   											value="景点">--景点--</option>
					   											<option <c:if test="${qqsid == '酒店' }">selected="selected"</c:if>
					   											value="酒店">--酒店--</option>
					   											<option <c:if test="${qqsid == '娱乐'}">selected="selected"</c:if>
					   											value="娱乐">--娱乐--</option>
					   											<option <c:if test="${qqsid == '美食'}">selected="selected"</c:if>
					   											value="美食">--美食--</option>
                                            			</select>
                                                <input type="hidden" id="pageIndex"
                                                             name="pageIndex" >
                                                <button type="submit"  class="btn btn-default"><span
                                                        class="glyphicon glyphicon-search"></span> 搜索
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
                                            style="width: 150px;">申请人
                                        </th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 100px;">分类
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 230px;">预定地名称
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 100px;">数量
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 100px;">价钱
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 150px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="buyticket" items="${buyticketList }" varStatus="status">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${status.count }</td>
                                        <td class=" ">${buyticket.uname }</td>
                                        <td class=" ">${buyticket.fenlei }</td>
                                        <td class=" ">${buyticket.sid }</td>
                                        <td class="center ">${buyticket.num }</td>
                                        <td class=" ">${buyticket.price }</td>
                                        <td class="center ">
                                        <c:if test="${buyticket.check==0}">
                                            <button type="button" class="btn btn-info" onclick="updatebyid(${buyticket.id},1)"><span
                                                    class="glyphicon glyphicon-edit"></span> 通过
                                            </button>
                                            <button type="button" onclick="updatebyid(${buyticket.id},2)" class="btn btn-danger"><span
                                                    class="glyphicon glyphicon-trash"></span> 否决
                                            </button>
										</c:if>
										<c:if test="${buyticket.check==1}">
											<span style="color:#0F0">已通过</span>
										</c:if>
										<c:if test="${buyticket.check==2}">
											<span style="color:#F00">已否决</span>
										</c:if>
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
                                </form>
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

function updatebyid(id,check){
	 	location.href="${pageContext.request.contextPath }/buyticket/modify?id="+id+"&check="+check;
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