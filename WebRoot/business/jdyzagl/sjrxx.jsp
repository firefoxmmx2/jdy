<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function updatePicture(y){
	alert("难道没执行呀");
	$("#lj_sjrxm").val("");//姓名
	$("#lj_sjrzjlx").val("");//证件类型
	$("#lj_sjrzjhm").val("");//证件号码
	//getHjsxDD(x.ocrIdentityId,"dm_xzqh","lj_jjrssx","jjrssxmc");//从身份号码中得到户籍省县
	$("#sjrssxmc").val("");//寄件地址
	$("#lj_sjrxxdz").val("");//详细地址
	$("#lj_sjrzpdata").remove();//照片
	
    $("#lj_sjrxm").val(y.ocrCName);//姓名
	$("#lj_sjrzjlx").val("身份证");//证件类型
	$("#lj_sjrzjhm").val(y.ocrIdentityId);//证件号码
	getHjsxDD(y.ocrIdentityId,"dm_xzqh","lj_sjrssx","sjrssxmc");//从身份号码中得到户籍省县
	//$("#jjrssxmc").val(x.ocrAddR);//寄件地址
	$("#lj_sjrxxdz").val(y.ocrAddR);//详细地址
	$("#lj_sjrzpdata").val(y.GetImage());//照片
}
</script>
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
						<td class="red">证件号码</td>
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
