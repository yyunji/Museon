package com.museon.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museon.Dao.TestDao;

@Service("testService")
public class TestService {
	@Autowired
	TestDao testDao;
	
	public List<Map<String, Object>> test () {
		return testDao.test();
	}
	
//	public int test () {
//		return 0;
//	}
}
