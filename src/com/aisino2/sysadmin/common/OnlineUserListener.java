package com.aisino2.sysadmin.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;

import com.aisino2.sysadmin.domain.OnlineUser;

public class OnlineUserListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
        ServletContext application = session.getServletContext();
        List onlineUsersList=(ArrayList)application.getAttribute("ONLINEUSERSLIST");
        if(onlineUsersList!=null){
        	String sessionID=session.getId();
        	for(int i=0;i<onlineUsersList.size();i++){
        		if(sessionID.equals(((OnlineUser)onlineUsersList.get(i)).getSessionID()))
        				onlineUsersList.remove(i);
        	}
        }
        application.setAttribute("ONLINEUSERSLIST", onlineUsersList);
	}

}
