<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
	var rwxydqtwjgs=0;
	var trid_index=8;
	$(document).ready(function() {
		hide_td();
		setPageList_zzclModify(1);
		setParams("p_");
		jQuery.post("publicsystem/querylist_zzcl.action",params,zzcl_updatediv,"json");
	});
	//img控件
	function openfile(key){
		ImgerToBase1.SetFileSizeA(2000);
		ImgerToBase1.SetFileFilter="JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Gif Image File (*.gif)|*.gif|";
		ImgerToBase1.OpenFile();
		var fileName = ImgerToBase1.getFileName();
		if(fileName!='') ImgerToBase(key);

	}
	function ImgerToBase(key){
		ImgerToBase1.SetFileSize= 2000;
		var filePath = ImgerToBase1.getFile();
		var base64code = ImgerToBase1.getBase64();
		var fileName = ImgerToBase1.getFileName();
		if(fileName==null||fileName==''||fileName=='null'){
			$("#a_"+key).attr("value","");
		} else {
				if(key=="rwxxdqtcl"){
					if(rwxydqtwjgs==3){
				 		jAlert('认为需要的其他材料最多为3个附件!','验证信息');
				 		return false;
			 		}
					params={fileNamecon:fileName,tplx:"6",base64codecon:base64code};
					var newInputTd = "<tr id='"+trid_index+"' height='25'><td id=tdid_'"+trid_index+"' class='pagedistd1' width='25%'></td><td class='pagetd1' width='25%'><span id='ck_"+trid_index+"'><a href='#' onclick=openBigImg('"+trid_index+"');>"+fileName+"</span><input id='key_"+trid_index+"' type='hidden'></td><td id='deltd_"+trid_index+"' align='left' width='50%'><a  id='delbutton1' href='#' onclick=delete_nr('rwxxdqtcl','"+trid_index+"') class='submitbutton'>删除</a><span>&nbsp</span></td></tr>";
					$("#rwxxdqtcltr").after(newInputTd);
					$("#key_"+trid_index).val(filePath);//照片路径
					if(rwxydqtwjgs==2){
						$("#rwxxdqtcltr").hide();
						$("#rwxxdqtcltr").next().find("td:eq(0)").html("认为需要的其他材料:");
					}
				}else{
					$("#"+key).hide();
					$("#key_"+key).val(filePath);
					$("#ck_"+key).append("<a href='#' onclick=openBigImg('"+key+"');>"+fileName+"</a>")
					$("#addtd_"+key).hide();
					$("#scantd_"+key).hide();
					$("#deltd_"+key).show();
					if(key=="jycscqzmwj"){
						params={fileNamecon:fileName,tplx:"1",base64codecon:base64code};
						$("#deltd_jycscqzmwj").html("<a id='delbutton1' href='#' class='submitbutton'  onclick=delete_nr('jycscqzmwj','1');>删除</a>");
					}
					if(key=="jycssyqzmwj"){
						params={fileNamecon:fileName,tplx:"2",base64codecon:base64code};
						$("#deltd_jycssyqzmwj").html("<a id='delbutton2' href='#' class='submitbutton'  onclick=delete_nr('jycssyqzmwj','2');>删除</a>");
					}
					if(key=="qyfwt"){
						params={fileNamecon:fileName,tplx:"3",base64codecon:base64code};
						$("#deltd_qyfwt").html("<a id='delbutton3' href='#' class='submitbutton'  onclick=delete_nr('qyfwt','3');>删除</a>");
					}
					if(key=="qypmt"){
						params={fileNamecon:fileName,tplx:"4",base64codecon:base64code};
						$("#deltd_qypmt").html("<a id='delbutton4' href='#' class='submitbutton'  onclick=delete_nr('qypmt','4');>删除</a>");
					}
					if(key=="qywg"){
						params={fileNamecon:fileName,tplx:"5",base64codecon:base64code};
						$("#deltd_qywg").html("<a id='delbutton5' href='#' class='submitbutton'  onclick=delete_nr('qywg','5');>删除</a>");
					}
				}
        		jQuery.post("publicsystem/uptempfile_zzcl.action",params,uploadfileback,"json");
		}
	}
	
	//上传文件的回调函数
	function uploadfileback(json){
	   removeAllDivCeng();
	   /////new 把附件名字 和转换后的base64码 放入隐藏域
	  if(json.tplx=='6'){
	  		var newRow="<TR id='"+trid_index+"'><TD></TD><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD>new</TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	  		trid_index=trid_index+1;
	   		rwxydqtwjgs=rwxydqtwjgs+1;
	   }else{
	   		var newRow="<TR id='"+json.tplx+"'><TD></TD><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD>new</TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   }
	   var queryNewRow = $(newRow);
	   $("#fjcontect").append(queryNewRow);
	}
	
	//删除上传的图片
	function delete_nr(key,index,zzclid){
			if(key=='rwxxdqtcl'){
			 	var fileTempName = $("#fjcontect").find("tr[id='"+index+"']").find("td:nth(4)").text(); /////上传的临时文件名字
			 	$("#add").find("tr[id='"+index+"']").remove();
			 	if(typeof(zzclid)=="undefined"||zzclid=="undefined"){
			 		$("#fjcontect").find("tr[id='"+index+"']").find("td:nth(3)").html("delete");
			 	}else{
			 		$("#fjcontect").find("tr[id='"+zzclid+"']").find("td:nth(3)").html("delete");
			 	}
			 	rwxydqtwjgs=rwxydqtwjgs-1;
			 	if(rwxydqtwjgs<3){
			 		$("#rwxxdqtcltr").show();
			 		$("#rwxxdqtcltr").next().find("td:eq(0)").html("");
			 	}
			}else{
				$("#a_"+key).val("");
				$("#ck_"+key).html("");
				var fileTempName = $("#fjcontect").find("tr[id='"+index+"']").find("td:nth(4)").text(); /////上传的临时文件名字
				$("#fjcontect").find("tr[id='"+index+"']").find("td:nth(3)").html("delete");
			}
			 
			 params={fileTempNamecon:fileTempName};
			 jQuery.post("publicsystem/deleteFile_zzcl.action",params,null,"json"); 
			 $("#"+key).show();
			 $("#addtd_"+key).show();
			 $("#scantd_"+key).show();
			 $("#deltd_"+key).hide();
			 
	}
	//查看原始图
	function openBigImg(key){
		var file=$('#key_'+key).val();
		if(typeof(file)=="undefined"||file=="undefined"){
			file="publicsystem/queryTp_zzcl.action?zzclid="+key;
		}
		window.open("basic/publicsystem/Bigimg.jsp?file="+file,"","toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=no,top=100,left=100,height=600,width=600");
	}
	function zzcl_updatediv(json){	   
		for(var i=0;i<json.LZzcl.length;i++){
			if(json.LZzcl[i].tplx=='1'){
			    if( $("#del_qyid").val()==null ||  $("#del_qyid").val()==""){
			        $("#del_qyid").val(json.LZzcl[i].qyid);
			        }
				$("#jycscqzmwj").hide();
				$("#ck_jycscqzmwj").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_jycscqzmwj").html("<a  id='delbutton1' href='#' class='submitbutton'  onclick=deleteZzcl('jycscqzmwj',"+json.LZzcl[i].zzclid+");>删除</a>");
				$("#deltd_jycscqzmwj").show();
				$("#addtd_jycscqzmwj").hide();
				$("#scantd_jycscqzmwj").hide();
			}else if(json.LZzcl[i].tplx=='2'){
				$("#jycssyqzmwj").hide();
				$("#ck_jycssyqzmwj").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_jycssyqzmwj").html("<a  id='delbutton2' href='#' class='submitbutton'  onclick=deleteZzcl('jycssyqzmwj',"+json.LZzcl[i].zzclid+");>删除</a>");
				$("#deltd_jycssyqzmwj").show();
				$("#addtd_jycssyqzmwj").hide();
				$("#scantd_jycssyqzmwj").hide();
			}else if(json.LZzcl[i].tplx=='3'){
				$("#qyfwt").hide();
				$("#ck_qyfwt").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qyfwt").html("<a  id='delbutton3' href='#' class='submitbutton'  onclick=deleteZzcl('qyfwt',"+json.LZzcl[i].zzclid+");>删除</a>");
				$("#deltd_qyfwt").show();
				$("#addtd_qyfwt").hide();
				$("#scantd_qyfwt").hide();
			}else if(json.LZzcl[i].tplx=='4'){
				$("#qypmt").hide();
				$("#ck_qypmt").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qypmt").html("<a  id='delbutton4' href='#' class='submitbutton'  onclick=deleteZzcl('qypmt',"+json.LZzcl[i].zzclid+");>删除</a>");
				$("#deltd_qypmt").show();
				$("#addtd_qypmt").hide();
				$("#scantd_qypmt").hide();
			}else if(json.LZzcl[i].tplx=='5'){
				$("#qywg").hide();
				$("#ck_qywg").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qywg").html("<a  id='delbutton5' href='#' class='submitbutton'  onclick=deleteZzcl('qywg',"+json.LZzcl[i].zzclid+");>删除</a>");
				$("#deltd_qywg").show();
				$("#addtd_qywg").hide();
				$("#scantd_qywg").hide();
			}else if(json.LZzcl[i].tplx=='6'){
				//$("#rwxxdqtcl").hide();
				//$("#ck_rwxxdqtcl").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				//$("#deltd_rwxxdqtcl").show();
				//$("#addtd_rwxxdqtcl").hide();
				//var newInputTd = "<tr id='"+trid_index+"' height='25'><td id=tdid_'"+trid_index+"' class='pagedistd1' width='25%'></td><td class='pagetd1' width='25%'><span id='ck_"+i+"'></span></td><td><a  id='delbutton1' href='#' class='submitbutton'  onclick=deleteZzcl('rwxxdqtcl',"+trid_index+","+json.LZzcl[i].zzclid+");>删除</a></td></tr>";
				var newInputTd = "<tr id='"+trid_index+"' height='25'><td id=tdid_'"+trid_index+"' class='pagedistd1' width='25%'></td><td class='pagetd1' width='25%'><span id='ck_"+i+"'></span></td><td><a  id='delbutton1' href='#' class='submitbutton'  onclick=deleteZzcl('rwxxdqtcl',"+json.LZzcl[i].zzclid+","+trid_index+");>删除</a></td></tr>";
				$("#rwxxdqtcltr").after(newInputTd);
				$("#ck_"+i).append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				rwxydqtwjgs=rwxydqtwjgs+1;
				if(rwxydqtwjgs==3){
					$("#rwxxdqtcltr").hide();
					$("#rwxxdqtcltr").next().find("td:eq(0)").html("认为需要的其他材料:");
				}
				trid_index=trid_index+1;
			}
		} 		
	}
	function setPageList_zzclModify(pageno,url){
			createXML("p_");	
			var mygrid1 = $("#zzclTable").ingrid({ 
							url: "publicsystem/querylistForPage_zzcl.action",
							tableid : "fjcontect",
							ingridHtmlFlag:true,
							gridClass:'tablestyle',
							height: 120,
							sorting: false,
							pageNumber: pageno,
							paging: false,
							onRowSelect: function(tr, selected){
									},
							ingridPageParams:sXML,
							ingridPageWidth: 680,
							colWidths: ["20%","20%","20%","20%","20%"]									
						});				
	}

	function hide_td(){
		$("#deltd_jycscqzmwj").hide();
		$("#deltd_jycssyqzmwj").hide();
		$("#deltd_qyfwt").hide();
		$("#deltd_qypmt").hide();
		$("#deltd_qywg").hide();
		$("#deltd_rwxxdqtcl").hide();
	}
	
	//扫描文件
	function scanfile(key){
	    x=document.getElementById("scanobj");
	    var flleName=null;
	    if(x!=null){
	       	x.HandScanClick();	
	       	var base64code =x.GetImage();	  
	       	if(base64code==null && base64code==""){
	       	    jAlert('扫描失败!','验证信息');
	       	    return false;
	       	}else{
				if(key=="rwxxdqtcl"){
					if(rwxydqtwjgs==3){
				 		jAlert('认为需要的其他材料最多为3个附件!','验证信息');
				 		return false;
			 		}
			 		fileName=key+trid_index+".jpg";
					params={fileNamecon:fileName,tplx:"6",base64codecon:base64code};
					var newInputTd = "<tr id='"+trid_index+"' height='25'><td id=tdid_'"+trid_index+"' class='pagedistd1' width='25%' style='vertical-align:top;'></td><td class='pagetd1' width='25%'><span id='ck_"+trid_index+"'><a href='#' onclick=openBigImg('"+trid_index+"');>"+fileName+"</span><input id='key_"+trid_index+"' type='hidden'></td><td id='deltd_"+trid_index+"' align='left' width='50%'><a  id='delbutton1' href='#' onclick=delete_nr('rwxxdqtcl','"+trid_index+"') class='submitbutton'>删除</a><span>&nbsp</span></td></tr>";
					$("#rwxxdqtcltr").after(newInputTd);
					trid_index=trid_index+1;
					if(rwxydqtwjgs==2){
						$("#rwxxdqtcltr").hide();
						$("#rwxxdqtcltr").next().find("td:eq(0)").html("认为需要的其他材料:");
					}
				}else{
				    fileName=key+".jpg";
					$("#"+key).hide();
					$("#ck_"+key).append("<a href='#' onclick=openBigImg('"+key+"');>"+fileName+"</a>")
					$("#addtd_"+key).hide();
					$("#scantd_"+key).hide();
					$("#deltd_"+key).show();
					if(key=="jycscqzmwj")
					params={fileNamecon:fileName,tplx:"1",base64codecon:base64code};
					if(key=="jycssyqzmwj")
					params={fileNamecon:fileName,tplx:"2",base64codecon:base64code};
					if(key=="qyfwt")
					params={fileNamecon:fileName,tplx:"3",base64codecon:base64code};
					if(key=="qypmt")
					params={fileNamecon:fileName,tplx:"4",base64codecon:base64code};
					if(key=="qywg")
					params={fileNamecon:fileName,tplx:"5",base64codecon:base64code};
				}				
	       	 jQuery.post("publicsystem/uptempfile_zzcl.action",params,scanfileback,"json");
	       	}
	    }else{
	        jAlert('扫描仪初始化失败,请检查!','验证信息');
	        return false;
	    }
	}
	
	function scanfileback(json){
	  var filePath="<%=basePath%>"+"uploadTemp/"+json.fileTempNamecon;	 
      removeAllDivCeng();
	   if(json.tplx=='1'){
	      $('#key_jycscqzmwj').val(filePath);
	   }
	   if(json.tplx=='2'){
	      $('#key_jycssyqzmwj').val(filePath);     
	   }
	   if(json.tplx=='3'){
	      $('#key_qyfwt').val(filePath);
	   }
	   if(json.tplx=='4'){
	      $('#key_qypmt').val(filePath);
	   }
	   if(json.tplx=='5'){
	      $('#key_qywg').val(filePath);
	   }	  
	   if(json.tplx=='6'){
	       var filename=json.fileNamecon;
	       if(filename!=null){
	        $('#key_'+(trid_index-1)).val(filePath);
	       }	       
	   		var newRow="<TR id='"+trid_index+"'><TD></TD><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD>new</TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   		rwxydqtwjgs=rwxydqtwjgs+1;
	   }else{
	   		var newRow="<TR id='"+json.tplx+"'><TD></TD><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD>new</TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   }
	   var queryNewRow = $(newRow);
	   $("#fjcontect").append(queryNewRow);	   
	}
	function deleteZzcl(key,zzclid,index){
	    if(key=='rwxxdqtcl'){
			 	$("#add").find("tr[id='"+index+"']").remove();
			 	if(typeof(zzclid)=="undefined"||zzclid=="undefined"){
			 		$("#fjcontect").find("tr[id='"+index+"']").find("td:nth(3)").html("delete");
			 	}else{
			 		$("#fjcontect").find("tr[id='"+zzclid+"']").find("td:nth(3)").html("delete");
			 	}
			 	rwxydqtwjgs=rwxydqtwjgs-1;
			 	if(rwxydqtwjgs<3){
			 		$("#rwxxdqtcltr").show();
			 		$("#rwxxdqtcltr").next().find("td:eq(0)").html("");
			 	}
			}else{
				$("#a_"+key).val("");
				$("#ck_"+key).html("");
				$("#fjcontect").find("tr[id='"+index+"']").find("td:nth(3)").html("delete");
			}	    
	     $("#del_zzclid").val(zzclid);
	     setParams("del_");
		 jQuery.post("publicsystem/deleteZzcl_zzcl.action",params,null,"json"); 
		 $("#"+key).show();
		 $("#addtd_"+key).show();
		 $("#scantd_"+key).show();
		 $("#deltd_"+key).hide();
	}
	
	
</script>
<html>
<input type="hidden" id="key_jycscqzmwj"/><!-- 图片的本地路径 -->
<input type="hidden" id="key_jycssyqzmwj"/>
<input type="hidden" id="key_qyfwt"/>
<input type="hidden" id="key_qypmt"/>
<input type="hidden" id="key_qywg"/>
<input type="hidden" id="key_rwxxdqtcl"/>
<input type="hidden" id="del_zzclid">
<input type="hidden" id="del_qyid">
<table width="100%"  cellpadding="0" cellspacing="0" align="tableborder">
    <tr>
      <td  class="queryfont">企业纸质材料</td>
    </tr>
</table>
<table width="100%" id="add">
	<tr height="25">
		<td class="pagedistd1" width="25%">经营场所产权证明文件:</td>
		<td class="pagetd1" width="25%" style="vertical-align:top;"><input type="text" id="jycscqzmwj" class="readonly" style="width:98.7%"><span id="ck_jycscqzmwj"></span></td>
		<td id="addtd_jycscqzmwj" align="left" width="8%"><a  href="#" class="submitbutton"  onclick="openfile('jycscqzmwj');">添加</a></td>
		<td id="scantd_jycscqzmwj" align="left" width="50%"><a  href="#" class="submitbutton"  onclick="scanfile('jycscqzmwj');">扫描</a></td>
		<td id="deltd_jycscqzmwj" align="left" width="50%"><a  id="delbutton1" href="#" class="submitbutton"  >删除</a><span>&nbsp</span></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">经营场所使用权证明文件:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="jycssyqzmwj" class="readonly" style="width:98.7%" value=""><span id="ck_jycssyqzmwj"></span></td>
		<td id="addtd_jycssyqzmwj" align="left"><a href="#" class="submitbutton"  onclick="openfile('jycssyqzmwj');">添加</a></td>
		<td id="scantd_jycssyqzmwj" align="left"><a href="#" class="submitbutton"  onclick="scanfile('jycssyqzmwj');">扫描</a></td>
		<td id="deltd_jycssyqzmwj" align="left" width="50%"><a id="delbutton2" href="#" class="submitbutton"  onclick="delete_nr('jycssyqzmwj','2');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业方位图:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qyfwt" class="readonly" style="width:98.7%" value=""><span id="ck_qyfwt"></span></td>
		<td id="addtd_qyfwt" align="left"><a href="#" class="submitbutton"  onclick="openfile('qyfwt');">添加</a></td>
		<td id="scantd_qyfwt" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qyfwt');">扫描</a></td>
		<td id="deltd_qyfwt" align="left" width="50%"><a id="delbutton3" href="#" class="submitbutton"  onclick="delete_nr('qyfwt','3');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业平面图:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qypmt" class="readonly" style="width:98.7%" /><span id="ck_qypmt"></span></td>
		<td id="addtd_qypmt" align="left"><a href="#" class="submitbutton"  onclick="openfile('qypmt');">添加</a></td>
		<td id="scantd_qypmt" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qypmt');">扫描</a></td>
		<td id="deltd_qypmt" align="left" width="50%"><a id="delbutton4" href="#" class="submitbutton"  onclick="delete_nr('qypmt','4');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业外观:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qywg" class="readonly" style="width:98.7%"  /><span id="ck_qywg"></span></td>
		<td id="addtd_qywg" align="left"><a href="#" class="submitbutton"  onclick="openfile('qywg');">添加</a></td>
		<td id="scantd_qywg" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qywg');">扫描</a></td>
		<td id="deltd_qywg" align="left" width="50%"><a id="delbutton5" href="#" class="submitbutton"  onclick="delete_nr('qywg','5');">删除</a></td>
	</tr>
	<tr id="rwxxdqtcltr" height="25">
		<td class="pagedistd1">认为需要的其他材料:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="rwxxdqtcl" class="readonly" style="width:98.7%"  /><span id="ck_rwxxdqtcl"></span></td>
		<td id="addtd_rwxxdqtcl" align="left"><a href="#" class="submitbutton"  onclick="openfile('rwxxdqtcl');">添加</a></td>
		<td id="scantd_rwxxdqtcl" align="left"><a href="#" class="submitbutton"  onclick="scanfile('rwxxdqtcl');">扫描</a></td>
		<td id="deltd_rwxxdqtcl" align="left" width="50%"><a id="delbutton6" href="#" class="submitbutton"  onclick="delete_nr('rwxxdqtcl','6');">删除</a></td>
	</tr>
</table> 
<!-- test  -->
<div id="ZzclxxListData" style="width:100%;display:none;">
	<table id="zzclTable" width="100%"  >
	  <thead>
	    <tr>
	    	<th name="l_zzclid">纸质材料id</th>
	     	<th name="l_tpmc">图片名称</th>
	     	<th name="l_tplx">照片类型</th>
	     	<th name="l_czlx">操作类型</th>
	     	<th name="l_tplsmc">图片临时名称</th> 	
	    </tr>
	  </thead>
	  <tbody id="fjcontect">
	  </tbody>
	</table>	
</div>
<jsp:include page="../../public/ImgerToBase64.jsp">

	<jsp:param name="objid" value="ImgerToBase1" />
</jsp:include> 

<div id="scandiv" style="display:none;" align="center">
	<jsp:include page="../../public/gsPicture.jsp">
		<jsp:param name="objid" value="scanobj" />
	</jsp:include>
</div> 
<br><p>
<font id='tscon' color='red' size='5'><b>典当企业经营处所方位图、平面图及典当企业外观照片须扫描上传。</b></font></p>
</html>
