/**
 * 
 */


(function(){
	var webJsUtils = {
		/**
		 * 获取URL参数
		 * @param {} name
		 * @return {}
		 * getQueryString("参数名1")
		 */
		getQueryString: function getQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]); return null;
		},
		setCookie : function(name,value,millisec){
			 var exp = new Date();
			 exp.setTime(exp.getTime() + millisec);
			 document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
		},
		getCookie : function(name){
			var str=document.cookie, index=str.indexOf(name+"=");
			if(index==-1)return;
			var len=index+name.length+1,ind=str.indexOf(";",len);
			return unescape(str.substring(len,(ind==-1?str.length:ind)));
		}
	};
	
	if (!window.webJsUtils) {
        window.webJsUtils = webJsUtils;
    };
})();


(function(){
    var helix = {
        messager:{
            alert: function(title,msg,icon){
                var iconClass = "";
                if(icon === 'info'){
                    iconClass = "messager-icon messager-info";
                }else if(icon === 'error'){
                    iconClass = "messager-icon messager-error";
                }else if(icon === 'warning'){
                    iconClass = "messager-icon messager-warning";
                }else if(icon === 'question'){
                    iconClass = "messager-icon messager-question";
                }else{
                    iconClass = "messager-icon messager-info";
                }
                var iconDiv = '<div class="'+iconClass+'"></div>';
                msg = iconDiv + '<div>' + msg + '</div>';
                $.messager.show({
                    title:title,
                    msg:msg,
                    icon:icon,
                    timeout:3000,
                    showType:'slide',
                    style:{
                        right:'',
                        top:document.body.scrollTop+document.documentElement.scrollTop + 20,
                        bottom:''
                    }
                }); 
            }
        },
        mask:{
            loading: function (msg, target) {  
                var panel = null;
                if(target == undefined){
                    var panel =  window.$(document.body);
                }else{
                    panel = target;
                }
                if (msg == undefined) {  
                    msg = "正在加载数据，请稍候...";  
                }  
                $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: panel.width(), height: panel.height() , 'z-index':9999}).appendTo(panel);  
                $("<div class=\"datagrid-mask-msg\"></div>").html(msg).appendTo(panel).css({ display: "block", left: (panel.width() - $("div.datagrid-mask-msg", panel).outerWidth()) / 2, top: (panel.height() - $("div.datagrid-mask-msg", panel).outerHeight()) / 2, 'z-index':9999});  
            },  
            //隐藏遮罩  
            loaded: function (target) {  
                var panel = null;
                if(target == undefined){
                    var panel =  window.$(document.body);
                }else{
                    panel = target;
                }
                panel.find("div.datagrid-mask-msg").remove();  
                panel.find("div.datagrid-mask").remove();   
            } 
        }
    };
    if (!$.helix) {
        $.helix = helix;
    };
})();
