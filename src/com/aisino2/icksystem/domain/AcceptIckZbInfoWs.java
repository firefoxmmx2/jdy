package com.aisino2.icksystem.domain;

import java.util.List;

import com.aisino2.icksystem.domain.Icksl;
import com.aisino2.icksystem.domain.Ickzb;
import com.aisino2.core.domain.BaseObject;

public class AcceptIckZbInfoWs extends BaseObject {
  
  private Ickzb  ickzb;
  private List ickslList;
public List getIckslList() {
	return ickslList;
}

public void setIckslList(List ickslList) {
	this.ickslList = ickslList;
}



public Ickzb getIckzb() {
	return ickzb;
}

public void setIckzb(Ickzb ickzb) {
	this.ickzb = ickzb;
}



	
}
