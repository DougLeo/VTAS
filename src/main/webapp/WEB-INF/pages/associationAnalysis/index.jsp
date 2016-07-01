<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>关联分析主页</title>
<jsp:include page="/WEB-INF/pages/commons/common.jsp" />
<style>
a, a:hover, a:visited, a:link, a:active{
	color:inherit;
	text-decoration: none;
}
</style>
</head>
<body class="easyui-layout">
	<!-- 顶部工具按钮 -->
	<div data-options="region:'north',border:false">
		<div class="easyui-panel" data-options="border:false" style="padding:5px;">
			<a id="serchBtn" href="javascript:;" class="easyui-linkbutton" data-options="name:'search',iconCls:'icon-search',plain:true">关联分析查询</a>
		</div>
	</div>
	<!-- 正中央内容，分左右 -->
	<div data-options="region:'center',border:false">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',border:false" style="width: 45%">
				<!-- <div class="easyui-panel" data-options="title:'关联分析条件',border:false,fit:true" style="padding:5px;">
					<table id="assotiationContidion"></table>
				</div>
				<div class="easyui-panel" data-options="border:false,fit:true" >
					<table id="assotiationResult"></table>
				</div> -->
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',border:false" style="height: 20%">
						<table id="assotiationContidion"></table>
					</div>
					<div data-options="region:'center',border:false">
						<table id="assotiationResult"></table>
					</div>
				</div>
			</div>
			<div data-options="region:'center',border:false">
				<table id="assotiationDetails"></table>
			</div>
		</div>
	</div>
	<!-- 查询条件form -->
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
							</tr>
							<tr>
								<td>
									<label>查询开始时间</label>
								</td>
								<td>
									<input class="easyui-datetimebox" name="bDatetime" data-options="required:true,editable:false">
								</td>
							</tr>
							<tr>
								<td>
									<label>查询截止时间</label>
								</td>
								<td>
									<input class="easyui-datetimebox" name="eDatetime" data-options="required:true,editable:false">
								</td>
							</tr>
							<tr>
								<td>
									<label>最小关联次数(次)</label>
								</td>
								<td>
									<input class="easyui-numberbox" name="minAssotiationCounts" data-options="required:true">
								</td>
							</tr>
							<tr>
								<td>
									<label>最大关联时长(分钟)</label>
								</td>
								<td>
									<input class="easyui-numberbox easyui-validatebox" name="maxAssotiationMinutes" data-options="required:true">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div><!-- window center end -->
			<div data-options="region:'south',border:false" style="text-align:center;padding:5px;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" href="javascript:void(0)" onclick="javascript:doAssotiation();" style="width:80px">查询</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-undo'" href="javascript:void(0)" onclick="javascript:resetForm('searchConditionsForm')" style="width:80px">重置</a>
            </div>
		</div>
	</div><!-- 查询条件form end -->
	<!-- 轨迹重构窗口 -->
	<div id="reconstuctionWin" class="easyui-window" data-options="modal:true,closed:true,iconCls:'icon-redo',title:'轨迹重构',collapsible:false,
		maximizable:true,minimizable:false" style="height: 70%;width: 60%;overflow-y: auto;">
			<table id="carbasicInfoPropertyGrid" style="height:180px;"></table> 
			<table id="reconstructionResult"></table>
		<!-- <div class="easyui-layout">
			车辆基本信息 
			<div data-options="region:'north',border:false,title:'车辆基本信息',collapsible:false,fit:true" style="height: 180px;padding:5px;">
			</div> 
			轨迹重构结果 
			<div data-options="region:'center',border:false" style="margin-top:5px;">
			</div>
		</div> -->
	</div>
	<!-- 轨迹重构窗口  end -->
	<div style="display:none;">
		<form id="reconstructForm" method="post">
			<input name="carNo">
			<input name="searchDate">
			<input name="btime">
			<input name="etime">
		</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/trajectoryReconstruction/reconstruction.ui.js"></script>
	<script type="text/javascript">
		function doReconstructed(){//关联车辆重构查询
			$('#reconstructForm').form('submit',{
				url:'',
				success:function(data){
					//显示重构结果
					$('#reconstructionResult').datagrid('loadData',temp.reconstructionResult);
					//显示车辆基本信息
					$('#carbasicInfoPropertyGrid').propertygrid('loadData',temp.carInfos);
					//重置查询表单
					resetForm('reconstructForm');
				}
			}); 
			$('#reconstuctionWin').window('open');
			return false;
		}
		function doAssotiation(){//关联查询
			$('#searchConditionsForm').form('submit',{
				url:'',
				onSubmit:function(){
					var isValid = $(this).form('validate');
					return isValid;
				},
				success:function(data){
					//显示查询条件
					$('#assotiationContidion').propertygrid('loadData',{
						"total":4,
						"rows":[
						     {
						    	 'name':'车牌号',
						    	 'value':$('#searchConditionsForm [name="carNo"]').val()
						     },{
						    	 'name':'查询起止时间',
						    	 'value':$('[name="bDatetime"]').val()+'~'+$('[name="eDatetime"]').val()
						     },{
						    	 'name':'最小关联次数(次)',
						    	 'value':$('[name="minAssotiationCounts"]').val()
						     },{
						    	 'name':'最长关联时长(分钟)',
						    	 'value':$('[name="maxAssotiationMinutes"]').val()
						     },
						 ]
					});
					//显示关联分析结果 assotiationResults
					//$('#assotiationResult').datagrid('loadData',[]);
					$('#assotiationResult').datagrid('clearSelections').datagrid('loadData',temp.assotiationResults);
					//清空关联详情
					$('#assotiationDetails').datagrid('loadData',[]);
					//关闭查询窗口
					$('#searchWin').window('close');
					//清空查询条件
					resetForm('searchConditionsForm');
				}
			});
		}
		$(function(){
			$('#assotiationContidion').propertygrid({
				showHeader : false,
				title:'关联分析条件',
				data:{
					total:4,
					rows :[
						{
							name:'车牌号',
							value:''
						},{
							name:'查询起止时间',
							value:''
						},{
							name:'最小关联次数(次)',
							value:''
						},{
							name:'最长关联时长(分钟)',
							value:''
						},
					]
				}
			});
			$('#assotiationResult').datagrid({
				title : '关联分析结果',
				idField : 'assotiationCarNo',
				nowrap: true,//是否只显示一行，即文本过多是否省略部分。
	    		singleSelect:true, //多选 
	    		fitColumns: true,
	    		fit:true,
	    		striped: true,
	    		rownumbers:true,
	    		columns : [[
					{
						 field:'assotiationCarNo',
						 title:'关联车牌号',
						 align:'center',
						 width:'30%'
					},{
						 field:'assotiationCounts',
						 title:'关联次数',
						 align:'center'
					},{
						 field:'operation',
						 title:'操作',
						 align:'center',
						 width:'40%',
						 formatter:function(){
						     var btn = [
						           "<a href='javascript:;' ",
						           "class='l-btn l-btn-small l-btn-plain' " ,
						           "onClick='javascript:doReconstructed();' ",
						           ">",
							           "<span class='l-btn-left l-btn-icon-left'>",
							           		"<span class='l-btn-text'>轨迹重构</span>",
							           		"<span class='l-btn-icon icon-search'>&nbsp;</span>",
							           "</span>",
						           "</a>"
						     ].join('');
						     return btn;
						 }
					}
	    		]],
	    		onClickRow : function(index,row){
	    			$('#assotiationDetails').datagrid('loadData',temp['assotiationDetails'+index]);
	    		}
			});
			$('#assotiationDetails').datagrid({
				title : '关联详情',
				nowrap: true,//是否只显示一行，即文本过多是否省略部分。
	    		singleSelect:true, //多选 
	    		fitColumns: true,
	    		fit:true,
	    		striped: true,
	    		rownumbers:true,
	    		columns : [[
					{
						 field:'intersection',
						 title:'卡口',
						 align:'center',
						 width:'25%'
					},{
						 field:'queryCarTime',
						 title:'查询车牌号经过时间',
						 align:'center',
						 width:'35%'
					},{
						 field:'assotiationCarTime',
						 title:'被关联车牌号经过时间',
						 align:'center',
						 width:'35%'
					}
	    		]]
			});
			$('#serchBtn').click(function(){
				$('#searchWin').window('open');
			});
		});
	</script>
</body>
</html>