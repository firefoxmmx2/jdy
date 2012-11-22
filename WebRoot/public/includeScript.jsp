		<% 
			String ldrk = request.getContextPath(); 
			String sessionout = request.getParameter("sessionout");
			if(sessionout == null){
		         sessionout="no";
		    }
		%>
		<script type="text/javascript">
			var sessionout="<%=sessionout%>";

			//如果session过期，直接打开
			if(sessionout=='yes'){
				parent.parent.location.reload();
				parent.parent.GB_hide();
			}
		</script>
		<script>
			var GB_ROOT_DIR ="<%=ldrk %>/greybox/";
		</script>
		<script type= "text/javascript" src= "<%=ldrk %>/greybox/AJS.js"> </script>
		<script type="text/javascript" src="<%=ldrk %>/greybox/AJS_fx.js"></script>
		<script type= "text/javascript" src= "<%=ldrk %>/greybox/gb_scripts.js"> </script>
		<link rel="stylesheet" href="<%=ldrk %>/greybox/gb_styles.css" type="text/css" />
		
		<script type="text/javascript" src="<%=ldrk %>/javascript/jquery-1.3.2.min.js"></script>
		
		<link type="text/css" href="<%=ldrk %>/accordion/jquery.ui.all.css" rel="stylesheet" />
		<link type="text/css" href="<%=ldrk %>/accordion/jquery-ui-1.8.14.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="<%=ldrk %>/accordion/jquery.ui.core.js"></script>
		<script type="text/javascript" src="<%=ldrk %>/accordion/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="<%=ldrk %>/accordion/jquery.ui.accordion.js"></script>
		
		<script type="text/javascript" src="<%=ldrk %>/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript" src="<%=ldrk %>/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=ldrk %>/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
		
		<link rel="stylesheet" href="<%=ldrk %>/css/stylemenu.css" type="text/css" />
		<link rel="stylesheet" href="<%=ldrk %>/css/jdMenu.css" type="text/css" />
		<link rel="stylesheet" href="<%=ldrk %>/css/jdMenu.jdsharp.css" type="text/css" /> 
		<link href="<%=ldrk %>/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
		
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/ext/adapter/jquery/ext-jquery-adapter.js"></script>
        <script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/ext/adapter/ext/ext-base.js"></script>
        <script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/ext/ext-all.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.jframe.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.ui.draggable.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.form.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.alerts.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.combobox.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.combocheckbox.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/valdate.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/dictDropDown.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/shxxTime.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/icctwocjjs.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/ickDxrV1.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/mjjczDxrV1.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/forOffineJs.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/shenfenzhengVal.js"></script>
 		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/gspicture.js"></script><!-- liufengAdd -->
 		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/gsliudong.js"></script><!-- liuleiAdd -->
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/htmlConfig.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/md5.js" ></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.ingrid-0.9.2.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/gad-cxtj-ksdld.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/gad-cxtj-csld.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/hylb-link-qyzfl.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.cookie.js"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/ui.datepicker.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/DateTimeMask.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="<%=ldrk %>/javascript/jquery.mypagination.js"></script>
		<link rel="stylesheet" href="<%=ldrk %>/css/mypagination.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=ldrk %>/css/site.css" type="text/css" />
		<link rel="stylesheet" href="<%=ldrk %>/css/ingrid.css" type="text/css" />
		<link rel="stylesheet" href="<%=ldrk %>/css/style.css" type="text/css" />
		<link rel="stylesheet" href="<%=ldrk %>/css/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
		<script type="text/javascript" src="<%=ldrk %>/formplugin/jquery.jqtransform.js"></script>
		<link rel="stylesheet" href="<%=ldrk %>/formplugin/jqtransform.css" type="text/css" />
		<link rel="Stylesheet" href="<%=ldrk %>/css/common.css" />
		<link type="text/css" href="<%=ldrk %>/javascript/dhtmlxtree/dhtmlxtree.css" rel="stylesheet" />
		<script type= "text/javascript" src= "<%=ldrk %>/javascript/dhtmlxtree/dhtmlxcommon.js"> </script>
		<script type= "text/javascript" src= "<%=ldrk %>/javascript/dhtmlxtree/dhtmlxtree.js"> </script>
		<script type="text/javascript" src="<%=ldrk %>/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript" src="<%=ldrk %>/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=ldrk %>/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
		<link type="text/css" href="<%=ldrk%>/javascript/dhtmlxLayout/dhtmlxlayout.css" rel="stylesheet" />
		<link type="text/css" href="<%=ldrk%>/javascript/dhtmlxLayout/skins/dhtmlxlayout_dhx_skyblue.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=ldrk%>/javascript/dhtmlxLayout/dhtmlxcommon.js"></script>
		<script type="text/javascript" src="<%=ldrk%>/javascript/dhtmlxLayout/dhtmlxlayout.js"></script>
		<script type="text/javascript" src="<%=ldrk%>/javascript/dhtmlxLayout/dhtmlxcontainer.js"></script>
	
	    <style type="text/css">
<!--
html { overflow-x: hidden; overflow-y: auto; }
BODY { 
scroll:no; 
background-image:url(images/bg_ldrk.jpg);
background-repeat:repeat-x;
background-attachment: fixed;
} 
--> 
        </style>
	<script type="text/javascript">
	parentWindowPath = "<%=ldrk %>/";
	</script>	
		