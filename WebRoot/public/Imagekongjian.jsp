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
	String idCardPic="IDCard_"+pic;
	String imgTobase="ImgerToBase_"+pic;
 %>
<body>
     <table>
            <tr >
                    <td  width="19%" rowspan="4" align="right" >
                    <img id="img_<%=pic %>" src="images/pic.gif" width="80" height="114" />
                     <div id="div_<%=pic %>" style="display: none;">
	<!-- 打印控件 -->
			<jsp:include page="gsPicture.jsp">
				<jsp:param name="objid" value="<%=pic %>" />
			</jsp:include>
			
	  </div> 
	  <div  style="left:0px;top:0px;position:absolute;border:solid 1px black;display:none;">
		<jsp:include page="gsWebTools-IDCard.jsp">
			<jsp:param name="objid" value="<%=idCardPic %>" />
		</jsp:include>

</div>
                    </td>
                    <td width="13%" rowspan="4" align="center" class="detailtd">
               <div id="yc_<%=pic %>" > 
             <table   width="64%" align="center"  border="0" cellspacing="0" cellpadding="4">
                
                   <%
                   	if("true".equals(zh)){
                    
                    %>
                     <tr>
                   <td align="center" ><a href="#" onclick="opencard('<%=pic %>');return false;" class="submitlongbutton">二代证读取</a></td>
                  </tr>
                     <tr>
                    <td align="center" ><a href="#" onclick="sanTwoOcrAddValue('<%=pic %>',<%=wi %>,<%=hi %>,<%=zh%>);return false;" class="submitlongbutton">二代证扫描</a></td>
                  </tr>
                  <tr>
                    <td align="center" ><a href="#" onclick="DeviceOnescanOcr('<%=pic %>',<%=wi %>,<%=hi %>,<%=zh%>);return false;" class="submitlongbutton">一代证扫描</a></td>
                  </tr>
                  <%
                  	}
                  	if("false".equals(zh)){
                  	
                  	
                   %>
                    <tr>
                    <td align="center" ><a href="#" onclick="Devicepassportscanocr('<%=pic %>',<%=wi %>,<%=hi %>,<%=zh%>);return false;" class="submitlongbutton">外国证件读取</a></td>
                  </tr>
                   <%
                   	}
                    %>
                    <tr>
                  <td align="center" ><a href="#"  onclick="SelectFileImg_<%=pic %>('<%=pic %>');return false;"  class="submitlongbutton">文 件</a></td>
                 </tr>
                  <tr>
                    <td align="center" ><a href="#" onclick="DeleteImg('<%=pic %>');return false;"  class="submitlongbutton">取 消</a></td>
                  </tr>
              </table>
              </div>
              </td>    
               </tr>
            </table>
</body>
<jsp:include page="ImgerToBase64.jsp">
	<jsp:param name="objid" value="<%=imgTobase %>" />
</jsp:include>

<script>
//文件
function SelectFileImg_<%=pic %>(ob){
    	ImgerToBase_<%=pic %>.SetFileSize= 3000;
    	ImgerToBase_<%=pic %>.SetFileSizeA(1000);
    	ImgerToBase_<%=pic %>.OpenFileShrinkPic();
    	x={id:ob,
           GetImage:function(){
         	   return ImgerToBase_<%=pic %>.getBase64();
           }
         }
    	var ImgerToBase_filePath = ImgerToBase_<%=pic %>.getFile();
    	if(ImgerToBase_filePath == null||ImgerToBase_filePath == ''||ImgerToBase_filePath == 'null'){
			return ;
        }else{
    		setPictureBack(x);
        }
}
</script>