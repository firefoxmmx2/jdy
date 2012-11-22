<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
$().ready(function() {
	uid = "";
	addressid = "";
	detid = "";
	dept_divnid="det_tabledata";
	dept_tableid="det_table1";
	dept_tables="";
	dept_pageUrl="sysadmin/queryLgdList_user.action";
	depttree = new dhtmlXTreeObject("dept", "100%", "100%", 0);
	depttree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	depttree.setOnClickHandler(deptdoOnClick);
	depttree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadmin/nextAddress_tree.action");
	depttree.loadXML("<%=request.getContextPath()%>/sysadmin/addressTree_tree.action");
	dept_loadPage(dept_divnid);
});

function dept_loadPage(divpageid){
	dept_tables=$("#"+divpageid).html();
	dept_setPageList(1,"#");
}

function dept_setList(pageno,url){
	$("#"+dept_divnid).html(dept_tables);
	createXML("dept_");
	if (url==null || url=="undefined"){
		url=dept_pageUrl;
	}
	return url;
}

function dept_setPageList(pageno,url){
	url=dept_setList(pageno,url);
	setParams("dept_");
	var mygrid1 = $("#"+dept_tableid).ingrid({
		url: url,
		height: ingrid1+10,
        ingridPageParams:sXML,
		pageNumber: pageno,
		isPlayResultNull:false,//查询结果为空时不提示
		onRowSelect: function(tr, selected){},
		colWidths: ["20%","20%","30%","30%"]									
	});	
}
function deptdoOnClick(itemId){//点击事件
	$("#dept_addressid").val(itemId);
	detid = depttree.getUserData(itemId,"departid");
	addressid = itemId;
}

function cgxx(){
	jAlert("修改成功","提示信息");
}

function lgModify(id){
	uid = id;
	return GB_showCenter("流管端用户信息修改","<%=request.getContextPath() %>/basic/sysadmin/LgdUserModify.jsp",320,530); 
}

function lgDelete(id){
	jConfirm("确定删除该用户吗？","删除提示", function(r) {
		if(r == false){
			return false;
		}else{
			userid = '<Params><Param name="userid">'+id+'</Param></Params>';
			$.ajax({
				type: 'POST',
				url: "<%=request.getContextPath()%>/sysadmin/delete_user.action",
				data: {dataxml:userid},
				async: false,
				dataType: 'json',
				success: function(user){
					if(user.result=="success"){
						dept_setPageList(1);
						jAlert("删除成功","提示信息");
					}
				}
			});
		}
	});
}

function addUser(){
	parentName = depttree.getSelectedItemText();
	return GB_showCenter("流管端用户添加","<%=request.getContextPath() %>/basic/sysadmin/LgdUserAdd.jsp",350,530);
}

function lgResetPwd(id){ //重置密码
	jConfirm('确定要重置此用户密码吗？', '提示', function(r) {
    	if(r==true){
			$("#m_userid").attr("value",id);
			setParams("m_");
	        jQuery.post("sysadmin/redoUserPwd_user.action",params,lgResetPwdBack,"json");
		}else{
		   return false;
		}
	});
}

function lgResetPwdBack(json){
	if  (json.result=="success"){
		jAlert("密码重置成功","提示信息");
	}else{
		jAlert(json.result,"错误信息");
	}	
}

function UserRole(id){ //用户角色管理
	sFlag="false";
	dataid=id;
	$("#"+detailid).css("top","50px");
	setWidth(detailid,800);
	setUrl(detailid,'basic/sysadmin/UserRole.jsp');
	bindDocument(detailid); //自动关闭
}

function lgUserRole(id){ //用户角色管理
	uid = id;
	return GB_showCenter("用户角色管理","<%=request.getContextPath() %>/basic/sysadmin/Address_role.jsp",470,530);
}
</script>

<html>
  <body>
<input type="hidden" id="dept_addressid"/>
<input type="hidden" id="m_userid"/>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<td width="20%" height="100%" valign="top">
<div id="dept" style="width:100%;height:100%;background-color:#f5f5f5;border :1px solid Silver; overflow:auto;float:left;">
</div>
</td>
<td width="1%" height="100%">
</td>
<td width="79%" height="100%" valign="top">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
		<tr>
            <td class="queryfont">用户管理</td>
        </tr>
          <tr>
            <td class="tdbg"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="10%" class="pagedistd">登陆账号</td>
                  <td width="16%" class="pagetd"><input type="text" class="inputstyle"  id="dept_useraccount"></td>
                  <td width="10%" class="pagedistd">用户姓名</td>
                  <td width="16%" class="pagetd"><input type="text" class="inputstyle"  id="dept_username"></td>
                  <td>
                  <table width="46%" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="45%" ><a href="#" class="searchbutton" id="dept_query" onClick="dept_setPageList(1);">查询</a></td>
                  <td width="55%" id="button"><a href="#" class="addbutton"  onclick='addUser();'>添加</a></td>
                </tr>
              </table>
                  </td>
              </tr>
            </table></td>
        </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<div id="det_tabledata" width="100%" class="grid_div">
	<table id="det_table1" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_useraccount">登陆账号</th>
            <th name="l_username">用户姓名</th>
            <th name="l_usertype">用户类别</th>
            <th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</td>
</tr>
</table>

  </body>
</html>
