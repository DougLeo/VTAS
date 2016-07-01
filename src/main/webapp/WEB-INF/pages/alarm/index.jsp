<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>到位告警</title>
<jsp:include page="/WEB-INF/pages/commons/common.jsp" />
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<table id="alarmDatagrid"></table>
	</div>
	<div id="alarmDetailsWin" class="easyui-window" 
	data-options="modal:true,closed:true,iconCls:'icon-tip',collapsible:false,maximizable:false,minimizable:false,title:'告警详情'" 
	style="width: 400px;height: 200px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="alarmDetailsForm">
					<table>
						<tbody>
							<tr>
								<td>
									<label>车牌号</label>
								</td>
								<td>
									<input class="easyui-textbox" name="carNo" data-options="readonly:true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label>告警时间</label>
								</td>
								<td>
									<input class="easyui-textbox" name="alarmTime" data-options="readonly:true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label>卡口号</label>
								</td>
								<td>
									<input class="easyui-textbox" name="intersection" data-options="readonly:true"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>			
			</div>
			<div data-options="region:'south',border:false" style="text-align:center;padding:5px;">
	            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:;" onclick="javascript:readedAlarm();" style="width:80px">已阅</a>
	            <a class="easyui-linkbutton" data-options="iconCls:'icon-no'" href="javascript:;" onclick="javascript:cancelWin();" style="width:80px">取消</a>
	        </div>
		</div>
	</div>
	<input id="rowIndex" type="hidden">
	<script>
	function alarmDetails(rowIndex){
		
		$('#alarmDetailsWin').window('open');
		var row = $('#alarmDatagrid').datagrid('selectRow',rowIndex).datagrid('getSelected');
		$('#alarmDetailsForm').form('load',row);
		$('#rowIndex').val(rowIndex);
		return false;
	}
	function readedAlarm(){
		$('#alarmDatagrid').datagrid('updateRow',{
			index:$('#rowIndex').val(),
			row: {
				status : '已处理'
			}
		});
		$('#alarmDetailsWin').window('close');
	}
	function cancelWin(){
		$('#alarmDetailsWin').window('close');
	}
	$(function(){
		$('#alarmDatagrid').datagrid({
			title : '到位告警',
			idField : 'carNo',
			nowrap: true,//是否只显示一行，即文本过多是否省略部分。
    		singleSelect:true, //多选 
    		fitColumns: true,
    		fit:true,
    		striped: true,
    		rownumbers:true,
    		columns : [[
				{
					 field:'carNo',
					 title:'车牌号',
					 align:'center'
				},{
					 field:'alarmTime',
					 title:'告警时间',
					 align:'center'
				},{
					 field:'intersection',
					 title:'卡口号',
					 align:'center'
				},{
					 field:'status',
					 title:'状态',
					 align:'center',
					 formatter : function(value,rowData,rowIndex){
						 var status='';
						 switch (value) {
							case 0:
								status = '<span style="color:red;">未处理</span>';
								break;

						default:
							status = '已处理';
							break;
						}
						 return status;
					 }
				},{
					 field:'operation',
					 title:'操作',
					 align:'center',
					 formatter:function(value,rowData,rowIndex){
					     var btn = [
					           "<a href='javascript:;' ",
					           "class='l-btn l-btn-small l-btn-plain' " ,
					           "onClick='javascript:alarmDetails("+rowIndex+");' ",
					           ">",
						           "<span class='l-btn-left l-btn-icon-left'>",
						           		"<span class='l-btn-text'>告警详情</span>",
						           		"<span class='l-btn-icon icon-tip'>&nbsp;</span>",
						           "</span>",
					           "</a>"
					     ].join('');
					     return btn;
					 }
				}
    		]]
		});
		$('#alarmDatagrid').datagrid('loadData',temp.alarmDetails);
	});
	</script>
</body>
</html>