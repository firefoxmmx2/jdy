//var x=document.getElementById(ddxxzpId);
var strBase64Image="R0lGODlhegCYAKIAAAAAAP///8zMzGZmZl5eXv///wAAAAAAACH5BAEAAAUALAAAAAB6AJgAAAP/OLrc/jDKSau9S+jNu/9gKI5kaZ7Kqa5s66LDK8903aV2ru8hzv/Ami9ILMKMyGQvpmw2h85oECqt6qjW7Ayr7bK43nAJLC6DyOb0Bq1Os9vlNzwsn3fr9iw+X93zo35/T0yCaoGFSIeIRYqLU4SOdJCRd5OUepaXfZmagJydg6BajaI0pKUyp6guqqtfn1kEHAS0tIawUrW1ArJzrTqyvbx2vza6tsfCYsXAG73KcbhRycPVbtJVz85tzMbJtrdq0BrjkuLf5V7dNeXpleff3NjTH+6j865X+Pk26/xL/5T4k4Fu1zU79szNSahuX648A41BdGikoK6DcIIRo6hE/5svjkk8wolIcNvHNsKUMfQkbpZLMyRZgJtlECbIgK9wJrqp80hPIjFXWJwZzUxKDytZlkl50VrRpeREJnUSVIVGqeGgOlOZVcyzr+S6hjHIdGoorVtN2jSa9uVatFHVPvUqwqxAnj+G2k1SNWDff3/5BW6xlypeIFxPpkk88nBet/LgxcPIVtDgEoWtXCaBrnHLDpl3fob8tjLpuXSReoZ7epnjnwBhA9mMinYp26Jwg9Ldibcm35eAUxIeibgj44uQI1JeiLnl17I9OP8znU/1idF/XN+Yncd2xd1zfF8dvh/08uMjlze/nn17U+fDpxf7nlX87vMp17e/P9X97CH5ldZfTgO2ECBqBfqUoAoHurbgCg1KgsGEFFZo4YUSJAAAOw==";
var x=document.getElementById('');
var wi=80;
var hi=114;
var gsWebToolsIDCard_initType=0;
var nationality = '';
var PickjName;
var img_object='';

    function setControlSize()
    {
 
 
    	// alert('初始化--setControlSize');
    	 //alert('初始化'+x.id);
       
        if(x!=null )
        {
          //  var wid=document.getElementById('TextBox1');
          //  var hei=document.getElementById('TextBox2');
            
            //x.SetPictureSize(wid.value,hei.value);
           // x.SetPictureSize(80,114);
            x.SetPictureSize(wi,hi);
        }
    }
 
    function setControlParameter(isch)
    {
        
        if(x!=null )
        {
        
            var ret;
            if(isch)
                //ret=x.ControlCanOperation(150, -1, 0, 0, 4.5, 3);
                ret=x.ControlCanOperation(150, -1, 0, 0,4.5, 3);
            else
                ret=x.ControlCanOperation(150, -1, 0, 0, 8.36, 5.82);
            if(!ret){
                //alert("控件初始化错误");
                }
            else{
               // //alert(x.id+"控件初始成功");
            }
        }
        return false ;
    }
    
    function FileSelect()
    {
        if(x!=null)
        {
             x.FileClick();
        }
    }
    
    
    function ScanOne()
    {
        if(x!=null)
        {
            x.OneScanClick();
        }
    }
    
    function DeleteImg(ob,temp)//最后一个参数用于点击取消照片时，清空提交的照片数据
    {
		
    	x=document.getElementById(ob);
    	$('#div_'+x.id).hide();
		$('#img_'+x.id).attr('src','images/pic.gif').show();
        if(x!=null)
        {
             x.DeleteImgClick();
          //   deleteDate(x);
        }
        if(temp=="jjr"){
			$("#lj_jjrzpdata").val("");
			$("#pjjbxxmod_jjrzpdata").val("");
		}else{
			$("#lj_sjrzpdata").val("");
			$("#pjjbxxmod_sjrzpdata").val("");
		}
    }
    
    function SaveasImage()
    {
        if(x!=null )
        {
            x.SaveAsClick();
        }
    }
    
    function handScan()
    {
         if(x!=null)
         {
             x.HandScanClick()
         }
    }
    function selectDevice()
    {
        if(x!=null)
        {
            x.DeviceScanSelectClick();
        }
    }
    
    function selectDeviceType()
    {
        if(x!=null)
        {
        	 //alert(x.id+"加载模式为6");
            var dt=6;//document.getElementById('TextBox3');
            x.SetDeviceType=6;
           
        }
        
    }
    
    function MultScan()
    {
        if(x!=null)
        {
            x.MultScanClick();
        }
    }
    
    function UpMult()
    {
        if(x!=null)
        {
            x.UpMultScan();
        }
    }
    function DownMult()
    {
        if(x!=null )
        {
            x.DownMultScan();
        }
    }
    
    function DeviceOneScan()
    {
        if(x!=null )
        {
            x.Other_onscan();
        }
    }
    function DeviceOnescanOcr(ob,kuan,gao,gj,temp)//最后一个参数用于判断回调函数使用
    {
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
        if(x!=null)
        {
            x.Other_onscanocr();
            x=formatSfzDate(x);
            if(temp==null || temp ==""){
		  		updatePicture(x);
		  	}else{
		  		if(temp=="jjr"){
		  			updatePicturejjr(x);
		  		}else{
		  			updatePicture(x);
		  		}
		  	}
            
         GetBigImage(x);
        }
    }
    
    function DeviceSfzOnescan(ob,kuan,gao,gj)
    {
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
        if(x!=null)
        {
        	x.Other_onscanocr();
        	x=formatSfzDate(x);
            updatePicture(x);
        	x.Other_onscan();
        	setPicture(x);
            GetBigImage(x);
        }
    }
    ///////////////////////////////
   
    
    function DeviceTwoscan()
    {
        if(x!=null)
        {
            x.Other_twoscan();
        }
    }
    
    function sanTwoOcrAddValue(ob,kuan,gao,gj,temp){//第三个参数用于判断回调函数

    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
   		DeviceTwoscanOcr(temp);
    	
    }
    
    function DeviceSfzTwoscan(ob,kuan,gao,gj,zf)
    {
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
        if(x!=null)
        {
        	x.Other_twoscanocr();
        	x=formatSfzDate(x);
        	updatePicture(x);
        	x.Other_twoscan();
        	setPicture(x,zf);
            GetBigImage(x);
        }
    }
    
    function DeviceTwoscanOcr(temp)
    {
    	 
    		
        if(x!=null)
        {
        	// //alert(ob.id);
        	//x=ob;
        	

        x.Other_twoscanocr();
        }
        x=formatSfzDate(x);
        if(temp==null || temp ==""){
	  		updatePicture(x);
	  	}else{
	  		if(temp=="jjr"){
	  			updatePicturejjr(x);
	  		}else{
	  			updatePicture(x);
	  		}
	  	}
         GetBigImage(x);
    }
    
    
    function Devicedriveridscan()
    {
        if(x!=null)
        {
            x.Other_driveridscan();
        }
    }
    
    
    /*function DevicedriveridscanOcr()
    {
        if(x!=null)
        {
            x.Other_driveridscanocr();
        }
    }*/
    function DevicedriveridscanOcr(ob,kuan,gao,gj){
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
    	if(x!=null){
    		x.Other_driveridscanocr();
    	}
    	x=formatSfzDate(x);
    	updatePicture(x);
    	GetBigImage(x);
    }
    
    
    function Devicepassportscan()
    {
        if(x!=null)
        {
            x.Other_passportscan();
        }
    }
    
    
    function Devicepassportscanocr(ob,kuan,gao,gj,temp)
    {
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	picFlg=gj;
    	setControlSize();
   		setControlParameter(gj);
   		selectDeviceType();
        if(x!=null)
        {
            x.Other_passportscanocr();
            x=formatSfzDate(x);
             if(temp==null || temp ==""){
 		  		updatePicture(x);
 		  	}else{
 		  		if(temp=="jjr"){
 		  			updatePicturejjr(x);
 		  		}else{
 		  			updatePicture(x);
 		  		}
 		  	}
         GetBigImage(x);
        }
    }
    
    function DeviceOther_Common()
    {
        if(x!=null)
        {
            x.Other_Common();
        }
    }
    
    function SetFocusRoom()
    {
        //每次载入图片会激发，原来用于临存设置焦点，可以不操作
    }
    
    function GetIdentityInfo()//激发的事件，识别扫描后通过属性获取识别结果，中国人

    {
        var strsb;
        if(x!=null)
        {
            strsb=x.ocrCName + x.ocrCSex + x.ocrBirth + x.ocrIdentityId + x.ocrAddR + x.ocrCRange + x.ocrCNation;
           // //alert(strsb );
        }
    }
    
    function GetPassportInfo()//激发的事件，识别扫描后通过属性获取识别结果，外国人

    {
        var strsb;
         if(x!=null)
        {
            strsb=x.ocrCName + x.ocrCSex + x.ocrBirth + x.ocrIdentityId + x.ocrHomeLand +  x.ocrCIdType
           // //alert(strsb );
        }
    }
    
    function GetBigImage(x)//得到整个大图片的base64
    {
        var strBase64Image;
   
        if(x!=null)
        {
            //strBase64Image=x.GetImage();
            ////alert(strBase64Image);
        }
        
    }
    
    function GetSmallImage()//在有框取的情况下得到框取的小图片的base64
    {
        var strBase64Image;
        if(x!=null)
        {
            strBase64Image =x.GetSmallImage();
        }
    }
    
    function SetImage(url,recordsno,tablename)
    //从指定的表，记录序号里获得图片然后显示，必须配合网页使用，网页传入格式为：strUrl & "?Sno=" & recordsno & "&TableName=" & tablename
    //传出格式为：<Image>base64image</Image><Pos>top,left,width,height</Pos> 不需要显示框则<Pos></Pos>之间为字符串NOPOS
    {
        if(x!=null)
        {
            x.SetImage(recordsno , tablename , "http://223.255.1.6/HotelBs/getimage.aspx")
        }
    }
    
    function SetImageCenter(base64string)//把1个base64字串图片在控件中显示出来此接口为bmp，只能传入bmp的base64字串
    {
        if(x!=null)
        {
             x.SetImageEdz(base64string );
        }
    }
    
    function SetShapVisable(bvisible)
    {
        if(x!=null )
        {
            x.SetSharpVisible=bvisible;
        }
    }
    //初始化

       
		//selectDevice();
    
    	 function addFun(divAdd){
		  	var m=document.getElementById("div_"+divAdd);
		  	var ming=document.getElementById("img_"+divAdd);
		  	m.style.display='block';
		  	ming.style.display='none';
		  }
    
    // 摄像
    function DeviceCamera(ob,kuan,gao,gj){
    	x=document.getElementById(ob); 
    	wi=kuan;
    	hi=gao;
    	ret=x.ControlCanOperation(150, -1, 0, 0,4.5, 3);
        if(x!=null){
            x.OneScanClick();
            setControlSize();
            setPictureBack(x);
            //$("input[id$='fileload']").val(x.GetImage());
        }
    }
    // 文件
    function SelectFile(ob){
        x=document.getElementById(ob); 
        if(x!=null)
        {
             x.FileClick();
             setControlSize();
             setPictureBack(x);
             //$("input[id$='fileload']").val(x.GetImage());
        }
    }
    // 选择设备
    function SelectDevices(ob){
        x=document.getElementById(ob); 
        if(x!=null)
        {
            x.DeviceScanSelectClick();
        }
    }
    function opencard(CardName,temp){//第二个参数，用于判断回调函数用到
        var IDCard;
        PickjName=CardName;
        IDCard = document.getElementById('IDCard_'+CardName);    
        if(gsWebToolsIDCard_initType == 99){
        	return ;
        }  
        IDCard.Init(true,0);
        var sexTitle='';
        if(IDCard.InitOK)
        {
        	if(IDCard.getSex()=='1'){
        		sexTitle='男';
        	}else if(IDCard.getSex()=='2'){
        		sexTitle='女';
        	}
        	nationality = IDCard.getNationText() + "族";
        	x={ocrCName:IDCard.getName(),
        	   id:CardName,
        	   ocrCSex:sexTitle,
        	   ocrBirth:IDCard.getBIRTH(),
        	   ocrIdentityId:IDCard.getIDC(),
        	   ocrAddR:IDCard.getADDRESS(),
        	   ocrCNation:IDCard.getNation(),
        	   GetImage:function(){
        	   	return IDCard.getPhoto();
        	   }};
        	img_object= document.getElementById('img_'+CardName).src = '';
        	setTimeout('ysjz()',10);
        	
		  	var m=document.getElementById("div_"+CardName);
		  	$('#div_'+CardName).hide();
		  	$('#img_'+CardName).show();
		  	x=formatSfzDate(x);
		  	if(temp==null || temp ==""){
		  		updatePicture(x);
		  	}else{
		  		if(temp=="jjr"){
		  			updatePicturejjr(x);
		  		}else{
		  			updatePicture(x);
		  		}
		  	}
            
        }
        //else{
        //	document.getElementById('tName').value = 'error';
        //}
        	
   
}
function ysjz(){
	if (detectOS()=="Win7"){
		img_object= document.getElementById('img_'+PickjName).src = 'C:\\AERO_INFO\\edzzp.bmp';
	}else{
		img_object= document.getElementById('img_'+PickjName).src = 'C:\\Program Files\\AERO_INFO\\edzzp.bmp';
	}
}
//判断系统类型函数：Windows、Mac、Linux、Unix
function detectOS() {  

	 var sUserAgent = navigator.userAgent;  

	 var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");  

	 var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");          if (isMac)  

	 return "Mac";  

	 var isUnix = (navigator.platform == "X11") && !isWin && !isMac;  

	 if (isUnix) return "Unix";  

	 var isLinux = (String(navigator.platform).indexOf("Linux") > -1);  

	 if (isLinux) return "Linux";  

	 if (isWin) {  

		 var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;  
	
		 if (isWin2K) return "Win2000";  
	
		 var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;  
	
		 if (isWinXP) return "WinXP";  
	
		 var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;  
	
		 if (isWin2003) return "Win2003";  
	
		 var isWin2003 = sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;  
	
		 if (isWin2003) return "WinVista";  
	
		 var isWin2003 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1;  
	
		 if (isWin2003) return "Win7";  
	 }  
	 return "other";  

	 }  



function formatSfzDate(x){
	var Birth=x.ocrBirth;
	var ids=Birth.split('-');
	if(ids.length==3){
		if(ids[1].length==1){
			ids[1]="0"+ids[1];
		}
		if(ids[2].length==1){
			ids[2]="0"+ids[2];
		}
	}
	
	y={ocrCName:x.ocrCName,
        	   id:x.id,
        	   ocrCSex:x.ocrCSex,
        	   ocrBirth:ids[0]+"-"+ids[1]+"-"+ids[2],
        	   ocrIdentityId:x.ocrIdentityId,
        	   ocrAddR:x.ocrAddR,
        	   ocrCNation:x.ocrCNation,
        	   GetImage:function(){
        	   return x.GetImage();
        	   }
        	   }
     return y;
}