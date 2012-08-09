<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

         <fieldset>
		 <legend>寄件人信息</legend>
		 <table width="100%" >
			<tr>
				<td>
				  <table>
				    <tr>
					    <td class="red">寄件人姓名</td>
						<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
				    </tr>
				    <tr height="20">
						<td class="red">证件类型</td>
						<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
					</tr>
					<tr height="20">
						<td class="red">证件号码</td>
						<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
					</tr>
					<tr height="20">
						<td class="red">寄件地址</td>
						<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
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
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="t_xzdxz"  ></td>
				 </tr>
				 <tr height="20">
					<td class="distd">单位名称</td>
					<td class="detailtd" colspan="5"><input type="text" style="width:220px"  id="t_xzdxz"  ></td>
				</tr>
			    <tr height="20">
					<td class="red">手机</td>
					<td><input type="text" id="a_gwyqcqzbm" style="width:80px" value=""></td>
					<td>固话</td>
					<td><input type="text" id="a_gwyqcqzbm" style="width:80px" value=""></td>
				 </tr>
			   </table>
			   </td>
			   </tr>
		 </table>
		 </fieldset>
