package com.aisino2.jdy.action;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.aisino2.common.ImageUtil;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jddxzpxx;
import com.aisino2.jdy.service.IJddxzpxxService;


/**
 * 人员照片action
 * @author renhao
 */
public class JddxzpxxAction extends PageAction{
	
	private IJddxzpxxService jddxzpxxService;
    
	public void setJddxzpxxService(IJddxzpxxService jddxzpxxService) {
		this.jddxzpxxService = jddxzpxxService;
	}

	// 根据id查询照片
	public void queryZp() throws Exception {
		OutputStream out =null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpServletRequest requeset = ServletActionContext.getRequest();
			String zpid = requeset.getParameter("zpid");
			Jddxzpxx zhaopianTemp = new Jddxzpxx();
			if(!"".equals(zpid)){
				zhaopianTemp.setId(Integer.valueOf(zpid));
			}
			zhaopianTemp =  jddxzpxxService.get(zhaopianTemp);

			response.setCharacterEncoding("UTF-8");
			response.setContentType("image/jpeg");
			 out = response.getOutputStream();
			byte[] by;
			if (zhaopianTemp != null) {
				by = zhaopianTemp.getZpnr();
				if (by == null || by.length == 0) {
					sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
					by = base64Decoder.decodeBuffer(ImageUtil.picConTemp);
				}
				out.write(by);
			} else {
				sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
				by = base64Decoder.decodeBuffer(ImageUtil.picConTemp);
				out.write(by);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
    		if(out!=null){
    			out.close();
    		}
    	}
	}
}
