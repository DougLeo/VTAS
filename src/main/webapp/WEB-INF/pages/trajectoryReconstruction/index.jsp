<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>轨迹重构</title>
<jsp:include page="/WEB-INF/pages/commons/common.jsp" />
</head>
<body class="easyui-layout">
	
	<div data-options="region:'north',border:false">
		<div class="easyui-panel" data-options="border:false" style="padding:5px;">
			<a id="serchBtn" href="javascript:;" class="easyui-linkbutton" data-options="name:'search',iconCls:'icon-search',plain:true">车辆轨迹查询</a>
		</div>
	</div>
	<div data-options="region:'center',border:false">
		<div class="easyui-layout" data-options="fit:true">
			<!-- 车辆基本信息 -->
			<div data-options="region:'north',border:true,title:'车辆基本信息',collapsible:false" style="height: 32%;padding:5px;">
					<table id="carbasicInfoPropertyGrid" style="width: 500px;"></table>
				<!-- <div class="easyui-panel" data-options="title:'车辆基本信息',border:true,fit:true" style="padding:5px;">
				</div> -->
			</div>
			<!-- 轨迹重构结果 -->
			<div data-options="region:'center',border:false" style="margin-top:5px;">
				<table id="reconstructionResult"></table>
			</div>
		</div>
	</div>
	
	<div id="searchWin" class="easyui-window" data-options="modal:true,closed:true,iconCls:'icon-search',title:'轨迹重构查询',collapsible:false,
		maximizable:false,minimizable:false" style="width: 465px;height: 280px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="searchConditionsForm" method="post">
					<table>
						<tbody>
							<tr>
								<td>
									<label>车牌号</label>
								</td>
								<td>
									<input class="easyui-textbox easyui-validatebox" name="carNo" data-options="required:true">
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<label>查询日期</label>
								</td>
								<td>
									<input class="easyui-datebox" name="searchDate">
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<label>时间段</label>
								</td>
								<td>
									<input class="easyui-timespinner" name="btime">
								</td>
								<td>
									-
								</td>
								<td>
									<input class="easyui-timespinner" name="etime">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div><!-- window center end -->
			<div data-options="region:'south',border:false" style="text-align:center;padding:5px;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" href="javascript:void(0)" onclick="javascript:submitQueryForm();" style="width:80px">查询</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-undo'" href="javascript:void(0)" onclick="javascript:resetForm('searchConditionsForm');" style="width:80px">重置</a>
            </div>
		</div>
		
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/trajectoryReconstruction/reconstruction.ui.js"></script>
	<script type="text/javascript">
		
		function submitQueryForm(){
			$('#searchConditionsForm').form('submit',{
				url:'',
				onSubmit:function(){
					var isValid = $(this).form('validate');
					return isValid;
				},
				success:function(data){
					//显示重构结果
					$('#reconstructionResult').datagrid('loadData',temp.reconstructionResult);
					//显示车辆基本信息
					$('#carbasicInfoPropertyGrid').propertygrid('loadData',temp.carInfos);
					//关闭查询窗口
					$('#searchWin').window('close');
					//重置查询表单
					resetForm('searchConditionsForm');
				}
			});
		}
		$(function(){
			$('#serchBtn').click(function(){
				$('#searchWin').window('open');
			});
			
			$('#carbasicInfoPropertyGrid').propertygrid({
				showHeader : false,
				data:{
					rows :[
						{
							name:'车牌号',
							value:''
						},
						{
							name:'查询日期',
							value:''
						},{
							name:'查询时间段',
							value:''
						},{
							name:'车辆类型',
							value:''
						},{
							name:'车牌类型',
							value:''
						},{
							name:'车身颜色',
							value:''
						},{
							name:'车长(m)',
							value:''
						}
					]
				}
			});
		});
	</script>
</body>
</html>