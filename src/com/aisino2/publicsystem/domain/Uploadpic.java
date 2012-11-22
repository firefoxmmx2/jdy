package com.aisino2.publicsystem.domain;

import com.aisino2.core.domain.BaseObject;

public class Uploadpic extends BaseObject {
	
	private String tempPath; //临时路径
    
	/** 照片base64 */
	private String imagebase;
	
	public String getImagebase() {
		return imagebase;
	}

	public void setImagebase(String imagebase) {
		this.imagebase = imagebase;
	}

	public String getTempPath() {
		return tempPath;
	}

	public void setTempPath(String tempPath) {
		this.tempPath = tempPath;
	}

}
