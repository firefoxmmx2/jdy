<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pdbzw=request.getParameter("pdbzw");
%>
<script type="text/javascript">
$(document).ready(function() {	
	//判断是揽件调用还是派件调用
}); 
function updatePicturejjr(x){
	if($("#pdbzw").val()=="ljjbxx"){
		$("#lj_jjrxm").val("");//姓名
		$("#lj_jjrzjlx").val("");//证件类型
		$("#lj_jjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		 //$("#jjrssxmc").val("");//寄件地址
		$("#lj_jjrxxdz").val("");//详细地址
		$("#lj_jjrzpdata").val("");//照片
		
		
	    $("#lj_jjrxm").val(x.ocrCName);//姓名
		$("#lj_jjrzjlx").val("身份证");//证件类型
		$("#lj_jjrzjhm").val(x.ocrIdentityId);//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		//$("#lj_jjrxxdz").val(x.ocrAddR);//详细地址
		$("#lj_jjrzpdata").val(x.GetImage());//照片
		
	}else if($("#pdbzw").val()=="pjxxadd"){
		$("#pjxxadd_jjrxm").val("");//姓名
		$("#pjxxadd_jjrzjlx").val("");//证件类型
		$("#pjxxadd_jjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		//$("#pjxxadd_jjrssxmc").val("");//寄件地址
		$("#pjxxadd_jjrxxdz").val("");//详细地址
		$("#pjxxadd_jjrzpdata").val("");//照片
		
		
	    $("#pjxxadd_jjrxm").val(x.ocrCName);//姓名
		$("#pjxxadd_jjrzjlx").setValue("身份证");//证件类型
		$("#pjxxadd_jjrzjhm").val(x.ocrIdentityId);//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","pjxxadd_jjrssxdm","pjxxadd_jjrssx");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		//$("#pjxxadd_jjrxxdz").val(x.ocrAddR);//详细地址
		$("#pjxxadd_jjrzpdata").val(x.GetImage());//照片
	}else if($("#pdbzw").val()=="pjjbxxmod"){
		$("#pjjbxxmod_jjrxm").val("");//姓名
		$("#pjjbxxmod_jjrzjlx").val("");//证件类型
		$("#pjjbxxmod_jjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		//$("#pjjbxxmod_jjrssxmc").val("");//寄件地址
		$("#pjjbxxmod_jjrxxdz").val("");//详细地址
		$("#pjjbxxmod_jjrzpdata").val("");//照片
		
		
	    $("#pjjbxxmod_jjrxm").val(x.ocrCName);//姓名
		$("#pjjbxxmod_jjrzjlx").setValue("身份证");//证件类型
		$("#pjjbxxmod_jjrzjhm").val(x.ocrIdentityId);//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","pjjbxxmod_jjrssxdm","pjjbxxmod_jjrssx");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		//$("#pjjbxxmod_jjrxxdz").val(x.ocrAddR);//详细地址
		$("#pjjbxxmod_jjrzpdata").val(x.GetImage());//照片
	}
	
}
//删除照片信息
function deleteDate(obj){
	$("#lj_jjrzpdata").val("");
}
//有添加照片按钮时 选择文件
function open_zp(){
	  imgToBase(ImgerToBase1,"img_picControlscr","lj_jjrzpdata");
}
</script>
<input type="hidden" id="lj_jjr_zpxx_zpid" name="lj.jjr.zpxx.id" value=""><!-- 寄件人照片信息ID -->
<input type="hidden" id="lj_jjrzpdata" name="lj.jjrzpxx" value=""><!-- 寄件人照片信息 -->
<input type="hidden" name="pdbzw" id="pdbzw" value="<%=pdbzw %>"/>
         <fieldset>
		 <legend>寄件人信息</legend>
		 <table width="100%" > 
			<tr>
				<td>
				  <table>
				    <tr>
					    <td class="red">寄件人姓名</td>
						<td class="detailtd"><input type="text" id="lj_jjrxm" name="lj.jjr.xm" class="inputstyle" value="" /></td>
				    </tr>
				    <tr height="20">
						<td class="distd">证件类型</td>
						<td class="detailtd">
					          <select id="lj_jjrzjlx">
								<option></option>
							  </select>
						</td>
					</tr>
					<tr height="20">
						<td class="distd">证件号码</td>
						<td class="detailtd"><input type="text" id="lj_jjrzjhm" name="lj.jjr.zjhm" class="inputstyle" value="" /></td>
					</tr>
<!--					<tr height="20">-->
<!--						<td class="red">寄件地址</td>-->
<!--						<td class="detailtd"><input type="text" id="jjrssxmc"  class="inputstyle" value="" /></td>-->
<!--					</tr>-->
				  </table>
				 </td>
				 <td>
				    <div>
					  <jsp:include page="../../business/jdyzagl/saomiaoyiPictureJdyjjr.jsp?zh=true&mo=2&pic=picControlscrjjr&wi=80&hi=114&file=true" flush="tru"></jsp:include>
					</div>
				 </td>
			 </tr>
			 <tr>
			 <td colspan="2">
			   <table>
			     <tr height="20">
					<td class="red">寄件地址</td>
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="lj_jjrxxdz"  name="lj.jjr.xxdz" /></td>
				 </tr>
				 <tr height="20">
					<td class="distd">单位名称</td>
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="lj_jjrdw"    name="lj.jjr.dw" /></td>
				</tr>
			    <tr height="20">
					<td class="red">手机</td>
					<td><input type="text" id="lj_jjrlxdh" name="lj.jjr.lxdh" style="width:80px" value="" /></td>
					<td>固话</td>
					<td><input type="text" id="lj_jjrgddh" name="lj.jjr.gddh" style="width:80px" value="" /></td>
				 </tr>
			   </table>
			   </td>
			   </tr>
		 </table>
		 </fieldset>
