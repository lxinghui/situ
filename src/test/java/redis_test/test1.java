package redis_test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.util.IOUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import entity.Activity;
import redis.RedisCommand;
import service.ActivityService;
import service.ActivityTimeService;
import service.Activity_school_Service;
import service.CheckworkService;
import service.CollegeService;
import service.OperatorService;
import service.UserService;
import utils.POIUtil;

public class test1 extends BasicTest {

	@Resource(name = "ActivityServiceImpl")
	ActivityService service;
	@Resource(name = "College_ServiceImpl")
	CollegeService cservice;
	@Resource(name = "Activity_school_ServiceImpl")
	Activity_school_Service sservice;
	@Resource(name = "User_ServiceImpl")
	UserService uservice;
	@Resource(name = "Operator_ServiceImpl")
	OperatorService oservice;
	@Resource(name = "CheckworkServiceImpl")
	CheckworkService wservice;
	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService tservice;
	Activity a = new Activity();

	@Autowired
	RedisCommand<String, Object> ds;

	@Test
	public void ddd() throws IOException {

//		File file = new File("D:/book.xlsx");
//		FileInputStream input = new FileInputStream(file);
//		MultipartFile multipartFile = new MockMultipartFile("file", file.getName(), "text/plain",
//				IOUtils.toByteArray(input));
//		List<String[]> list = POIUtil.readExcel(multipartFile);
//		System.out.println(list.size());
//		for(String[] s:list) {
//			System.out.println(s[0]);
//		}
		int id = 1;
		System.out.println("+++++"+service.selectById(id).getC_name());
		
	}

}
