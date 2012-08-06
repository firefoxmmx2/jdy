/*
*方法：html table 导出excel 带设置列属性和删除指定列功能
*tableid：导出table的id
*MaxColumns:表的最大列数（要导出的）
*headCount：表头行数
*delInfo:要删除的列号
*colStyle:要设置的列样式  格式jason如下：var colStyle ={"col":[{"cNum":changecol,"cStyle":"0.00%"}]}
*/
function expExcel(tableid,MaxColumns,headCount,delInfo,colStyle) {
    window.clipboardData.setData("Text",document.all(tableid).outerHTML);   
    try{   
        var ExApp = new ActiveXObject("Excel.Application"); 
    }catch(e){   
	    alert(e);
        alert("请正确安装Microsoft Excel软件或设置IE的安全选项！");   
        return false;  
    }    
    var ExWBk = ExApp.workbooks.add();   
    var ExWSh = ExWBk.worksheets(1);   
    var ExWCe = ExWBk.ActiveSheet; 
    ExApp.DisplayAlerts = false;  
    ExApp.visible = true;  
    ExApp.UserControl = true; 
    
    ExWSh.Paste;//粘贴
    if(typeof(delInfo) != "undefined" && delInfo != null){
        if(delInfo!=0){
            ExWSh.Columns(delInfo).Clear;//清除指定列
        }
    }
    //设置单元格格式
    ExWCe.Range( ExWCe.Cells(1,1),ExWCe.Cells(headCount,MaxColumns)).Font.Name="黑体";
    ExWCe.Range( ExWCe.Cells(1,1),ExWCe.Cells(headCount,MaxColumns)).Font.Bold=true;
    ExWCe.Range( ExWCe.Cells(1,1),ExWCe.Cells(headCount,MaxColumns)).Font.Size=14;
    ExWCe.Range( ExWCe.Cells(1,1),ExWCe.Cells(ExWSh.Rows.Count,MaxColumns)).Borders.LineStyle=1;
    
    ExWCe.Columns.AutoFit;
    ExWCe.Columns.NumberFormatLocal="##############";
    ExWCe.Columns.NumberFormatLocal="0";
    //设置指定列格式
    if(typeof(colStyle) != "undefined" && colStyle != null){
    	for(i = 0;i<colStyle.col.length; i++){
    		ExWCe.Columns(colStyle.col[i].cNum).NumberFormatLocal=colStyle.col[i].cStyle;
    	}
    } 
   
}