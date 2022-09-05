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
                        当前位置:景点流量统计
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <form action="" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>开始时间:<input type="text" class="form-control input-sm-8"
                                                             name="starttime" id="starttime" onclick="new WdatePicker()">
                                                             ~
                                                   	结束时间:<input type="text" class="form-control input-sm-8"
                                                             name="endtime" id="endtime" onclick="new WdatePicker()">        
                                               
                                                <button type="button" onclick="find()" class="btn btn-default"><span
                                                        class="glyphicon glyphicon-search"></span> 查询
                                                </button>
                                              
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                 </form>
                                <div id="main" style="width: 800px;height:450px;"></div>
                                
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
<script src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

<script type="text/javascript">
var myChart;
var option;
$(function(){
	myChart = echarts.init(document.getElementById('main'));

	// 指定图表的配置项和数据
	 option={
	    title: {
	        text: '各景点客流量统计'
	    },
	    tooltip: {},
	    legend: {
	        data:['流量']
	    },
	    xAxis: {
	        data: []
	    },
	    yAxis: {},
	    series: [{
	        name: '流量',
	        type: 'bar',
	        data: []
	    }]
	};

		
});
//基于准备好的dom，初始化echarts实例

function find(){
	// 使用刚指定的配置项和数据显示图表。
	$.getJSON("${pageContext.request.contextPath }/buyticket/query_b",{"starttime":$("#starttime").val(),"endtime":$("#endtime").val()},
			function(data){
		option.xAxis.data.length=0;
		option.series[0].data.length=0;
		for(i=0;i<data.length;i++){
			var o=data[i];
			option.xAxis.data.push(o.sid);
			option.series[0].data.push(o.snum);
		}
		myChart.setOption(option);
	});
	
}
</script>

</body>

</html>