<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		ryid=dataid;
		$("#Bgimgshow").attr('src','icksystem/queryTp_icksl.action?ryId='+ryid);
	});
</script>
<input type="hidden" id="all_ryid">
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
	      <td align="left" class="title1"></td>
	      <td align="right"><a href="#" id="closeDiv" onclick='$("#Bigimage").hideAndRemove("show");'class="close"></a></td>
		</tr>
	</table>
	<table>
		<tr>
			<td width="100%" align="center">
				<img id="Bgimgshow"   width="800" height="450" /></td>
		</tr>
	</table>
</body>
