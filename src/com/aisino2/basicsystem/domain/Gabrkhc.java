package com.aisino2.basicsystem.domain;

import java.lang.reflect.Proxy;
import java.net.MalformedURLException;

import org.codehaus.xfire.XFire;
import org.codehaus.xfire.XFireFactory;
import org.codehaus.xfire.client.Client;
import org.codehaus.xfire.client.XFireProxy;
import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.service.binding.ObjectServiceFactory;
import org.codehaus.xfire.transport.http.HttpTransport;

import com.neusoft.webservice.PopulationServicePortType;

public class Gabrkhc {
	
	private String m_serviceUrl;

	public Gabrkhc(){

	}
	
	public String getM_serviceUrl() {
		return m_serviceUrl;
	}

	public void setM_serviceUrl(String url) {
		m_serviceUrl = url;
	}
	 
}
