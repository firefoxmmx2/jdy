var f;
function CLASS_MSN_MESSAGE(funs,id,width,height,caption,title,message,target,action){
	 f = funs;
     this.funs = funs;
     this.id      = id;  
     this.title   = title;  
     this.caption= caption;  
     this.message= message;  
     this.target = target;  
     this.action = action;  
     this.width     = width?width:200;  
     this.height = height?height:120;  
     this.timeout= 0;  
     this.speed     = 20; 
     this.step     = 1; 
     this.right     = screen.width -1;  
     this.bottom = screen.height; 
     this.left     = this.right - this.width; 
     this.top     = this.bottom - this.height-100; 
     this.timer     = 0; 
     this.pause     = false;
     this.close     = false;
     this.autoHide     = true;
}  
  
CLASS_MSN_MESSAGE.prototype.hide = function(){  
     if(this.onunload()){  

         var offset   = this.height>this.bottom-this.top?this.height:this.bottom-this.top; 
         var me   = this;  

         if(this.timer>0){   
             window.clearInterval(me.timer);  
         }  

         var fun = function(){  
             if(me.pause==false||me.close){
                 var x   = me.left; 
                 var y   = 0; 
                 var width = me.width; 
                 var height = 0; 
                 if(me.offset>0){ 
                     height = me.offset; 
                 } 
     
                 y   = me.bottom - height; 
     
                 if(y>=me.bottom){ 
                     window.clearInterval(me.timer);  
                     me.Pop.hide();  
                 } else { 
                     me.offset = me.offset - me.step;  
                 }
                 me.Pop.show(x,y,width,height);
             }             
         }  

         this.timer = window.setInterval(fun,this.speed)      
     }  
}  
  
CLASS_MSN_MESSAGE.prototype.onunload = function() {
     return true;  
}  
CLASS_MSN_MESSAGE.prototype.oncommand = function(){  
     //this.close = true;
     this.hide();  
	//window.open("http://www.makewing.com");
   
} 
CLASS_MSN_MESSAGE.prototype.showBig = function(){

     var oPopup = window.createPopup(); //IE5.5+  
    
     this.Pop = oPopup;  
  
     var w = this.width;  
     var h = this.height;
  
     var str = "<DIV  style='border:#206199 solid 1px;background-image:url(images/window/window_titlebg.jpg);height:"+h+";width:"+w+";'>"  
         str += "<TABLE border='0' cellspacing='0' cellpadding='0' style='border:#8cbfd8 solid 1px;border-bottom:0px;'>" 
         str += "<TR>"  
         str += "<TD style='font-size:12px; padding-left:8px; padding-top:6px; font-weight:bold;></TD>"  
         str += "<TD style='font-family:'宋体';font-size:12px; padding-left:8px; vAlign=center width='100%'>" + this.caption + "</TD>"  
         str += "<TD style='PADDING-RIGHT: 2px; PADDING-TOP: 2px' vAlign=center align=right width=19>" 
         str += "<table  border='0' cellspacing='0' cellpadding='0'><tr><td><img id='btSysFresh' src='images/window/window_refresh.jpg'></td>"        
         str += "<td><img id='btSmoll'  src='images/window/window_small.jpg'></td>"
         str += "<td><img id='btSysClose' src='images/window/window_close.jpg'></td></tr></table>"  
         str += "</TD>"  
         str += "</TR>"  
         str += "<TR>"  
         str += "<TD style='PADDING-RIGHT: 1px;PADDING-BOTTOM: 1px' colSpan=3 height=" + (h-28) + ">"  
         str += "<DIV style='PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px; PADDING-BOTTOM: 8px;WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 8px; HEIGHT: 100%'>" + this.title + "<BR><BR>"  
         str += "<DIV style='font-family:'宋体';font-size:11px; padding-left:8px;color:#000000;' id='btCommand'>" + this.message + "</DIV>"  
         str += "</DIV>"  
         str += "</TD>"  
         str += "</TR>"  
         str += "</TABLE>"  
         str += "</DIV>"
         
  
  
     oPopup.document.body.innerHTML = str; 
    
  
     this.offset   = 0; 
     var me   = this;  

     oPopup.document.body.onmouseover = function(){me.pause=true;}
     oPopup.document.body.onmouseout = function(){me.pause=true;}

     var fun = function(){  
         var x   = me.left; 
         var y   = 0; 
         var width     = me.width; 
         var height     = me.height; 

             if(me.offset>me.height){ 
                 height = me.height; 
             } else { 
                 height = me.offset; 
             } 

         y   = me.bottom - me.offset; 
         if(y<=me.top){ 
             me.timeout--; 
             if(me.timeout==0){ 
                 window.clearInterval(me.timer);  
                 if(me.autoHide){
                     me.hide(); 
                 }
             } 
         } else { 
             me.offset = me.offset + me.step; 
         }
         me.Pop.show(x,y,width,height);

     }  
  
     this.timer = window.setInterval(fun,this.speed)      
  
     var btFresh = oPopup.document.getElementById("btSysFresh");
  		
     btFresh.onclick = function(){
         me.close = true;
         me.hide();
         eval(f);
     }  
     
     var btClose = oPopup.document.getElementById("btSysClose");  
  
     btClose.onclick = function(){  
         me.close = true;
         me.hide();  
     }  
     
     var btSmoll = oPopup.document.getElementById("btSmoll");
 	 btSmoll.onclick = function(){
         me.hide();
         me.close = true;
         var tempMSG = new CLASS_MSN_MESSAGE(f,"aa",20,40,"","","");  
	     tempMSG.rect(null,null,null,screen.height); 
	     tempMSG.speed = 10; 
	     tempMSG.step = 5; 
	     tempMSG.showSmoll();
     }  
     /*
     var btCommand = oPopup.document.getElementById("btCommand");  
     btCommand.onclick = function(){  
         me.oncommand();  
     }    
     
   var ommand = oPopup.document.getElementById("ommand");  
       ommand.onclick = function(){  
        //this.close = true;
     me.hide();  
	 window.open(ommand.href);
     } 
     */  
}  

CLASS_MSN_MESSAGE.prototype.showSmoll = function(){

     var oPopup = window.createPopup(); //IE5.5+  
    
     this.Pop = oPopup;  
  
     var w = this.width;  
     var h = this.height;  
  
  
     var str = "<DIV style='background-image:url(images/window/window_titlebg.jpg);height:"+h+";width:"+w+";'>"  
         str += "<table><tr><td><img id='btClose' src='images/window/window_close.png'></td></tr>"
		 str += "<tr><td><img id='btBig' src='images/window/window_big.png'></td></tr></table>"  
         str += "</DIV>"
         
     oPopup.document.body.innerHTML = str; 
    
  
     this.offset   = 0; 
     var me   = this;  
  	 
     oPopup.document.body.onmouseover = function(){me.pause=true;}
     oPopup.document.body.onmouseout = function(){me.pause=true;}

     var fun = function(){  
         var x   = me.left; 
         var y   = 0; 
         var width     = me.width; 
         var height     = me.height; 

             if(me.offset>me.height){ 
                 height = me.height; 
             } else { 
                 height = me.offset; 
             } 

         y   = me.bottom - me.offset; 
         if(y<=me.top){ 
             me.timeout--; 
             if(me.timeout==0){ 
                 window.clearInterval(me.timer);  
                 if(me.autoHide){
                     me.hide(); 
                 }
             } 
         } else { 
             me.offset = me.offset + me.step; 
         } 
         me.Pop.show(x,y,width,height);    

     }  
  
     this.timer = window.setInterval(fun,this.speed)      
  
     var btClose = oPopup.document.getElementById("btBig");  
  
  	 btClose.onclick = function(){
  	 	 me.hide();
  	 	 me.close = true;
  	 	 eval(f);
     }
     
     var btClose = oPopup.document.getElementById("btClose");  
  
     btClose.onclick = function(){
         me.close = true;
         me.hide();
     }  
     
    
     /*
     var btCommand = oPopup.document.getElementById("btCommand");  
     btCommand.onclick = function(){  
         me.oncommand();  
     }    
     
   var ommand = oPopup.document.getElementById("ommand");  
       ommand.onclick = function(){  
        //this.close = true;
     me.hide();  
	 window.open(ommand.href);
     } 
     */  
} 


CLASS_MSN_MESSAGE.prototype.speed = function(s){ 
     var t = 20; 
     try { 
         t = praseInt(s); 
     } catch(e){} 
     this.speed = t; 
} 
CLASS_MSN_MESSAGE.prototype.step = function(s){ 
     var t = 1; 
     try { 
         t = praseInt(s); 
     } catch(e){} 
     this.step = t; 
} 
  
CLASS_MSN_MESSAGE.prototype.rect = function(left,right,top,bottom){ 
     try {
         this.left         = left     !=null?left:this.right-this.width; 
         this.right         = right     !=null?right:this.left +this.width; 
         this.bottom         = bottom!=null?(bottom>screen.height?screen.height:bottom):screen.height; 
         this.top         = top     !=null?top:this.bottom - this.height; 
     } catch(e){} 
} 

 
