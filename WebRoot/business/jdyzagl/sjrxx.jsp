<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pdbzw=request.getParameter("pdbzw");
%>
<script type="text/javascript">
function updatePicture(y){
	if($("#pdbzw").val()=="ljjbxx"){
		$("#lj_sjrxm").val("");//姓名
		$("#lj_sjrzjlx").val("");//证件类型
		$("#lj_sjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		$("#sjrssxmc").val("");//寄件地址
		$("#lj_sjrxxdz").val("");//详细地址
		$("#lj_sjrzpdata").val("");//照片
		
	    $("#lj_sjrxm").val(y.ocrCName);//姓名
		$("#lj_sjrzjlx").val("身份证");//证件类型
		$("#lj_sjrzjhm").val(y.ocrIdentityId);//证件号码
		getHjsxDD(y.ocrIdentityId,"dm_xzqh","lj_sjrssx","sjrssxmc");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		$("#lj_sjrxxdz").val(y.ocrAddR);//详细地址
		//$("#lj_sjrzpdata").val(y.GetImage());//照片
		$("#lj_sjrzpdata").val(y.GetImage());//照片
		
	}else if($("#pdbzw").val()=="pjxxadd"){
		$("#pjxxadd_sjrxm").val("");//姓名
		$("#pjxxadd_sjrzjlx").val("");//证件类型
		$("#pjxxadd_sjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		$("#pjxxadd_sjrssxmc").val("");//寄件地址
		$("#pjxxadd_sjrxxdz").val("");//详细地址
		$("#pjxxadd_sjrzpdata").val("");//照片
		
	    $("#pjxxadd_sjrxm").val(y.ocrCName);//姓名
		$("#pjxxadd_sjrzjlx").setValue("身份证");//证件类型
		$("#pjxxadd_sjrzjhm").val(y.ocrIdentityId);//证件号码
		getHjsxDD(y.ocrIdentityId,"dm_xzqh","pjxxadd_jjrssxdm","pjxxadd_sjrssx");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		$("#pjxxadd_sjrxxdz").val(y.ocrAddR);//详细地址
		$("#pjxxadd_sjrzpdata").val(y.GetImage());//照片
	}else if($("#pdbzw").val()=="pjjbxxmod"){
		$("#pjjbxxmod_sjrxm").val("");//姓名
		$("#pjjbxxmod__sjrzjlx").val("");//证件类型
		$("#pjxxadd_sjrzjhm").val("");//证件号码
		//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
		$("#pjjbxxmod_sjrssxmc").val("");//寄件地址
		$("#pjjbxxmod_sjrxxdz").val("");//详细地址
		$("#pjjbxxmod_sjrzpdata").val("");//照片
		
	    $("#pjjbxxmod_sjrxm").val(y.ocrCName);//姓名
		$("#pjjbxxmod_sjrzjlx").setValue("身份证");//证件类型
		$("#pjjbxxmod_sjrzjhm").val(y.ocrIdentityId);//证件号码
		getHjsxDD(y.ocrIdentityId,"dm_xzqh","pjjbxxmod_jjrssxdm","pjjbxxmod_sjrssx");//从身份号码中得到户籍省县
		//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
		$("#pjjbxxmod_sjrxxdz").val(y.ocrAddR);//详细地址
		$("#pjjbxxmod_sjrzpdata").val(y.GetImage());//照片
	}
	
	
}
//删除照片信息
function deleteDate(obj){
	$("#lj_sjrzpdata").val("");
}
//有添加照片按钮时 选择文件
function open_zp(){
	  imgToBase(ImgerToBase1,"img_picControlscr","lj_sjrzpdata");
}
</script>
<input type="hidden" id="lj_sjr_zpxx_zpid" name="lj.sjr.zpxx.id" value=""><!-- 收件人照片信息ID -->
<input type="hidden" id="lj_sjrzpdata" name="lj.sjrzpxx" value=""><!-- 收件人照片信息 -->
<input type="hidden" name="pdbzw" id="pdbzw" value="<%=pdbzw %>"/>
         <fieldset>
		 <legend>收件人信息</legend>
		 <table width="100%" >
			<tr>
				<td>
				  <table>
				    <tr>
					    <td class="red">收件人姓名</td>
						<td class="detailtd"><input type="text" id="lj_sjrxm"   name="lj.sjr.xm" class="inputstyle" value="" /></td>
				    </tr>
				    <tr height="20">
						<td class="red">证件类型</td>
						<td class="detailtd">
					          <select id="lj_sjrzjlx">
								<option></option>
							  </select>
						</td>
					</tr>
					<tr height="20">
						<td class="distd">证件号码</td>
						<td class="detailtd"><input type="text" id="lj_sjrzjhm" name="lj.sjr.zjhm" class="inputstyle" value="" /></td>
					</tr>
					<tr height="20">
						<td class="red">收件地址</td>
						<td class="detailtd"><input type="text" id="sjrssxmc"  class="inputstyle" value="" /></td>
					</tr>
				  </table>
				 </td>
				 <td>
				    <div>
					  <jsp:include page="../../public/saomiaoyiPictureJdy.jsp?zh=true&mo=2&pic=picControlscr&wi=80&hi=114&file=true" flush="true"></jsp:include>
					</div>
				 </td>
			 </tr>
			 <tr>
			 <td colspan="2">
			   <table>
			     <tr height="20">
					<td class="red">现住地详址</td>
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="lj_sjrxxdz" name="lj.sjr.xxdz"  /></td>
				 </tr>
				 <tr height="20">
					<td class="distd">单位名称</td>
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="lj_sjrdw" name="lj.sjr.dw"  /></td>
				</tr>
			    <tr height="20">
					<td class="red">手机</td>
					<td><input type="text" id="lj_sjrlxdh"   name="lj.sjr.lxdh" style="width:80px" value="" /></td>
					<td>固话</td>
					<td><input type="text" id="lj_sjrgddh"   name="lj.sjr.gddh" style="width:80px" value="" /></td>
				 </tr>
			   </table>
			   </td>
			   </tr>
		 </table>
		 </fieldset>
