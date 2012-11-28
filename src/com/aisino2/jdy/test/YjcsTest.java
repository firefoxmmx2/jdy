package com.aisino2.jdy.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.aisino2.jdy.dao.IYjcsDao;
import com.aisino2.jdy.domain.Yjcs;

public class YjcsTest {
	private ApplicationContext context;
	@Before
	public void setUp()  {
		String[] resources = new String[]{
				"/config/spring/applicationContext.xml",
				"/config/spring/applicationContext-jdy.xml",
				"/config/spring/jdy-dao.xml"
		};
		context = new ClassPathXmlApplicationContext(resources);
	}

	@Test
	public void test() throws SQLException {
		IYjcsDao yjcsDao = (IYjcsDao)context.getBean("YjcsDaoImpl");
		try{
			
			Yjcs yjcs = new Yjcs();
			yjcs.setYjmc("测试");
			yjcs.setYjxxms("测试2");
			yjcs.setYhlb("222");
			yjcs.setYjgzsj("0 0/5 0 * * ? * *");
			yjcs.setCjr("测试3");
			yjcs.setYjyj("select count(1) TOTAL from t_ljjbxx");
			yjcsDao.insert(yjcs);
			List yjcslist = yjcsDao.query(null);
			assertEquals(yjcslist.size(), 1);
			Map map = (Map) yjcsDao.querySQL(yjcs.getYjyj()).get(0);
			System.out.println(map);
			assertNotNull(map.get("TOTAL"));
		}
		finally{
			yjcsDao.remove(null);
			System.out.println(1);
		}
		
	}

}
