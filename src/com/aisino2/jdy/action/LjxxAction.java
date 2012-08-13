package com.aisino2.jdy.action;

import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.impl.LjjbxxServiceImpl;
/**
 * 揽件信息action
 * @author renhao
 */
public class LjxxAction extends PageAction{
    
	private LjjbxxServiceImpl ljjbxxService;
	private Ljjbxx lj;
	
	
	public Ljjbxx getLj() {
		return lj;
	}
	public void setLj(Ljjbxx lj) {
		this.lj = lj;
	}
	public void setLjjbxxService(LjjbxxServiceImpl ljjbxxService) {
		this.ljjbxxService = ljjbxxService;
	}
	
	
	/**
     *揽件信息插入action
     * @author renhao
     */
	public String insert() throws Exception{
		try {
			
			ljjbxxService.insertLjjbxx(lj);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
        return "success";
    }
	
	
}