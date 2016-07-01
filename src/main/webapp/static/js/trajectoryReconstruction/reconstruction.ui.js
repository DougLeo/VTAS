/**
 * 轨迹重构UI组件
 */
$(function(){
	//初始化车辆基本信息属性表格
	$('#carbasicInfoPropertyGrid').propertygrid({
					showHeader : false,
					data:{
						total:7,
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
	//初始化车辆基本信息数据表格
	$('#carbasicInfoDatagrid').datagrid({
		title : '车辆基本信息',
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
		        	   field:'date',
		        	   title:'查询日期',
		        	   align:'center'
		           },{
		        	   field:'btime',
		        	   title:'开始时间',
		        	   align:'center'
		           },{
		        	   field:'etime',
		        	   title:'结束时间',
		        	   align:'center'
		           },{
		        	   field:'carType',
		        	   title:'车辆类型',
		        	   align:'center'
		           },{
		        	   field:'plateNumberType',
		        	   title:'车辆类型',
		        	   align:'center'
		           },{
		        	   field:'color',
		        	   title:'车身颜色',
		        	   align:'center'
		           },{
		        	   field:'length',
		        	   title:'车长(m)',
		        	   align:'center'
		           }
		    ]]
	});
	//初始化轨迹重构结果集表格
	$('#reconstructionResult').datagrid({
					title : '轨迹重构结果',
					nowrap: true,//是否只显示一行，即文本过多是否省略部分。
		    		singleSelect:true, //多选 
		    		fitColumns: true,
		    		fit:true,
		    		striped: true,
		    		rownumbers:true,
					columns : [[
					    {
					    	 field:'time',
					    	 title:'时间',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'intersection',
					    	 title:'卡口',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'spead',
					    	 title:'速度(km/h)',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'direction',
					    	 title:'方向',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'lane',
					    	 title:'车道',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'longitude',
					    	 title:'经度',
					    	 align:'center',
					    	 width:150
					    },{
					    	 field:'latitude',
					    	 title:'纬度',
					    	 align:'center',
					    	 width:150
					    }
					]]
				});
});
