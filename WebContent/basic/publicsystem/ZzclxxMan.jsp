<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
	var trid_index=8;
	var rwxydqtwjgs=0;
	$(document).ready(function() {
		if(qyjbxx_requestType=='add'){ //非添加都请求
			td_hide("add");
		}else  if(qyjbxx_requestType=='detail'){ //详细信息
			td_hide("detail");
			$("#tscon").hide();
			setParams("p_");
			jQuery.post("publicsystem/querylist_zzcl.action",params,zzcl_updatediv,"json");
		}
	});
	var tijiaoKg = 0;
	function openfile(key){
		if(tijiaoKg==0){
			ImgerToBase1.SetFileSizeA(2000);
			ImgerToBase1.SetFileFilter="JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Gif Image File (*.gif)|*.gif|";
			ImgerToBase1.OpenFile();
			var fileName = ImgerToBase1.getFileName();
			if(fileName!='') ImgerToBase(key);
		}
	}
	function ImgerToBase(key){
		//设置打开图片的大小
		ImgerToBase1.SetFileSize= 2000;
		//文件名称 eg: snow.jpeg
		//var fileName = ImgerToBase1.getFileName();
		//文件路径 包括文件名称
		var filePath = ImgerToBase1.getFile();
		//BASE64编码
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
					var newInputTd = "<tr id='"+trid_index+"' height='25'><td id=tdid_'"+trid_index+"' class='pagedistd1' width='25%' style='vertical-align:top;'></td><td class='pagetd1' width='25%'><span id='ck_"+trid_index+"'><a href='#' onclick=openBigImg('"+trid_index+"');>"+fileName+"</span><input id='key_"+trid_index+"' type='hidden'></td><td id='deltd_"+trid_index+"' align='left' width='50%'><a  id='delbutton1' href='#' onclick=delete_nr('rwxxdqtcl','"+trid_index+"') class='submitbutton'>删除</a><span>&nbsp</span></td></tr>";
					$("#rwxxdqtcltr").after(newInputTd);
					$("#key_"+trid_index).val(filePath);//照片路径
					trid_index=trid_index+1;
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
        		jQuery.post("publicsystem/uptempfile_zzcl.action",params,uploadfileback,"json");
		}
	}
	
	//上传文件的回调函数
	function uploadfileback(json){
	   removeAllDivCeng();
	
	   /////new 把附件名字 和转换后的base64码 放入隐藏域
	   if(json.tplx=='6'){
	   		var newRow="<TR id='"+trid_index+"'><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   		rwxydqtwjgs=rwxydqtwjgs+1;
	   }else{
	   		var newRow="<TR id='"+json.tplx+"'><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   }
	   var queryNewRow = $(newRow);
	   $("#fjcontect").append(queryNewRow);
	}
	
	//删除上传的图片
	function delete_nr(key,index){
			$("#a_"+key).val("");
			$("#ck_"+key).html("");
			
			 if(key=='rwxxdqtcl'){
			 	var indexnum=Number(index)+1;
			 	var fileTempName = $("#fjcontect").find("tr[id='"+indexnum+"']").find("td:nth(2)").text(); /////上传的临时文件名字
			 	$("#add").find("tr[id='"+index+"']").remove();
			 	$("#fjcontect").find("tr[id='"+indexnum+"']").remove();
			 	rwxydqtwjgs=rwxydqtwjgs-1;
			 	if(rwxydqtwjgs<3){
			 		$("#rwxxdqtcltr").show();
			 		$("#rwxxdqtcltr").next().find("td:eq(0)").html("");
			 	}
			 }else{
			 	 var fileTempName = $("#fjcontect").find("tr[id='"+index+"']").find("td:nth(2)").text(); /////上传的临时文件名字
				 ///隐藏域删除附件信息
				 $("#fjcontect").find("tr[id='"+index+"']").remove();
			 }
			 params={fileTempNamecon:fileTempName};
			 jQuery.post("publicsystem/deleteFile_zzcl.action",params,delback,"json"); 
			 $("#"+key).show();
			 $("#addtd_"+key).show();
			 $("#scantd_"+key).show();
			 $("#deltd_"+key).hide();
			 
	}
	function delback(){}
	function td_hide(requestType){
		if(requestType=="add"){
			$("#deltd_jycscqzmwj").hide();
			$("#deltd_jycssyqzmwj").hide();
			$("#deltd_qyfwt").hide();
			$("#deltd_qypmt").hide();
			$("#deltd_qywg").hide();
			$("#deltd_rwxxdqtcl").hide();
			$("#printtd_jycscqzmwj").hide();
			$("#printtd_jycssyqzmwj").hide();
			$("#printtd_qyfwt").hide();
			$("#printtd_qypmt").hide();
			$("#printtd_qywg").hide();
			$("#printtd_rwxxdqtcl").hide();
		}else if(requestType=="detail"){
			$("#delbutton1").hide();
			$("#delbutton2").hide();
			$("#delbutton3").hide();
			$("#delbutton4").hide();
			$("#delbutton5").hide();
			$("#delbutton6").hide();
			$("#addtd_jycscqzmwj").hide();
			$("#addtd_jycssyqzmwj").hide();
			$("#addtd_qyfwt").hide();
			$("#addtd_qypmt").hide();
			$("#addtd_qywg").hide();
			$("#addtd_rwxxdqtcl").hide();
			$("#scantd_jycscqzmwj").hide();
			$("#scantd_jycssyqzmwj").hide();
			$("#scantd_qyfwt").hide();
			$("#scantd_qypmt").hide();
			$("#scantd_qywg").hide();
			$("#scantd_rwxxdqtcl").hide();
		}
	}
	function openBigImg(key){
		var file=$('#key_'+key).val();
		if(typeof(file)=="undefined"||file=="undefined"){
			file="publicsystem/queryTp_zzcl.action?zzclid="+key;
		}
		window.open("basic/publicsystem/Bigimg.jsp?file="+file,"","toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=no,top=100,left=100,height=600,width=600");
	}
	function zzcl_updatediv(json){
		if(qyjbxx_requestType=='detail'){
			$("#jycscqzmwj").hide();
			$("#jycssyqzmwj").hide();
			$("#qyfwt").hide();
			$("#qypmt").hide();
			$("#qywg").hide();
			$("#rwxxdqtcl").hide();
		}
		var duotiao_rwxxdqtcl=0;
		var duotiao=0;
		for(var i=0;i<json.LZzcl.length;i++){
			if(json.LZzcl[i].tplx=='1'){
				$("#jycscqzmwj").hide();
				$("#jycscqzmwjid").val(json.LZzcl[i].zzclid);
				$("#ck_jycscqzmwj").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_jycscqzmwj").show();
				$("#addtd_jycscqzmwj").hide();
			}else if(json.LZzcl[i].tplx=='2'){
				$("#jycssyqzmwj").hide();
				$("#jycssyqzmwjid").val(json.LZzcl[i].zzclid);
				$("#ck_jycssyqzmwj").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_jycssyqzmwj").show();
				$("#addtd_jycssyqzmwj").hide();
			}else if(json.LZzcl[i].tplx=='3'){
				$("#qyfwt").hide();
				$("#qyfwtid").val(json.LZzcl[i].zzclid);
				$("#ck_qyfwt").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qyfwt").show();
				$("#addtd_qyfwt").hide();
			}else if(json.LZzcl[i].tplx=='4'){
				$("#qypmt").hide();
				$("#qypmtid").val(json.LZzcl[i].zzclid);
				$("#ck_qypmt").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qypmt").show();
				$("#addtd_qypmt").hide();
			}else if(json.LZzcl[i].tplx=='5'){
				$("#qywg").hide();
				$("#qywgid").val(json.LZzcl[i].zzclid);
				$("#ck_qywg").append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				$("#deltd_qywg").show();
				$("#addtd_qywg").hide();
			}else if(json.LZzcl[i].tplx=='6'){
				if(duotiao_rwxxdqtcl==0){
					$("#rwxxdqtcl").hide();
					$("#rwxxdqtclid").val(json.LZzcl[i].zzclid);					
					$("#ck_rwxxdqtcl").append("<a  href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");				
					$("#deltd_rwxxdqtcl").show();
					$("#addtd_rwxxdqtcl").hide();
				}
				if(duotiao_rwxxdqtcl==1){				
					var newInputTd = "<tr id='"+i+"' height='25' ><td id='tdid_"+trid_index+"' class='pagedistd1' width='25%'></td>"
					+"<td class='pagetd1' width='25%' style='vertical-align:top;'><span id='ck_"+i+"'></span></td>"
					+"<td id='addtd_"+duotiao+"' align='left'></td><td id='scantd_"+duotiao+"' align='left'></td><td id='printtd_"+duotiao+"' align='left'>"
					+"<a href='#' class='submitbutton'  onclick=printfile('"+json.LZzcl[i].zzclid+"');>打印</a></td>"
		            +"<td id='deltd_"+duotiao+"'align='left' width='50%'></td></tr>";		            	
					$("#rwxxdqtcltr").after($(newInputTd));
					$("#addtd_"+duotiao).hide();
					$("#scantd_"+duotiao).hide();
					$("#deltd_"+duotiao).hide();
					duotiao=duotiao+1;
					$("#ck_"+i).append("<a href='#' onclick=openBigImg('"+json.LZzcl[i].zzclid+"');>"+json.LZzcl[i].tpmc+"</a>");
				}
				duotiao_rwxxdqtcl=1;
			}
		}
	}
	//扫描文件
	function scanfile(key){
	    var x=document.getElementById("scanobj");
	    var flleName=null;
	    if(x!=null){
	       	x.HandScanClick();	
	       	var base64code =x.GetImage();	  
	       	if(base64code==null || base64code==""){
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
					//$("#key_"+trid_index).val(filePath);//照片路径
					trid_index=trid_index+1;
					if(rwxydqtwjgs==2){
						$("#rwxxdqtcltr").hide();
						$("#rwxxdqtcltr").next().find("td:eq(0)").html("认为需要的其他材料:");
					}
				}else{
				    fileName=key+".jpg";
					$("#"+key).hide();
					//$("#key_"+key).val(filePath);
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
	   		var newRow="<TR id='"+trid_index+"'><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   		rwxydqtwjgs=rwxydqtwjgs+1;
	   }else{
	   		var newRow="<TR id='"+json.tplx+"'><TD><DIV>"+json.fileNamecon+"</DIV></TD><TD><DIV>"+json.tplx+"</DIV></TD><TD><DIV>"+json.fileTempNamecon+"</DIV></TD></TR>";
	   }
	   var queryNewRow = $(newRow);
	   $("#fjcontect").append(queryNewRow);	   
	}
	//纸质材料打印
	function printfile(key){ 
	   //alert(key);		
	    var file=$('#key_'+key).val();
	   var title = "企业纸质材料"; //标题信息	
		 if(key=="jycscqzmwj"){
		 //alert(0);
	        title="经营场所产权证明文件";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#jycscqzmwjid").val();
	        }
	       else if(key=="jycssyqzmwj"){	
	       //alert(1);
            title="经营场所使用权证明文件";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#jycssyqzmwjid").val();
	        }
	       else if(key=="qyfwt"){
	       //alert(3);
	        title="企业方位图";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#qyfwtid").val();
	       }
		   else if(key=="qypmt"){
		   //alert(4);
		    title="企业平面图";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#qypmtid").val();
		   }
		   else if(key=="qywg"){
		   //alert(5);
		    title="企业外观";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#qywgid").val();
		  }else if(key=="rwxxdqtcl"){
		  //alert(6);
		    title="认为需要的其他材料";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+$("#rwxxdqtclid").val();
		}else{
		    title="认为需要的其他材料";
	        file="<%=basePath %>"+"publicsystem/queryTp_zzcl.action?zzclid="+key;
		}
		if(file!=null && file!=""){
		$("#printImg").attr("src",file);
		var content = document.all.item("printDiv").innerHTML;	    
	    params={con:content,titlecon:title};
	    jQuery.post("basicsystem/printCon_publicPrint.action",params,printback,"json");
	    return false; 	   
		}
	    
	}
	function printback(){
	    var url = window.location.href;
	   var len = url.lastIndexOf('/');
	   url = url.substring(0, len)+"/public/printHtml.jsp";
	   window.open(url);
	   $("#printImg").attr("src",null);
	}
</script>
<html>
<input type="hidden" id="key_jycscqzmwj"/><!-- 图片的本地路径 -->
<input type="hidden" id="key_jycssyqzmwj"/>
<input type="hidden" id="key_qyfwt"/>
<input type="hidden" id="key_qypmt"/>
<input type="hidden" id="key_qywg"/>
<input type="hidden" id="key_rwxxdqtcl"/>
<input type="hidden" id="jycscqzmwjid"/><!-- 存储纸质材料id -->
<input type="hidden" id="jycssyqzmwjid"/>
<input type="hidden" id="qyfwtid"/>
<input type="hidden" id="qypmtid"/>
<input type="hidden" id="qywgid"/>
<input type="hidden" id="rwxxdqtclid"/>

<table width="100%"  cellpadding="0" cellspacing="0" align="tableborder">
    <tr>
      <td  class="queryfont">企业纸质材料</td>
    </tr>
</table>
<table width="100%" id="add">
	<tr height="25">
		<td class="pagedistd1" width="25%">经营场所产权证明文件:</td>
		<td class="pagetd1" width="25%" style="vertical-align:top;"><input type="text" id="jycscqzmwj" class="readonly" style="width:98.7%"><span id="ck_jycscqzmwj" ></span></td>
		<td id="addtd_jycscqzmwj" align="left" width="8%"><a  href="#" class="submitbutton"  onclick="openfile('jycscqzmwj');">添加</a></td>
		<td id="scantd_jycscqzmwj" align="left" width="50%"><a  href="#" class="submitbutton"  onclick="scanfile('jycscqzmwj');">扫描</a></td>
		<td id="printtd_jycscqzmwj" align="left" width="50%"><a  href="#" class="submitbutton"  onclick="printfile('jycscqzmwj');">打印</a></td>
		<td id="deltd_jycscqzmwj" align="left" width="80%"><a  id="delbutton1" href="#" class="submitbutton"  onclick="delete_nr('jycscqzmwj','1');">删除</a><span>&nbsp</span></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">经营场所使用权证明文件:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="jycssyqzmwj" class="readonly" style="width:98.7%" value=""><span id="ck_jycssyqzmwj"></span></td>
		<td id="addtd_jycssyqzmwj" align="left"><a href="#" class="submitbutton"  onclick="openfile('jycssyqzmwj');">添加</a></td>
		<td id="scantd_jycssyqzmwj" align="left"><a href="#" class="submitbutton"  onclick="scanfile('jycssyqzmwj');">扫描</a></td>
		<td id="printtd_jycssyqzmwj" align="left"><a href="#" class="submitbutton"  onclick="printfile('jycssyqzmwj');">打印</a></td>
		<td id="deltd_jycssyqzmwj" align="left" width="50%"><a id="delbutton2" href="#" class="submitbutton"  onclick="delete_nr('jycssyqzmwj','2');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业方位图:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qyfwt" class="readonly" style="width:98.7%" value=""><span id="ck_qyfwt"></span></td>
		<td id="addtd_qyfwt" align="left"><a href="#" class="submitbutton"  onclick="openfile('qyfwt');">添加</a></td>
		<td id="scantd_qyfwt" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qyfwt');">扫描</a></td>
		<td id="printtd_qyfwt" align="left"><a href="#" class="submitbutton"  onclick="printfile('qyfwt');">打印</a></td>
		<td id="deltd_qyfwt" align="left" width="50%"><a id="delbutton3" href="#" class="submitbutton"  onclick="delete_nr('qyfwt','3');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业平面图:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qypmt" class="readonly" style="width:98.7%" /><span id="ck_qypmt" ></span></td>
		<td id="addtd_qypmt" align="left"><a href="#" class="submitbutton"  onclick="openfile('qypmt');">添加</a></td>
		<td id="scantd_qypmt" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qypmt');">扫描</a></td>
		<td id="printtd_qypmt" align="left"><a href="#" class="submitbutton"  onclick="printfile('qypmt');">打印</a></td>
		<td id="deltd_qypmt" align="left" width="50%"><a id="delbutton4" href="#" class="submitbutton"  onclick="delete_nr('qypmt','4');">删除</a></td>
	</tr>
	<tr height="25">
		<td class="pagedistd1">企业外观:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="qywg" class="readonly" style="width:98.7%"  /><span id="ck_qywg"></span></td>
		<td id="addtd_qywg" align="left"><a href="#" class="submitbutton"  onclick="openfile('qywg');">添加</a></td>
		<td id="scantd_qywg" align="left"><a href="#" class="submitbutton"  onclick="scanfile('qywg');">扫描</a></td>
		<td id="printtd_qywg" align="left"><a href="#" class="submitbutton"  onclick="printfile('qywg');">打印</a></td>
		<td id="deltd_qywg" align="left" width="50%"><a id="delbutton5" href="#" class="submitbutton"  onclick="delete_nr('qywg','5');">删除</a></td>
	</tr>
	<tr id="rwxxdqtcltr" height="25">
		<td class="pagedistd1">认为需要的其他材料:</td>
		<td class="pagetd1" style="vertical-align:top;"><input type="text" id="rwxxdqtcl" class="readonly" style="width:98.7%"  /><span id="ck_rwxxdqtcl"></span></td>
		<td id="addtd_rwxxdqtcl" align="left"><a href="#" class="submitbutton"  onclick="openfile('rwxxdqtcl');">添加</a></td>
		<td id="scantd_rwxxdqtcl" align="left"><a href="#" class="submitbutton"  onclick="scanfile('rwxxdqtcl');">扫描</a></td>
		<td id="printtd_rwxxdqtcl" align="left"><a href="#" class="submitbutton"  onclick="printfile('rwxxdqtcl');">打印</a></td>
		<td id="deltd_rwxxdqtcl" align="left" width="50%"><a id="delbutton6" href="#" class="submitbutton"  onclick="delete_nr('rwxxdqtcl','6');">删除</a></td>
	</tr>
</table> 
<!-- test  -->
<div id="ZzclxxListData" style="width:100%;display:none;">
	<table id="lXctbfj" width="100%"  >
	  <thead>
	    <tr>
	     	<th name="l_tpmc">图片名称</th>
	     	<th name="l_tplx">照片类型</th>
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

<br>
<p><font id='tscon' color='red' size='5'><b>典当企业经营处所方位图、平面图及典当企业外观照片须扫描上传。</b></font></p>
<div id="printDiv" style="display:none;" align="center">     
    <img src="#" id="printImg">
</div>
</html>
