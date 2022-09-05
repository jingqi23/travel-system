<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="vtop.jsp"%>
<!---->
<div class="about">
	 <div class="container">
		 <h2>线路详情</h2>
		 
		 <div class="about-grids">
		 	<div class="col-md-6 about-pic">
				 <img src="images/${xianlu.img1 }" class="img-responsive" alt=""/>
			 </div>
			 <div class="col-md-6 about-list">
				 <div class="about-top-sec">
				 	<h3>${xianlu.name }</h3>
					<h4>价格：${xianlu.price }元</h4>
					<h4>余票：<span id="tnum">${xianlu.tnum}</span></h4>
					<c:if test="${userSession!=null}">
					 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addscenModal">预订</button>
			 		</c:if>
			 	</div>	
			 </div>
			 
			 <div class="clearfix"></div>
		 </div>	
		 <div class="about-top-sec">
			<h3>简介：</h3>
			<h4>${xianlu.intro }</h4>	
					 
		</div>		 
	 </div>
</div>

<%--
门票预定
--%><div class="modal fade" id="addscenModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">线路预订</h4>
            </div>
            <form role="form" class="form-horizontal" id="addscenform"  method="post" action="${pageContext.request.contextPath }/buyticket/add">
                <div class="modal-body">
                	<div class="form-group">
                        <label class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="num" name="num" type="number" required/>
                            <span></span>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="col-sm-2 control-label">总价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="price" name="price" required readonly/>
                        </div>
                    </div>  
 					<input type="hidden" class="form-control" name="sid" value="${xianlu.name }" required/>
 					<input type="hidden" class="form-control" name="fenlei" value="线路" required/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="yuding()" class="btn btn-primary">预订</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
jQuery("#num").bind("blur",function(){
	var num=parseInt(jQuery("#num").val());
	if(!isNaN(num))
	jQuery("#price").val(num*${xianlu.price });
}).focus();

function yuding(){
	 if(jQuery("#addscenModal #num").val()=='' || jQuery("#addscenModal #addname").val()=="" || parseInt(jQuery("#addscenModal #num").val())<0){
		 	alert("预定数量不能为空，不能小于0！");
			return false;
	 }
	 var num=parseInt(jQuery("#num").val());
	 var tnum=parseInt(jQuery("#tnum").html());
	 if(num>tnum){
		 alert("余票不足！");
			return false;
	 }
	if(confirm("是否确认要提交数据？")){
		jQuery("#addscenform").submit();
		 alert("总价为："+jQuery("#price").val()+"元");
	}
}
</script>


 <%@include file="footer.jsp"%>