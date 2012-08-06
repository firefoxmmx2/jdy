package com.aisino2.publicsystem.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Uploadpic;

public class UploadpicAction extends PageAction {

	private Uploadpic uploadpic = new Uploadpic();
	private List lUploadpic = new ArrayList();
	private String result = "";

	public List getlUploadpic() {
		return lUploadpic;
	}

	public Uploadpic getUploadpic() {
		return uploadpic;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * 删除文件
	 * 
	 * @param file
	 */
	public void deleteFile(File file) {
		try {
			if (file.isFile()) {

				// 只删除在30分钟前创建的文件
				if (canDeleteFile(file)) {
					if (file.delete()) {
//						log.info("文件" + file.getName() + "删除成功!");
					} else {
//						log.warn("文件" + file.getName() + "删除失败!此文件可能正在被使用");
					}
				}
			}
		} catch (Exception e) {
			log.error("删除文件失败！", e);
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param folder
	 */
	public void deleteFolder(File folder) {
		if (folder.isDirectory()) {
			File[] files = folder.listFiles();
			for (int i = 0; i < files.length; i++) {
				deleteFile(files[i]);
			}
		} else {
			deleteFile(folder);
		}

	}

	/**
	 * 三十分总前的文件及文件夹才可以删除 文件最后修改时间在30分钟前，返回ture
	 * 
	 * @param file
	 * @return
	 */
	public boolean canDeleteFile(File file) {
		Date date = new Date();
		long lastUpTime = file.lastModified() / 1000;
		long secondsOfOneMinute = 60 * 30;

		// 可删除文件的时间
		long canDelTime = date.getTime() / 1000 - secondsOfOneMinute;

		if (lastUpTime <= canDelTime) {
			return true;
		}
		return false;
	}

	public String baseToImage() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest requeset = ServletActionContext.getRequest();
		sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
		String serviceFile = ServletActionContext.getRequest().getRealPath(
				"pmtUploadTemp");
		File dir = new File(serviceFile);
		deleteFolder(dir);
		Uploadpic setUploadPic = new Uploadpic();
		uploadpic = (Uploadpic) this.setClass(setUploadPic, null);
		String imgFilePath = "";
		try {
			// Base64解码
			byte[] base64 = base64Decoder
					.decodeBuffer(uploadpic.getImagebase());

			for (int i = 0; i < base64.length; ++i) {
				if (base64[i] < 0) {// 调整异常数据
					base64[i] += 256;
				}
			}
			// 生成jpeg图片
			long nowtime = System.currentTimeMillis();
			String fileName = String.valueOf(nowtime) + ".jpg";

			imgFilePath = serviceFile + "\\" + fileName;// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(base64);
			imgFilePath = "\\" + fileName;// 新生成的图片
			uploadpic.setTempPath(imgFilePath);
			out.flush();
			out.close();
			uploadpic.setImagebase(null);
		} catch (Exception e) {
		}
		lUploadpic.clear();
		lUploadpic.add(uploadpic);
		this.result = "success";
		return "success";
	}
}
