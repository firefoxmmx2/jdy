package com.aisino2.publicsystem.action;

import java.io.File;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import sun.misc.BASE64Decoder;

import com.aisino2.common.ImageUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Zzcl;
import com.aisino2.publicsystem.service.IZzclService;

public class ZzclAction extends PageAction{
	private List lZzcl=new ArrayList();
	private IZzclService zzclService;
	private String result="";
	private String tabledata="";
	private int totalrows=0;
	
	// ////////////////////////////////////////
    private String fileNamecon;
    private String base64codecon;
    private String fileTempNamecon;
    private String tplx;
    // //////////////////////////////////////////////////
	
	public String getTabledata() {
		return tabledata;
	}
	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
	}
	public int getTotalrows() {
		return totalrows;
	}
	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	public List getLZzcl() {
		return lZzcl;
	}
	public void setLZzcl(List zzcl) {
		lZzcl = zzcl;
	}

	public void setZzclService(IZzclService zzclService) {
		this.zzclService = zzclService;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public String querylist() throws Exception{
		try{
			Zzcl setZzcl = new Zzcl();
			setZzcl = (Zzcl)this.setClass(setZzcl, null);
			lZzcl = zzclService.getListZzcl(setZzcl);
			this.result="success";
		}catch(Exception e){
			this.result="查询纸质材料错误";
			e.printStackTrace();
		}
		return "success";
	}
	
	//根据zzclID查询纸质材料照片
	public void queryTp() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest requeset = ServletActionContext.getRequest();
		OutputStream out = response.getOutputStream();
		try{
        		String zzclid = requeset.getParameter("zzclid");
        		
        		Zzcl zzcl = new Zzcl();
        		zzcl.setZzclid(Integer.parseInt(zzclid));
        		zzcl=zzclService.getZzcl(zzcl);
    			response.setCharacterEncoding("UTF-8");
    			response.setContentType("image/jpeg");
    			byte [] tpnr ;
        		if(zzcl!=null){
        			tpnr = zzcl.getTpnr();
        			if(tpnr==null || tpnr.length==0){
        				sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
        				tpnr = base64Decoder.decodeBuffer(ImageUtil.picConTemp);
        			}
        		}else{
        			sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
        			tpnr = base64Decoder.decodeBuffer(ImageUtil.picConTemp);
        		}
        		out.write(tpnr);
        	}catch(Exception e){
        		e.printStackTrace();
        	}finally{
        		if(out!=null)
        			out.close();
        	}
	}
	
	public String querylistForPage() throws Exception{
		try{
			Zzcl setZzcl = new Zzcl();
			setZzcl = (Zzcl)this.setClass(setZzcl, null);
			Map map = new HashMap();
			map.put("qyid", setZzcl.getQyid());
			Page page = zzclService.getListForPage(map, pagesize, pagerow,sort, dir);
			lZzcl = page.getData();
			totalpage = page.getTotalPages();
			totalrows = page.getTotalRows();
			setTabledata(page.getData());
			this.result="success";
		}catch(Exception e){
			this.result="查询纸质材料错误";
			e.printStackTrace();
		}
		return "success";
	}
	
	public void setTabledata(List lData) throws Exception {
		List lPro = new ArrayList();
		lPro.add("zzclid");
		lPro.add("zzclid");
		lPro.add("tpmc");
		lPro.add("tplx");
		lPro.add("czlx");
		lPro.add("tplsmc");

		Zzcl setZzcl = new Zzcl();
		this.setData(setZzcl, lData, lPro, null);
		this.tabledata = this.getData();
	}

	
	public String deleteZzcl() throws Exception{
		try{
			Zzcl setZzcl = new Zzcl();
			setZzcl = (Zzcl)this.setClass(setZzcl, null);
			zzclService.deleteZzcl(setZzcl);
			this.result="success";
		}catch(Exception e){
			this.result="删除纸质材料失败";
			e.printStackTrace();
		}
		return "success";
	}
	
	/**
     * 上传临时文件
     * 
     * @return
     * @throws Exception
     */
    public String uptempfile() throws Exception {

	BASE64Decoder base64Decoder = new BASE64Decoder();
	RandomAccessFile os = null;
	String serviceFile = ServletActionContext.getRequest().getRealPath(
		"uploadTemp"); // /文件存放路径

	long nowtime = System.currentTimeMillis(); // ///根据时间得到文件名字
	String[] fjlxarray = fileNamecon.split("\\.");
	String fjlx = fjlxarray[fjlxarray.length - 1]; // //得到附件类型
	String fileTempName = String.valueOf(nowtime) + "." + fjlx;
	try {
	    byte[] bytetemp = base64Decoder.decodeBuffer(base64codecon);
	    os = new RandomAccessFile(serviceFile + "\\" + fileTempName, "rw");
	    os.write(bytetemp, 0, bytetemp.length);
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
			if (os != null) {
			    os.close();
			}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}
	fileTempNamecon = fileTempName; // ///把临时文件的名字回传给页面
	base64codecon = "";
	this.result = "success";
	return "success";

    }
    
    /**
     * 删除单条临时文件
     * 
     * @return
     * @throws Exception
     */
    public String deleteFile() throws Exception {

		String serviceFile = ServletActionContext.getRequest().getRealPath(
			"uploadTemp"); // /文件存放路径
		File file = new File(serviceFile + "\\" + fileTempNamecon);
		if (file.exists()) {
		    file.delete(); // 删除文件
		}
	
		this.result = "success";
		return "success";
    }
	public String getFileNamecon() {
		return fileNamecon;
	}
	public void setFileNamecon(String fileNamecon) {
		this.fileNamecon = fileNamecon;
	}
	public String getBase64codecon() {
		return base64codecon;
	}
	public void setBase64codecon(String base64codecon) {
		this.base64codecon = base64codecon;
	}
	public String getFileTempNamecon() {
		return fileTempNamecon;
	}
	public void setFileTempNamecon(String fileTempNamecon) {
		this.fileTempNamecon = fileTempNamecon;
	}
	public String getTplx() {
		return tplx;
	}
	public void setTplx(String tplx) {
		this.tplx = tplx;
	}
}
