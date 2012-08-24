package com.aisino2.jdy.service;

import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Pjjbxx;

public interface IJdyBjService {
	void insertJdyBjxx(Ljjbxx ljjbxx);
	void insertJdyBjxx(Pjjbxx pjjbxx);
	
	void closeFanBjbd(Ljjbxx ljjbxx);
	void closeFanBjbd(Pjjbxx pjjbxx);
}
