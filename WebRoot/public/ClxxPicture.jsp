<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.cache.CacheManager" %>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%
	String zh=request.getParameter("zh");
	String pic=request.getParameter("pic");
	String wi=request.getParameter("wi");
	String hi=request.getParameter("hi");
	String mo=request.getParameter("mo");
	String url=request.getParameter("url");
	if(mo==null){
		mo="1";
	}
	if(url==null||"".equals(url)){
		url="images/pic.gif";
	}
 %>
<body>
     <table>
			<tr >
				<td  width="19%"  align="center" >
	              <img id="img_<%=pic %>" src="images/pic.gif" width="90" height="114" />
		               <div id="div_<%=pic %>" style="display: none;">
							<!-- 打印控件 -->
							<jsp:include page="gsPicture.jsp">
								<jsp:param name="objid" value="<%=pic %>" />
							</jsp:include>
						</div> 
						<div  style="left:0px;top:0px;position:absolute;border:solid 1px black;display:none;">
							<jsp:include page="gsWebTools-IDCard.jsp">
								<jsp:param name="objid" value="IDCard_<%=pic %>" />
							</jsp:include>
						</div>
				</td>
			 </tr>
			<tr>
	             <td >
		           <table   width="64%" align="center"  border="0" cellspacing="0" >
             			<tr>
							<td align="center" ><a href="#"  onclick="SelectFile('<%=pic %>');addFun('<%=pic %>');return false;"  class="submitlongbutton">选照片</a></td>
							<td align="center" ><a href="#" onclick="DeleteImg('<%=pic %>');return false;"  class="submitlongbutton">取 消</a></td>
		               </tr>
		            </table>
	         	 </td>
			</tr>
	</table>
</body>
 