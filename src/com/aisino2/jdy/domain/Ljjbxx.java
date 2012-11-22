package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;

/**
 * 揽件基本信息
 * @author hooxin
 *
 */
/**
 * @author hooxin
 *
 */
public class Ljjbxx implements Serializable {
    /**
     * #登记序号 主键
     */
    private String djxh;
    /**
     * #寄件人实体，关联寄件人收件人实体
     */
    private Rdrjbxx jjr;
    /**
     * #收件人实体，关联寄件人收件人实体
     */
    private Rdrjbxx sjr;
    /**
     *  #揽件人 （从业人员实体）
     */
    private Qyryxx ljr;
    /**
     * #揽件时间 年月日 
     */
    private Date ljsj;
    /**
     *  #揽件填报时间 年月日 默认当前时间
     */
    private Date ljtbsj;
    /**
     * #揽件填报人 关联从业人员实体 默认为当前用户
     */
    private Qyryxx ljtbr;
    
    /**
     * 揽件信息所包含的寄递品
     */
    private List<Jdpxx> jdp_list;
    
    /**
     *  物流单号
     */
    private String wldh;
    
    /**
     *  添加企业信息，关联查询
     */
    private Qyjbxx qyjbxx;
    /**
     * 是否补件
     */
    private String sfbj;
    /*
     * 删除标志位
     */
    private String scbzw;
    
    //用于查询时用到的对象---寄递品对象
    private Jdpxx jdpxx;
    /**
	 * 可疑标志
	 */
	private String kybz;
	
	public String getKybz() {
		return kybz;
	}
	public void setKybz(String kybz) {
		this.kybz = kybz;
	}
    
	//查询列表需要的值
    private String jjrxm;//寄件人姓名
	private String jjrzjlx;//寄件人证件类型
    private String jjrzjhm;//寄件人证件号码
    private String ljyxm;//揽件人姓名
    private String ywcxbz;//业务查询标志
	
    
    //公安端寄递品信息查询列表需要字段
    private String qymc;//企业名称
    private String sjrxm;//收件人姓名
    private String jdpdlxmc;//寄递品大类型名称
    private String jdplxmc;//寄递品小类型名称
    private String jdpmc;  //寄递品名称
    private Integer jdpxxid; //寄递品信息ID
    
    /*
     * 公安端、企业端查询区别标志
     */
    private String gadqydcxqbbz;
    
    /*
	 * 主页面按时间查询时用到
	 */
    private Date ljsjf;//开始时间
    private Date ljsjt;//截止时间
    private String sjkzbz;//根据时间来判断是否可删除修改
    private String sfpjbz;//是否标志位
    
	private String jjrzpxx;//寄件人照片信息
    private String sjrzpxx;//收件人照片信息
    
   
    public String getJjrzpxx() {
		return jjrzpxx;
	}
	public void setJjrzpxx(String jjrzpxx) {
		this.jjrzpxx = jjrzpxx;
	}
	public String getSjrzpxx() {
		return sjrzpxx;
	}
	public void setSjrzpxx(String sjrzpxx) {
		this.sjrzpxx = sjrzpxx;
	}
	public String getSfpjbz() {
		return sfpjbz;
	}
	public void setSfpjbz(String sfpjbz) {
		this.sfpjbz = sfpjbz;
	}
	public String getSjkzbz() {
		return sjkzbz;
	}
	public void setSjkzbz(String sjkzbz) {
		this.sjkzbz = sjkzbz;
	}
	public Date getLjsjf() {
		return ljsjf;
	}
	public void setLjsjf(Date ljsjf) {
		this.ljsjf = ljsjf;
	}
	public Date getLjsjt() {
		return ljsjt;
	}
	public void setLjsjt(Date ljsjt) {
		this.ljsjt = ljsjt;
	}

	


	public String getGadqydcxqbbz() {
		return gadqydcxqbbz;
	}

	public void setGadqydcxqbbz(String gadqydcxqbbz) {
		this.gadqydcxqbbz = gadqydcxqbbz;
	}

	public Integer getJdpxxid() {
		return jdpxxid;
	}

	public void setJdpxxid(Integer jdpxxid) {
		this.jdpxxid = jdpxxid;
	}

	public String getJdpmc() {
		return jdpmc;
	}

	public void setJdpmc(String jdpmc) {
		this.jdpmc = jdpmc;
	}

	public String getYwcxbz() {
		return ywcxbz;
	}

	public void setYwcxbz(String ywcxbz) {
		this.ywcxbz = ywcxbz;
	}
    public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public String getSjrxm() {
		return sjrxm;
	}
	public void setSjrxm(String sjrxm) {
		this.sjrxm = sjrxm;
	}
	public String getJdpdlxmc() {
		return jdpdlxmc;
	}
	public void setJdpdlxmc(String jdpdlxmc) {
		this.jdpdlxmc = jdpdlxmc;
	}
	public String getJdplxmc() {
		return jdplxmc;
	}
	public void setJdplxmc(String jdplxmc) {
		this.jdplxmc = jdplxmc;
	}
    public Jdpxx getJdpxx() {
		return jdpxx;
	}
	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}
    public String getJjrxm() {
		return jjrxm;
	}
	public void setJjrxm(String jjrxm) {
		this.jjrxm = jjrxm;
	}
	public String getJjrzjlx() {
		return jjrzjlx;
	}
	public void setJjrzjlx(String jjrzjlx) {
		this.jjrzjlx = jjrzjlx;
	}
	public String getJjrzjhm() {
		return jjrzjhm;
	}
	public void setJjrzjhm(String jjrzjhm) {
		this.jjrzjhm = jjrzjhm;
	}
	public String getLjyxm() {
		return ljyxm;
	}
	public void setLjyxm(String ljyxm) {
		this.ljyxm = ljyxm;
	}
    
	public String getScbzw() {
		return scbzw;
	}
	public void setScbzw(String scbzw) {
		this.scbzw = scbzw;
	}
	public String getSfbj() {
		return sfbj;
	}
	public void setSfbj(String sfbj) {
		this.sfbj = sfbj;
	}
	public Qyjbxx getQyjbxx() {
		return qyjbxx;
	}
	public void setQyjbxx(Qyjbxx qyjbxx) {
		this.qyjbxx = qyjbxx;
	}
	public String getWldh() {
		return wldh;
	}
	public void setWldh(String wldh) {
		this.wldh = wldh;
	}
	public List<Jdpxx> getJdp_list() {
		return jdp_list;
	}
	public void setJdp_list(List<Jdpxx> jdp_list) {
		this.jdp_list = jdp_list;
	}
	public String getDjxh() {
		return djxh;
	}
	public void setDjxh(String djxh) {
		this.djxh = djxh;
	}
	public Rdrjbxx getJjr() {
		return jjr;
	}
	public void setJjr(Rdrjbxx jjr) {
		this.jjr = jjr;
	}
	public Rdrjbxx getSjr() {
		return sjr;
	}
	public void setSjr(Rdrjbxx sjr) {
		this.sjr = sjr;
	}
	public Qyryxx getLjr() {
		return ljr;
	}
	public void setLjr(Qyryxx ljr) {
		this.ljr = ljr;
	}
	public Date getLjsj() {
		return ljsj;
	}
	public void setLjsj(Date ljsj) {
		this.ljsj = ljsj;
	}
	public Date getLjtbsj() {
		return ljtbsj;
	}
	public void setLjtbsj(Date ljtbsj) {
		this.ljtbsj = ljtbsj;
	}
	public Qyryxx getLjtbr() {
		return ljtbr;
	}
	public void setLjtbr(Qyryxx ljtbr) {
		this.ljtbr = ljtbr;
	}
    
    
}
