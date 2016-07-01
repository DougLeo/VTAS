/**
 * 点击菜单项，如果存在对应的tab，则刷新
 */
function refreshTab(cfg){
    var refresh_tab = cfg.tabTitle?$('#mainContent').tabs('getTab',cfg.tabTitle):$('#tabs').tabs('getSelected');  
    if(refresh_tab && refresh_tab.find('iframe').length > 0){  
    var _refresh_ifram = refresh_tab.find('iframe')[0];  
    var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;  
    _refresh_ifram.contentWindow.location.href=refresh_url;  
    }  
}
/**
 * 打开或切换告警tab,并刷新数据
 */
function gotoAlarm(){
	var mainTabPanel = $('#mainContent');
	var text = '<strong>到位告警</strong>';
	var url = baseContext+'/alarm.do';
	var isExists = mainTabPanel.tabs('exists',text);
	$('#navigatorTree').tree('select',$('#navigatorTree').find('li')[0]);
	if(isExists){
        mainTabPanel.tabs('select',text);
        refreshTab({tabTitle:text,url:url});
    }else{
      
      mainTabPanel.tabs('addIframeTab',{      
		    tab:{
		    	title:text,
		    	closable:true
		    },      
		    iframe:{
		    	src:url,
		    	message:'加载中，请稍后……'
		    }      
		}); 
    }
}
(function($){
	/**
	 * 点击菜单项，如果存在对应的tab，则刷新
	 */
	/*function refreshTab(cfg){
	    var refresh_tab = cfg.tabTitle?$('#mainContent').tabs('getTab',cfg.tabTitle):$('#tabs').tabs('getSelected');  
	    if(refresh_tab && refresh_tab.find('iframe').length > 0){  
	    var _refresh_ifram = refresh_tab.find('iframe')[0];  
	    var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;  
	    _refresh_ifram.contentWindow.location.href=refresh_url;  
	    }  
	}  */
	/**
	 * 功能菜单点击事件 
	 * @param {Object} node
	 */
	function mainMenuNodeOnClick(node){
	    if(node == null || node.attributes == null) return;
	    var mainTabPanel = $('#mainContent');
	    var isExists = mainTabPanel.tabs('exists',node.text);
	    var url = node.attributes.url;
	    if(isExists){
	        mainTabPanel.tabs('select',node.text);
	        refreshTab({tabTitle:node.text,url:url});
	    }else{
	      
	      mainTabPanel.tabs('addIframeTab',{      
			    tab:{
			    	title:node.text,
			    	closable:true
			    },      
			    iframe:{
			    	src:url,
			    	message:'加载中，请稍后……'
			    }      
			}); 
	    }
	}
	$(function(){
		$('#navigatorTree').tree({
			onClick:mainMenuNodeOnClick
		});
		/**
		 * 设置定时器
		 */
		setInterval(getAlarm,3*1000);
    	var mess;
    	function getAlarm(){
			$.ajax({
				url : baseContext+"/instantAlarm.do",
				type:'post',
				dataType:'json',
				success : function(datas) {
					if(datas==3){
						mess = $.messager.show({
			                title:'到位告警通知',
			                msg:'有未处理的车辆告警通知!<br><a onclick=\"gotoAlarm()\" href=\'javascript:void(0);\'>点击处理</a> ',
			                timeout:120*1000,
			                showType:'slide'
			            });
					}
				}
			});
    	}
	});
})(jQuery);
